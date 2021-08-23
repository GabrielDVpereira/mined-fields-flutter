import 'package:flutter/material.dart';
import 'package:miner_field/components/result_widget.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({Key? key}) : super(key: key);

  void _reset() {
    print('reset...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultsWidget(
          won: true,
          onReset: _reset,
          finished: false,
        ),
        body: Container(
          child: Text('Board'),
        ),
      ),
    );
  }
}
