import 'package:flutter/material.dart';

class Button3 extends StatelessWidget {
  final void Function(double) onResult; // Callback function to pass the result

  Button3(
      {required this.onResult}); // Constructor to initialize the callback function

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Make the button full-width
      height: 30, // Increase the height of the button
      child: ElevatedButton(
        onPressed: () async {
          // Show the input dialog for the quantity of Cua and wait for confirmation
          final quantity = await showDialog<int>(
            context: context,
            builder: (context) {
              return QuantityInputDialog(); // Using QuantityInputDialog here
            },
          );

          if (quantity != null) {
            double tongabc = 0;
            for (int i = 0; i < quantity; i++) {
              // Show the input dialog for each Cua and wait for confirmation
              final result = await showDialog<Map<String, double>>(
                context: context,
                builder: (context) {
                  return InputDialog3();
                },
              );

              if (result != null) {
                // Check if result contains 'a', 'b', and 'c' keys
                if (result.containsKey('a') &&
                    result.containsKey('b') &&
                    result.containsKey('c')) {
                  // Access and calculate 'a', 'b', 'c' values from result
                  final double a = result['a']!;
                  final double b = result['b']!;
                  final double c = result['c']!;
                  tongabc += a * b * c * 2;
                } else {
                  // Handle case where result does not contain 'a', 'b', 'c'
                  print('Error: Invalid data in result');
                }
              }
            }

            // Pass the total volume to the callback function
            onResult(tongabc);
            // Optionally, perform any action with tongabc here
            print('Tong of abc: $tongabc');
          }
        },
        child: Text(
          'Thông số cột',
          style: TextStyle(fontSize: 20), // Increase the font size
        ),
      ),
    );
  }
}

class QuantityInputDialog extends StatefulWidget {
  @override
  _QuantityInputDialogState createState() => _QuantityInputDialogState();
}

class _QuantityInputDialogState extends State<QuantityInputDialog> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nhập số loại cột khác nhau'),
      content: TextField(
        controller: _quantityController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Số loại:'),
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
            final quantity = int.tryParse(_quantityController.text);
            if (quantity != null && quantity > 0) {
              Navigator.of(context).pop(quantity);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please enter a valid quantity')),
              );
            }
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

class InputDialog3 extends StatefulWidget {
  @override
  _InputDialog3State createState() => _InputDialog3State();
}

class _InputDialog3State extends State<InputDialog3> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thông tin từng loại cột'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _aController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Số lượng'),
          ),
          TextField(
            controller: _bController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Chiều cao'),
          ),
          TextField(
            controller: _cController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Chiều rộng'),
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
            final a = double.tryParse(_aController.text);
            final b = double.tryParse(_bController.text);
            final c = double.tryParse(_cController.text);
            if (a != null && b != null && c != null) {
              // Trả về một Map chứa các giá trị 'a', 'b', và 'c'
              Navigator.of(context).pop({'a': a, 'b': b, 'c': c});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Please enter valid values for a, b, and c')),
              );
            }
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
