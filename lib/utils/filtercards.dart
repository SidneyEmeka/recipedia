import 'package:flutter/material.dart';
import 'package:recipedia/utils/styles.dart';

class Filtercards extends StatelessWidget {
  final String title;
  final String imgUrl;
  const Filtercards({super.key, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: size.width * 0.2,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "${Stylings.imgPath}/$imgUrl",
            fit: BoxFit.contain,
            width: 30,
            height: 30,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: Stylings.lilgreyText
                .copyWith(color: Stylings.deepblack, fontSize: 8),
          ),
        ],
      ),
    );
  }
}
