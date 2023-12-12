

import 'package:flutter/material.dart';
import 'package:gov/views/Components/Drawer.dart';

class CheckUpdate extends StatefulWidget {
  const CheckUpdate({super.key});

  @override
  State<CheckUpdate> createState() => _CheckUpdateState();
}

class _CheckUpdateState extends State<CheckUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text('Update Page desu', style: TextStyle(color: Colors.redAccent),),
        ),
      ),
    );
  }
}