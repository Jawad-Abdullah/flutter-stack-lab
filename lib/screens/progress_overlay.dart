import 'package:flutter/material.dart';

class ProgressOverlay extends StatefulWidget {
  const ProgressOverlay({super.key});

  @override
  State<ProgressOverlay> createState() => _ProgressOverlayState();
}

class _ProgressOverlayState extends State<ProgressOverlay> {
  bool _showProgress = false;

  void _toggleProgress() {
    setState(() {
      _showProgress = !_showProgress;
    });
    if (_showProgress) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _showProgress = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Overlay')),
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('List Item ${index + 1}'),
                        subtitle: Text('This is item number ${index + 1}'),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _toggleProgress,
                  child: const Text('Simulate Loading'),
                ),
              ),
            ],
          ),
          // Progress Overlay
          if (_showProgress)
            Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Loading...'),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
