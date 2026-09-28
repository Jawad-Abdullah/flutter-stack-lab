import 'package:flutter/material.dart';

class StackFitExample extends StatelessWidget {
  const StackFitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Fit Property')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFitSection('StackFit.loose', StackFit.loose),
            _buildFitSection('StackFit.expand', StackFit.expand),
            _buildFitSection('StackFit.passthrough', StackFit.passthrough),
          ],
        ),
      ),
    );
  }

  Widget _buildFitSection(String title, StackFit fit) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            width: 200,
            height: 60,
            color: Colors.grey[300],
            child: Stack(
              fit: fit,
              children: [
                Container(
                  color: Colors.blue,
                  child: const Text('Background'),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    color: Colors.red,
                    child: const Text('Positioned'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
