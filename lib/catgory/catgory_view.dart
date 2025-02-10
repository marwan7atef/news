import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/catgory/catgory_item.dart';
import 'package:news/models/catgory_model.dart';

class CatgoryView extends StatelessWidget {
void Function (CatgoryModel) onSelectedCat;
CatgoryView({required this.onSelectedCat});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return Padding(
      padding:  EdgeInsets.only(top: 15,right: 15,left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning",style: textStyle.titleLarge,),
          Text("Here is Some News For You",style: textStyle.titleLarge),
          Expanded(child: ListView.separated(padding: EdgeInsets.only(top: 16),itemBuilder: (context, index) => GestureDetector(onTap: (){
            onSelectedCat(CatgoryModel.catgores[index]);

          },child: CatgoryItem(catgory: CatgoryModel.catgores[index])), separatorBuilder: (context, index) => SizedBox(
            height: 16,

          ), itemCount: CatgoryModel.catgores.length))


        ],

      ),
    );
  }
}
