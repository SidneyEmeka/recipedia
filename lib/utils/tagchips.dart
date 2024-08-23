import 'package:flutter/material.dart';
import 'package:recipedia/utils/styles.dart';

class Tagchips extends StatelessWidget {
  final String tag;
  const Tagchips({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child:  Card(
        color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(tag, style: Stylings.lilgreyText.copyWith(color: Stylings.lightblack),),
          )),

    );
  }
}
