import 'package:flutter/material.dart';

class PositionedConstraintsExample extends StatelessWidget {
  const PositionedConstraintsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Positioned Constraints')),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.grey[200],
          child: Stack(
            children: [
              // Full width positioned
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Container(
                  height: 40,
                  color: Colors.blue,
                  child: const Center(child: Text('Full Width')),
                ),
              ),
              // Fixed height and width
              Positioned(
                top: 60,
                left: 50,
                width: 100,
                height: 30,
                child: Container(
                  color: Colors.green,
                  child: const Center(child: Text('Fixed Size')),
                ),
              ),
              // 20px from sides
              Positioned(
                top: 100,
                left: 20,
                right: 20,
                height: 40,
                child: Container(
                  color: Colors.orange,
                  child: const Center(child: Text('20px from sides')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
