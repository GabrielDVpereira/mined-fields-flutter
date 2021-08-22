import 'package:flutter_test/flutter_test.dart';
import 'package:miner_field/models/field.dart';

main() {
  group('Field', () {
    test('open WITH explosion', () {
      Field field = Field(line: 0, column: 0);
      field.mine();
      expect(field.open, throwsException);
    });
    test('open WITHOUT explosion', () {
      Field field = Field(line: 0, column: 0);
      field.open();
      expect(field.opened, isTrue);
    });
    test('add invalid neighbor ', () {
      Field field = Field(line: 0, column: 0);
      Field field2 = Field(line: 1, column: 3);
      field.addNeighboors(field2);

      expect(field.neighbors.isEmpty, isTrue);
    });
    test('add neighbor ', () {
      Field field = Field(line: 0, column: 0);
      Field field2 = Field(line: 0, column: 1);
      Field field3 = Field(line: 1, column: 0);

      field.addNeighboors(field2);
      field.addNeighboors(field3);

      expect(field.neighbors.length, 2);
    });

    test('mined neighbor ', () {
      Field field = Field(line: 0, column: 0);
      Field field2 = Field(line: 0, column: 1);
      field2.mine();
      Field field3 = Field(line: 1, column: 0);

      field.addNeighboors(field2);
      field.addNeighboors(field3);

      expect(field.numberOfMinesOnNeighborhood, 1);
    });
  });
}
