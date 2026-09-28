import 'package:flutter/material.dart';

class StackAlignmentExample extends StatelessWidget {
  const StackAlignmentExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Alignment')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStackSection('Alignment.topLeft', Alignment.topLeft),
            _buildStackSection('Alignment.center', Alignment.center),
            _buildStackSection('Alignment.bottomRight', Alignment.bottomRight),
          ],
        ),
      ),
    );
  }

  Widget _buildStackSection(String title, Alignment alignment) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            height: 100,
            color: Colors.grey[200],
            child: Stack(
              alignment: alignment,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                ),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
