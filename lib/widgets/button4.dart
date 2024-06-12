import 'package:flutter/material.dart';
import 'dart:math';

class Button4 extends StatelessWidget {
  final void Function(double) onResult; // Callback function to pass the result

  Button4({required this.onResult});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50, // Increase the height of the button
      child: ElevatedButton(
        onPressed: () async {
          final double? volume = await showDialog<double>(
            context: context,
            builder: (context) {
              final TextEditingController _aController =
                  TextEditingController();
              final TextEditingController _bController =
                  TextEditingController();
              final TextEditingController _cController =
                  TextEditingController();
              final TextEditingController _dController =
                  TextEditingController();

              return AlertDialog(
                title: Text('Nhập thông tin tường hình thang:'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _aController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Cạnh cao'),
                    ),
                    TextField(
                      controller: _bController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Cạnh thấp'),
                    ),
                    TextField(
                      controller: _cController,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: 'Khoảng cách giữa 2 cạnh'),
                    ),
                    TextField(
                      controller: _dController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Độ dày'),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final double? a = double.tryParse(_aController.text);
                      final double? b = double.tryParse(_bController.text);
                      final double? c = double.tryParse(_cController.text);
                      final double? d = double.tryParse(_dController.text);

                      if (a != null && b != null && c != null && d != null) {
                        final double result =
                            sqrt(pow(a - b, 2) + pow(c, 2)) * d + (a + b) * c;
                        Navigator.of(context).pop(result);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter valid numbers')),
                        );
                      }
                    },
                    child: Text('Confirm'),
                  ),
                ],
              );
            },
          );

          if (volume != null) {
            onResult(volume);
            print('Volume from Button4: $volume');
          }
        },
        child: Text(
          'Thông tin tường',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
