import 'dart:math';

import 'package:miner_field/models/field.dart';

class Board {
  final int lines;
  final int columns;
  final int numberOfBombs;

  final List<Field> _fields = [];

  Board({
    required this.lines,
    required this.columns,
    required this.numberOfBombs,
  }) {
    _createFields();
    _connectNeighbors();
    _createRandomMines();
  }

  void _createFields() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _connectNeighbors() {
    for (Field field in _fields) {
      for (Field neighbor in _fields) {
        field.addNeighboors(neighbor);
      }
    }
  }

  void unveildBombs() {
    _fields.forEach((field) => field.unveilBomb());
  }

  void reset() {
    _fields.forEach((field) => field.reset());
    _createRandomMines();
  }

  void _createRandomMines() {
    int randomMines = 0;

    if (numberOfBombs > lines * columns) {
      return;
    }
    while (randomMines < numberOfBombs) {
      int i = Random().nextInt(_fields.length);

      if (_fields[i].mined) {}
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get resolved {
    return _fields.every((field) => field.resolved);
  }
}
