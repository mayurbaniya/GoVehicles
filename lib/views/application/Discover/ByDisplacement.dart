import 'package:flutter/material.dart';

class ByDisplacement extends StatefulWidget {
  const ByDisplacement({super.key});

  @override
  State<ByDisplacement> createState() => _ByDisplacementState();
}

class _ByDisplacementState extends State<ByDisplacement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('discover by Displacement page'),
            ],
          ),
        ),
    );
  }
}