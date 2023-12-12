import 'package:flutter/material.dart';

class ByBudget extends StatefulWidget {
  const ByBudget({super.key});

  @override
  State<ByBudget> createState() => _ByBudgetState();
}

class _ByBudgetState extends State<ByBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('discover by budget page'),
          ],
        ),
      ),
    );
  }
}
