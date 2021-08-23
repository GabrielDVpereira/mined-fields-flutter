import 'package:flutter/material.dart';
import 'package:miner_field/components/board_widget.dart';
import 'package:miner_field/components/result_widget.dart';
import 'package:miner_field/models/explosion_exeption.dart';
import 'package:miner_field/models/field.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({Key? key}) : super(key: key);

  void _reset() {
    print('reset...');
  }

  void _open(Field field) {}

  void _toggleMark(Field field) {}

  @override
  Widget build(BuildContext context) {
    Field field = Field(column: 0, line: 0);

    try {
      // field.toggleMark();
    } on ExplosionExeption {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultsWidget(
          won: true,
          onReset: _reset,
          finished: false,
        ),
        body: Container(
          child: FieldWidget(
            field: field,
            onOpen: _open,
            toggleMark: _toggleMark,
          ),
        ),
      ),
    );
  }
}
