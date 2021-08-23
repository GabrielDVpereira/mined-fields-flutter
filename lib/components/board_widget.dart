import 'package:flutter/material.dart';
import 'package:miner_field/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) toggleMark;

  const FieldWidget({
    Key? key,
    required this.field,
    required this.onOpen,
    required this.toggleMark,
  }) : super(key: key);

  Widget _getImage() {
    int numeberOfMines = field.numberOfMinesOnNeighborhood;

    if (field.opened && field.mined && field.explosed) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.opened && field.mined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.opened && numeberOfMines > 0) {
      return Image.asset('assets/images/aberto_$numeberOfMines.jpeg');
    } else if (field.opened) {
      return Image.asset('assets/images/aberto_0.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => toggleMark(field),
      child: _getImage(),
    );
  }
}
