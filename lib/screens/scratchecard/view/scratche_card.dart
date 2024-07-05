import 'package:flutter/material.dart';
import 'package:unk/packages/scratcher/widgets.dart';

class ScratcheCard extends StatefulWidget {
  const ScratcheCard({super.key});

  @override
  State<ScratcheCard> createState() => _ScratcheCardState();
}

class _ScratcheCardState extends State<ScratcheCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scratcher(
          brushSize: 50,
          threshold: 50,
          color: Colors.grey,
          onChange: (value) => print("Scratch progress: $value%"),
          onThreshold: () => print("Threshold reached, you won!"),
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'You Won!',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}