import 'package:flutter_test/flutter_test.dart';
import 'package:miner_field/models/board.dart';

main() {
  group('Board', () {
    test('win a game', () {
      Board board = Board(lines: 2, columns: 2, numberOfBombs: 0);
      board.fields[0].mine();
      board.fields[3].mine();

      // playing
      board.fields[0].toggleMark();
      board.fields[1].open();

      board.fields[2].open();
      board.fields[3].toggleMark();

      expect(board.resolved, isTrue);
    });
  });
}
