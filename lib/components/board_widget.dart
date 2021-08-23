import 'package:flutter/material.dart';
import 'package:miner_field/components/field_widget.dart';
import 'package:miner_field/models/board.dart';
import 'package:miner_field/models/field.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onToggleMark;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.onOpen,
    required this.onToggleMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.fields.map((field) {
          return FieldWidget(
            field: field,
            onOpen: onOpen,
            toggleMark: onToggleMark,
          );
        }).toList(),
      ),
    );
  }
}
