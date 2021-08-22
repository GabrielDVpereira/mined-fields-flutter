import 'package:miner_field/models/explosion_exeption.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mined = false;
  bool _explosed = false;

  Field({
    required this.line,
    required this.column,
  });

  void addNeighboors(Field neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    final bool isNeighbor = deltaLine <= 1 && deltaColumn <= 1;
    final bool isSameField = deltaLine == 0 && deltaColumn == 0;

    if (!isNeighbor || isSameField) return;

    neighbors.add(neighbor);
  }

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_mined) {
      _explosed = true;
      throw ExplosionExeption();
    }

    if (safeNeightbor) {
      neighbors.forEach((v) => v.open());
    }
  }

  void unveilBombs() {
    if (_mined) {
      _opened = true;
    }
  }

  void mine() {
    _mined = true;
  }

  void reset() {
    _opened = false;
    _marked = false;
    _mined = false;
    _explosed = false;
  }

  void toggleMark() {
    _marked = !_marked;
  }

  bool get mined {
    return _mined;
  }

  bool get marked {
    return _marked;
  }

  bool get explosed {
    return _explosed;
  }

  bool get opened {
    return _opened;
  }

  bool get resolved {
    bool minedAndMarked = mined && marked;
    bool safeAndOpened = !mined && opened;
    return minedAndMarked || safeAndOpened;
  }

  bool get safeNeightbor {
    return neighbors.every((v) => !v.mined);
  }

  int get numberOfMinesOnNeighborhood {
    return neighbors.where((n) => n.mined).length;
  }
}
