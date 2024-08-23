import 'package:flutter/material.dart';
import 'package:recipedia/utils/styles.dart';

class Ingredienttile extends StatelessWidget {
  final String title;
  const Ingredienttile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("-",style: Stylings.header,),
          ),),
        title: Text(title,style: Stylings.subHeader,),
        trailing: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Icon(Icons.check_circle,color: Stylings.main,),
        ),
      ),
    );
  }
}
