import 'package:flutter/material.dart';
import 'package:recipedia/utils/styles.dart';

class Rowhearders extends StatelessWidget {
  final String title;
  final String route;

  const Rowhearders({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style:
            Stylings.subHeader,
          ),
          InkWell(
              onTap: ()=>Navigator.pushNamed(context, route),
              child: Text("See all", style: Stylings.lilgreyText.copyWith(color: Stylings.main,fontSize: 10))),
        ],
      ),
    );
  }
}
