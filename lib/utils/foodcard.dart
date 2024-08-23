import 'package:flutter/material.dart';
import 'package:recipedia/utils/styles.dart';

class Foodcard extends StatelessWidget {
  final bool win;
  final String imgUrl;
  final String name;
  final String cuisine;
  final String type;
  const Foodcard({super.key, this.win=false, required this.name, required this.imgUrl, required this.cuisine, required this.type});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: win==false?size.width*0.4:size.width*0.8,
      height: win==false?220:280,
      decoration: BoxDecoration(
        color: Stylings.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Stylings.subHeader.copyWith(fontSize: 10),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cuisine, style: Stylings.lilgreyText.copyWith(fontSize: 10),),
                  const SizedBox(width: 5,),
                  Text(":", style: Stylings.lilgreyText.copyWith(fontSize: 10),),
                  const SizedBox(width: 5,),
                  Text(type, style: Stylings.lilgreyText.copyWith(fontSize: 10),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
