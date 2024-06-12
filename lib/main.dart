import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giangs App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 60, // Increase height for the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen1()),
                  );
                },
                child: Text(
                  'Diện tích xung quanh tòa nhà',
                  style: TextStyle(fontSize: 20), // Increase font size
                ),
              ),
            ),
            SizedBox(height: 40), // Add space between buttons
            SizedBox(
              width: double.infinity,
              height: 60, // Increase height for the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                },
                child: Text(
                  'Diện tích xung quanh phần tường hình thang(ở đây em mới chỉ làm cho 2 mặt hình thang+ mặt trên)',
                  style: TextStyle(fontSize: 15), // Increase font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
