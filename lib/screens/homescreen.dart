import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:recipedia/models/usermodel.dart';
import 'package:recipedia/recipepage.dart';
import 'package:recipedia/services/apiservices.dart';
import 'package:recipedia/utils/filtercards.dart';
import 'package:recipedia/utils/foodcard.dart';
import 'package:recipedia/utils/rowheaders.dart';
import 'package:recipedia/utils/styles.dart';

import '../models/recipemodel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<Recipe> allRecipesBody;

  @override
  void initState() {
    allRecipesBody = getRecipes();
    //print(allRecipesBody);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            //greetings
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Intro
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Anne",
                        style: Stylings.lilgreyText,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "What would you like\nto cook today?",
                        style: Stylings.header,
                      ),
                    ],
                  ),
                  //pfp
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage(("${Stylings.imgPath}/pfp.jpg")),
                            fit: BoxFit.cover)),
                    //child: Image.asset("assets/images/market.jpg", fit: BoxFit.cover,),
                  ),
                ],
              ),
            ),
            //search
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 40,
              child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        FluentIcons.filter_32_regular,
                        size: 14,
                        color: Stylings.lightblack,
                      ),
                      contentPadding: EdgeInsets.only(left: 10),
                      prefixIcon: Icon(
                        FluentIcons.search_32_regular,
                        size: 14,
                        color: Stylings.lightblack,
                      ),
                      fillColor: Colors.white,
                      hintText: "Search any recipe",
                      hintStyle: Stylings.lilgreyText,
                      border: OutlineInputBorder(borderSide: BorderSide.none))),
            ),
            const SizedBox(
              height: 20,
            ),
            //categories
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Rowhearders(title: "Categories", route: "allrecipes"),
                    SizedBox(
                      width: size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...Anne.filters.entries.map((aFilter) {
                              return Filtercards(
                                title: aFilter.key,
                                imgUrl: aFilter.value,
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            //Recomendations
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Rowhearders(title: "Recommendation", route: "allrecipes"),
                    SizedBox(
                      width: size.width,
                      child: FutureBuilder(
                        future: allRecipesBody,
                        builder: (context, snapshot) {
                          if (snapshot.hasError ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              snapshot.data == null) {
                            return Center(
                                child: Text("...", style: Stylings.subHeader));
                          }
                          final recipes = snapshot.data!.recipes;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...recipes.take(6).map((aRecipe) {
                                  final rName = aRecipe.name!;
                                  final rPic = aRecipe.image!;
                                  final rCusine = aRecipe.cuisine!;
                                  final rtype = aRecipe.mealType![0];
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return Recipepage(theRecipe: aRecipe);
                                        }));
                                      },
                                      child: Foodcard(
                                        name: rName,
                                        imgUrl: rPic,
                                        cuisine: rCusine,
                                        type: rtype,
                                      ));
                                })
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            //Recipe of the week
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Rowhearders(
                        title: "Recipes of The Week", route: "allrecipes"),
                    SizedBox(
                      width: size.width,
                      child: FutureBuilder(
                        future: allRecipesBody,
                        builder: (context, snapshot) {
                          if (snapshot.hasError ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              snapshot.data == null) {
                            return Center(
                                child: Text("...", style: Stylings.subHeader));
                          }
                          final recipes = snapshot.data!.recipes;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...recipes.map((aRecipe) {
                                  final rName = aRecipe.name!;
                                  final rPic = aRecipe.image!;
                                  final rCusine = aRecipe.cuisine!;
                                  final rtype = aRecipe.mealType![0];
                                  if (aRecipe.id! >= 25) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (_) {
                                            return Recipepage(
                                                theRecipe: aRecipe);
                                          }));
                                        },
                                        child: Foodcard(
                                          name: rName,
                                          imgUrl: rPic,
                                          cuisine: rCusine,
                                          type: rtype,
                                          win: true,
                                        ));
                                  }
                                  else{return Container();}
                                })
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
