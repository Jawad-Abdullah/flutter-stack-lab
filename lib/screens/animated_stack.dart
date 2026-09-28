import 'package:flutter/material.dart';

class AnimatedStackExample extends StatefulWidget {
  const AnimatedStackExample({super.key});

  @override
  State<AnimatedStackExample> createState() => _AnimatedStackExampleState();
}

class _AnimatedStackExampleState extends State<AnimatedStackExample> {
  int _currentIndex = 0;
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Stack')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tap the card to switch',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _nextCard,
              child: SizedBox(
                width: 300,
                height: 400,
                child: Stack(
                  children: [
                    for (int i = 0; i < _colors.length; i++)
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        top: i == _currentIndex ? 0 : 20,
                        left: i == _currentIndex ? 0 : 10,
                        right: i == _currentIndex ? 0 : 10,
                        bottom: i == _currentIndex ? 0 : 20,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: _colors[i],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Card ${i + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
