import 'package:flutter/material.dart';

class FloatingActionMenu extends StatefulWidget {
  const FloatingActionMenu({super.key});

  @override
  State<FloatingActionMenu> createState() => _FloatingActionMenuState();
}

class _FloatingActionMenuState extends State<FloatingActionMenu> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Floating Action Menu')),
      body: Stack(
        children: [
          // Background Content
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item ${index + 1}'),
                subtitle: Text('This is item number ${index + 1}'),
              );
            },
          ),
          // Floating Action Menu
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_isExpanded) ...[
                  _buildFloatingActionButton(
                    Icons.photo,
                    'Add Photo',
                    Colors.green,
                    () => _showMessage('Add Photo'),
                  ),
                  const SizedBox(height: 10),
                  _buildFloatingActionButton(
                    Icons.video_call,
                    'Start Video',
                    Colors.purple,
                    () => _showMessage('Start Video'),
                  ),
                  const SizedBox(height: 10),
                  _buildFloatingActionButton(
                    Icons.location_on,
                    'Share Location',
                    Colors.orange,
                    () => _showMessage('Share Location'),
                  ),
                  const SizedBox(height: 10),
                ],
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: AnimatedRotation(
                    turns: _isExpanded ? 0.125 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(_isExpanded ? Icons.close : Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(
      IconData icon, String label, Color color, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        FloatingActionButton.small(
          heroTag: label,
          onPressed: onPressed,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
      ],
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$message clicked')),
    );
  }
}
