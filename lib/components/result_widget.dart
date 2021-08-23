import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool won;
  final bool finished;
  final void Function() onReset;

  const ResultsWidget(
      {Key? key,
      required this.won,
      required this.onReset,
      required this.finished})
      : super(key: key);

  Color? _getColor() {
    if (finished == false) {
      return Colors.yellow;
    } else if (won) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcon() {
    if (finished == false) {
      return Icons.sentiment_satisfied;
    } else if (won) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: onReset,
                icon: Icon(
                  _getIcon(),
                  color: Colors.black,
                  size: 35,
                )),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
