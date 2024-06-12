import 'package:flutter/material.dart';
import 'input_dialog2.dart'; // Import the new input dialog

class Button2 extends StatelessWidget {
  final void Function(double) onResult; // Callback function to pass the result

  Button2({
    required this.onResult,
  }); // Constructor to initialize the callback function

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Make the button full-width
      height: 30, // Increase the height of the button
      child: ElevatedButton(
        onPressed: () async {
          // Show the input dialog and wait for confirmation
          final result = await showDialog<double>(
            context: context,
            builder: (context) {
              return InputDialog2();
            },
          );

          if (result != null) {
            // Pass the result to the callback function
            onResult(result);
          }
        },
        child: Text(
          'Thông số cửa (nhiều loại nhập nhiều lần)',
          style: TextStyle(fontSize: 20), // Increase the font size
        ),
      ),
    );
  }
}
