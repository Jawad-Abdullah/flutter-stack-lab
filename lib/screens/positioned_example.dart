import 'package:flutter/material.dart';

class PositionedExample extends StatelessWidget {
  const PositionedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Positioned Widget')),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey[200],
          child: Stack(
            children: [
              // Top Left
              Positioned(
                top: 20,
                left: 20,
                child: _buildPositionedBox(Colors.red, 'Top\nLeft'),
              ),
              // Top Right
              Positioned(
                top: 20,
                right: 20,
                child: _buildPositionedBox(Colors.green, 'Top\nRight'),
              ),
              // Bottom Left
              Positioned(
                bottom: 20,
                left: 20,
                child: _buildPositionedBox(Colors.blue, 'Bottom\nLeft'),
              ),
              // Bottom Right
              Positioned(
                bottom: 20,
                right: 20,
                child: _buildPositionedBox(Colors.orange, 'Bottom\nRight'),
              ),
              // Center
              Positioned(
                top: 125,
                left: 125,
                child: _buildPositionedBox(Colors.purple, 'Center'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPositionedBox(Color color, String text) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
