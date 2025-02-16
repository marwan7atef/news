import 'package:flutter/material.dart';
import 'package:news/models/new_respone.dart';
import '../api/api_services.dart';
import '../app_theme.dart';
import '../news/news_details_item.dart';
import '../news/news_item.dart';
import '../widgets/error_indicator.dart';
import '../widgets/loding_indicator.dart';
class NewsSearch extends SearchDelegate {
  String catgoryId;
  NewsSearch({required this.catgoryId});

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
    return FutureBuilder(future: APIServices.getCatgoryNews(catgoryId), builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return LodingIndicator();
      }else if(snapshot.hasError||snapshot.data?.status!="ok"){
        return ErrorIndicator();
      }else{
        List<Articles> newsSuggestion=snapshot.data!.articles!.where((item) =>item.title!.toLowerCase().contains(query.toLowerCase()) ,).toList()??[];
        return ListView.separated(padding: EdgeInsets.only(top: 15),separatorBuilder: (context, index) => SizedBox(height: 16,),itemCount:newsSuggestion.length,itemBuilder: (context, index) => GestureDetector(onTap: (){
          showModalBottomSheet(useSafeArea: true ,constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height*.48,

          ),context: context,builder: (context) {
            return NewsDetailsItem(newsDetials: newsSuggestion[index].content,newsImage: newsSuggestion[index].urlToImage,urlLink: newsSuggestion[index].url!);

          },);

        },child: NewsItem(reciveNews: newsSuggestion[index],)),);
      }

    },);
  }



}