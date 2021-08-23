import 'package:flutter/material.dart';
import 'package:miner_field/components/board_widget.dart';
import 'package:miner_field/components/field_widget.dart';
import 'package:miner_field/components/result_widget.dart';
import 'package:miner_field/models/board.dart';
import 'package:miner_field/models/explosion_exeption.dart';
import 'package:miner_field/models/field.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({Key? key}) : super(key: key);

  void _reset() {
    print('reset...');
  }

  void _open(Field field) {
    print('open...');
  }

  void _toggleMark(Field field) {
    print('toggle mark...');
  }

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
          child: BoardWidget(
            board: Board(
              columns: 15,
              lines: 15,
              numberOfBombs: 0,
            ),
            onOpen: _open,
            onToggleMark: _toggleMark,
          ),
        ),
      ),
    );
  }
}
