import 'package:flutter/material.dart';
import 'widgets/button1.dart';
import 'widgets/button2.dart';
import 'widgets/button3.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double totalResult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diện tích xung quanh tòa nhà'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button1(
              onResult: (double result) {
                setState(() {
                  totalResult = result + totalResult;
                });
              },
            ),
            SizedBox(height: 20), // Add space between buttons
            Button2(
              onResult: (double result) {
                setState(() {
                  totalResult = -result + totalResult;
                });
              },
            ),
            SizedBox(height: 20), // Add space between buttons
            Button3(
              onResult: (double result) {
                setState(() {
                  totalResult = result + totalResult;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Tổng phần diện tích phải làm: $totalResult m2',
              style: TextStyle(fontSize: 20),
            ), // Hiển thị tổng kết quả cuối cùng
          ],
        ),
      ),
    );
  }
}
