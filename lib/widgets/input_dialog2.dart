import 'package:flutter/material.dart';

class InputDialog2 extends StatefulWidget {
  @override
  _InputDialog2State createState() => _InputDialog2State();
}

class _InputDialog2State extends State<InputDialog2> {
  final TextEditingController _chieuDaiController = TextEditingController();
  final TextEditingController _chieuRongController = TextEditingController();
  final TextEditingController _chieuCaoController = TextEditingController();

  void _confirm(BuildContext context) {
    final double? chieuDai = double.tryParse(_chieuDaiController.text);
    final double? chieuRong = double.tryParse(_chieuRongController.text);
    final double? chieuCao = double.tryParse(_chieuCaoController.text);

    if (chieuDai != null && chieuRong != null && chieuCao != null) {
      Navigator.pop(context, chieuDai * chieuRong * chieuCao);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid numbers')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thông số cửa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _chieuDaiController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Số lượng'),
          ),
          TextField(
            controller: _chieuRongController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Chiều Dài'),
          ),
          TextField(
            controller: _chieuCaoController,
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
            _confirm(context);
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
