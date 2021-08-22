import 'package:flutter/material.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mined Field'),
        ),
        body: Container(
          child: Text('Board'),
        ),
      ),
    );
  }
}
