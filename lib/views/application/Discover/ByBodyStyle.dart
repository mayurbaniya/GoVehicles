import 'package:flutter/material.dart';

class ByBodyStyle extends StatefulWidget {
  const ByBodyStyle({super.key});

  @override
  State<ByBodyStyle> createState() => _ByBodyStyleState();
}

class _ByBodyStyleState extends State<ByBodyStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('discover by body style page'),
          ],
        ),
      ),
    );
  }
}
