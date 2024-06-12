import 'package:flutter/material.dart';
import 'input_dialog.dart'; // Import the input dialog

class Button1 extends StatelessWidget {
  final void Function(double) onResult; // Callback function to pass the result

  Button1(
      {required this.onResult}); // Constructor to initialize the callback function

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Make the button full-width
      height: 30, // Increase the height of the button
      child: ElevatedButton(
        onPressed: () async {
          // Show the input dialog and wait for confirmation
          await showDialog(
            context: context,
            builder: (context) {
              return InputDialog(
                onConfirm:
                    (double chieuDai, double chieuRong, double chieuCao) {
                  // Calculate dtxq using the provided formula
                  double dtxq = chieuDai * chieuRong * chieuCao;
                  // Pass the result to the callback function
                  onResult(dtxq);
                  Navigator.pop(context); // Close the dialog when confirmed
                },
              );
            },
          );
        },
        child: Text(
          'Thông số chung',
          style: TextStyle(fontSize: 20), // Increase the font size
        ),
      ),
    );
  }
}
