import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,

    required this.seleted,
    this.marginEnd = 0 ,
  }) : super(key: key);

  final bool seleted ;
  final double marginEnd ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 4,
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      decoration: BoxDecoration(
        color: seleted ? const Color(0xFF6A90F2) : const Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}