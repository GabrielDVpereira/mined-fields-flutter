import 'package:flutter/material.dart';
import 'package:miner_field/components/board_widget.dart';
import 'package:miner_field/components/result_widget.dart';
import 'package:miner_field/models/board.dart';
import 'package:miner_field/models/explosion_exeption.dart';
import 'package:miner_field/models/field.dart';

class MinedFieldApp extends StatefulWidget {
  const MinedFieldApp({Key? key}) : super(key: key);

  @override
  _MinedFieldAppState createState() => _MinedFieldAppState();
}

class _MinedFieldAppState extends State<MinedFieldApp> {
  bool? _won = false;
  Board _board = Board(
    columns: 15,
    lines: 15,
    numberOfBombs: 3,
  );

  void _reset() {
    setState(() {
      _won = null;
      _board.reset();
    });
  }

  void _open(Field field) {
    if (_won != null) return;
    setState(() {
      try {
        field.open();
        if (_board.resolved) {
          _won = true;
        }
      } on ExplosionExeption {
        _won = false;
        _board.unveildBombs();
      }
    });
  }

  void _toggleMark(Field field) {
    if (_won != null) return;
    setState(() {
      field.toggleMark();
      if (_board.resolved) {
        _won = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultsWidget(
          won: _won,
          onReset: _reset,
        ),
        body: Container(
          child: BoardWidget(
            board: _board,
            onOpen: _open,
            onToggleMark: _toggleMark,
          ),
        ),
      ),
    );
  }
}
