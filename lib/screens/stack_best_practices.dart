import 'package:flutter/material.dart';

class StackBestPractices extends StatelessWidget {
  const StackBestPractices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Best Practices')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPracticeItem(
            'Issue: Unbounded Stack',
            'Stack without bounded constraints can cause layout errors',
            _buildProblematicStack(),
            _buildFixedStack(),
          ),
          const SizedBox(height: 20),
          _buildPracticeItem(
            'Issue: Overflowing Content',
            'Positioned widgets extending beyond Stack bounds',
            _buildOverflowingStack(),
            _buildClippedStack(),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeItem(
      String title, String description, Widget problem, Widget solution) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        Text(description),
        const SizedBox(height: 16),
        const Text('Problem:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        problem,
        const SizedBox(height: 16),
        const Text('Solution:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        solution,
      ],
    );
  }

  Widget _buildProblematicStack() {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: Stack(
        children: [
          Container(color: Colors.red),
          const Positioned(top: 50, child: Text('Unbounded height')),
        ],
      ),
    );
  }

  Widget _buildFixedStack() {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: Stack(
        children: [
          Container(color: Colors.green),
          const Positioned(top: 50, child: Text('Fixed height container')),
        ],
      ),
    );
  }

  Widget _buildOverflowingStack() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey[200],
      child: Stack(
        children: [
          Container(color: Colors.blue),
          Positioned(
            left: 80,
            top: 80,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClippedStack() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey[200],
      child: ClipRect(
        child: Stack(
          children: [
            Container(color: Colors.blue),
            Positioned(
              left: 80,
              top: 80,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
