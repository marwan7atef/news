import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/catgory/catgory_item.dart';
import '../models/catgory_model.dart';
class CatgorySearch extends SearchDelegate {
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(appBarTheme:  const AppBarTheme(
      backgroundColor: AppTheme.black,
      foregroundColor: AppTheme.white,



    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(
        color: AppTheme.white
      )



    )


    );

  }


  void Function (CatgoryModel) onSelectedCat;
  CatgorySearch({required this.onSelectedCat});

  @override
  List<Widget>? buildActions(BuildContext context) {


return[
  IconButton(
    icon: Icon(Icons.clear),
    onPressed: () {
      query = '';
    },
  ),


];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),

      );
    }
  }
  @override
  Widget buildResults(BuildContext context) {
    return Placeholder();

  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<CatgoryModel>catgorySuggestion = CatgoryModel.catgores.where((item) =>
        item.Name.toLowerCase().contains(query.toLowerCase()),).toList();
    TextTheme textStyle = Theme
        .of(context)
        .textTheme;
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(child: ListView.separated(padding: EdgeInsets.only(top: 16),
              itemBuilder: (context, index) =>
                  GestureDetector(onTap: () {
                    onSelectedCat(catgorySuggestion[index]);
                    Navigator.of(context).pop();
                  }, child: CatgoryItem(catgory: catgorySuggestion[index])),
              separatorBuilder: (context, index) =>
                  SizedBox(
                    height: 16,

                  ),
              itemCount: catgorySuggestion.length))


        ],

      ),
    );
  }
}