import 'package:flutter/material.dart';
import 'widgets/button4.dart'; // Import Button4
import 'widgets/button5.dart'; // Import Button5

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  double? _totalResult;

  // Handle result from Button4
  void _handleResultFromButton4(double result) {
    setState(() {
      _updateTotalResult(result);
    });
  }

  // Handle result from Button5
  void _handleResultFromButton5(double result) {
    setState(() {
      _updateTotalResult(result);
    });
  }

  // Update the total result
  void _updateTotalResult(double newResult) {
    if (_totalResult == null) {
      _totalResult = newResult;
    } else {
      _totalResult = _totalResult! + newResult;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diện tích xung quanh phần tường hình thang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button4(onResult: _handleResultFromButton4),
            SizedBox(height: 16),
            Button5(onResult: _handleResultFromButton5),
            SizedBox(height: 32),
            if (_totalResult != null)
              Text('Tổng diện tích phải làm: $_totalResult m2',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
