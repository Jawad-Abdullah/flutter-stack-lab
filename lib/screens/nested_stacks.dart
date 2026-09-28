import 'package:flutter/material.dart';

class NestedStacksExample extends StatelessWidget {
  const NestedStacksExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nested Stacks')),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            children: [
              // Background
              Container(
                color: Colors.grey[200],
                child: const Center(child: Text('Background Layer')),
              ),
              // Middle Stack
              Positioned(
                top: 50,
                left: 50,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.blue.withOpacity(0.5),
                        child: const Center(child: Text('Middle Layer')),
                      ),
                      // Inner Stack
                      Positioned(
                        top: 50,
                        left: 50,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.red.withOpacity(0.7),
                                child: const Center(
                                    child: Text('Inner Layer')),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  color: Colors.yellow,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
