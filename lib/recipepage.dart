import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:recipedia/models/recipemodel.dart';
import 'package:recipedia/utils/ingredienttile.dart';
import 'package:recipedia/utils/styles.dart';
import 'package:recipedia/utils/tagchips.dart';

class Recipepage extends StatelessWidget {
  final RecipeElement theRecipe;

  const Recipepage({super.key, required this.theRecipe});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            backgroundColor: Stylings.main,
            floating: false,
            pinned: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: const EdgeInsets.all(13),
                  padding: const EdgeInsets.only(left: 5),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Stylings.bgColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.black,
                  )),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    margin: EdgeInsets.all(10),
                    //padding: EdgeInsets.only(left: 5),
                    height: 28,
                    width: 28,
                    decoration:  BoxDecoration(
                        color: Stylings.bgColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.bookmark_border_rounded,
                      size: 15,
                      color: Colors.black,
                    )),
              ),
            ],
            expandedHeight: size.height * 0.6,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Stylings.main.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    theRecipe.name!,
                    style: Stylings.subHeader.copyWith(color: Colors.white),
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(theRecipe.image!),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                )),
          ),
          //Infos
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(15),
              color: Stylings.bgColor,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("For ${theRecipe.mealType![0]}", style: Stylings.header,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Servings ", style: Stylings.lilgreyText,),
                            Text("${theRecipe.servings}", style: Stylings.lilgreyText),
                          ],
                        ),
                        Text("${theRecipe.reviewCount} Reviews",style: Stylings.lilgreyText),

                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FluentIcons.clock_48_filled, size: 15, color: Stylings.lightblack),
                                const SizedBox(width: 3),
                                Text("${theRecipe.cookTimeMinutes} Mins", style: Stylings.lilgreyText,)
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FluentIcons.dumbbell_28_filled, size: 15, color: Stylings.lightblack),
                                const SizedBox(width: 3),
                                Text(theRecipe.difficulty!, style: Stylings.lilgreyText,)
                              ],
                            ),
                            const SizedBox(width: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FluentIcons.fire_24_filled, size: 15, color: Stylings.lightblack),
                                const SizedBox(width: 3),
                                Text("${theRecipe.caloriesPerServing} Cal", style: Stylings.lilgreyText,)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),















                      ],
                    ),
                  ),
                  //rating
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(FluentIcons.star_48_filled, color: Colors.orange, size: 15,),
                        const SizedBox(width: 5),
                        Text("${theRecipe.rating}", style: Stylings.header,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //tags
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: Stylings.bgColor,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Tags ", style: Stylings.lilgreyText,),
                  ...theRecipe.tags!.map((aTag){
                    return Tagchips(tag: aTag);
                  })
                ],
              ),
            ),
          ),
          //Description
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(15),
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description", style: Stylings.header,),
                    const SizedBox(height: 10,),
                    ...theRecipe.instructions!.map((anInst){
                      return Text(anInst, style: Stylings.lilgreyText,);
                    })
                  ],
              ),
            ),
          ),
          //Ingredients
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(15),
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description", style: Stylings.header,),
                  const SizedBox(height: 10,),
                  ...theRecipe.ingredients!.map((anIngredient){
                    return Ingredienttile(title: anIngredient);
                  })
                ],
              ),
            ),
          ),
          //video Button
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Stylings.main,
                ),
                child: Text("Watch Videos", style: Stylings.subHeader.copyWith(color: Colors.white),),
              )
            ),
          ),
        ],
      ),
    );
  }
}
