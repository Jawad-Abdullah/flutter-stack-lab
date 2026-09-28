import 'package:flutter/material.dart';

class BasicStackExample extends StatelessWidget {
  const BasicStackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Stack Example')),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
