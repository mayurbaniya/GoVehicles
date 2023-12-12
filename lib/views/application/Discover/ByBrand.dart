import 'package:flutter/material.dart';

class ByBrand extends StatefulWidget {
  const ByBrand({super.key});

  @override
  State<ByBrand> createState() => _ByBrandState();
}

class _ByBrandState extends State<ByBrand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('discover by Brand page'),
            ],
          ),
        ),
    );
  }
}