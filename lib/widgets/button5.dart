import 'package:flutter/material.dart';

class Button5 extends StatelessWidget {
  final void Function(double) onResult; // Callback function to pass the result

  Button5({required this.onResult});

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
                title: Text(
                    'Nhập thông tin cửa sổ (Nhập nhiều lần với nhiều loại cửa)'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _aController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Số lượng'),
                    ),
                    TextField(
                      controller: _bController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Chiều dài'),
                    ),
                    TextField(
                      controller: _cController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Chiều rộng'),
                    ),
                    TextField(
                      controller: _dController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Độ dày tường'),
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
                        Navigator.of(context)
                            .pop(2 * a * (b * d + c * d - b * c));
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
            print('Volume from Button5: $volume');
          }
        },
        child: Text(
          'Thông tin các cửa sổ',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
