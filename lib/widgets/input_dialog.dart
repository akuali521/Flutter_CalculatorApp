import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  final Function(double, double, double) onConfirm;

  const InputDialog({Key? key, required this.onConfirm}) : super(key: key);

  @override
  _InputDialogState createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final TextEditingController _chieuDaiController = TextEditingController();
  final TextEditingController _chieuRongController = TextEditingController();
  final TextEditingController _chieuCaoController = TextEditingController();

  void _confirm() {
    final double? chieuDai = double.tryParse(_chieuDaiController.text);
    final double? chieuRong = double.tryParse(_chieuRongController.text);
    final double? chieuCao = double.tryParse(_chieuCaoController.text);

    if (chieuDai != null && chieuRong != null && chieuCao != null) {
      widget.onConfirm(chieuDai, chieuRong, chieuCao);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid numbers')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Dimensions'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _chieuDaiController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Chiều Dài'),
          ),
          TextField(
            controller: _chieuRongController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Chiều Rộng'),
          ),
          TextField(
            controller: _chieuCaoController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Chiều Cao'),
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
          onPressed: _confirm,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
