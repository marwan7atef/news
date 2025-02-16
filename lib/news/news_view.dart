import 'package:flutter/material.dart';
import 'package:news/api/api_services.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/new_respone.dart';
import 'package:news/models/source_respone.dart';
import 'package:news/news/news_details_item.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/source_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loding_indicator.dart';

class NewsView extends StatefulWidget {
  NewsView({required this.catgoryId});
  String catgoryId;


  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
late Future<SourceRespone>getSources=APIServices.getSources(widget.catgoryId);
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return
       FutureBuilder(future: getSources,builder: (context, snapshot) {
         if(snapshot.connectionState==ConnectionState.waiting){
           return LodingIndicator();
         }else if(snapshot.hasError||snapshot.data?.status!="ok"){
           return ErrorIndicator();
         }else{
           List<Sources>sources=snapshot.data?.sources ??[];
            return Column(
             children: [
               DefaultTabController(
                 length: sources.length,
                 child: TabBar(
                     padding: EdgeInsetsDirectional.only(end: 15),
                     labelPadding:  EdgeInsetsDirectional.only(start: 16),
                     indicatorColor: AppTheme.white,
                     dividerColor: Colors.transparent,
                     tabAlignment:TabAlignment.start,

                     isScrollable: true,
                     onTap: (index) {
                       if(index==currentIndex)return;
                       currentIndex=index;
                       setState(() {

                       });

                     }
                     ,
                     tabs: sources.map((source) => SourceItem(source: source, isSelected:currentIndex==sources.indexOf(source) ),).toList()),
               ),
               Expanded(
                 child: FutureBuilder(future: APIServices.getNews(sources[currentIndex].id!), builder: (context, snapshot) {
                   if(snapshot.connectionState==ConnectionState.waiting){
                     return LodingIndicator();
                   }else if(snapshot.hasError||snapshot.data?.status!="ok"){
                     return ErrorIndicator();
                   }else{
                     List<Articles> news=snapshot.data?.articles??[];
                    return ListView.separated(padding: EdgeInsets.only(top: 15),separatorBuilder: (context, index) => SizedBox(height: 16,),itemCount:news.length,itemBuilder: (context, index) => GestureDetector(onTap: (){
                      showModalBottomSheet(useSafeArea: true ,constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height*.48,

                      ),context: context,builder: (context) {
                        return NewsDetailsItem(newsDetials: news[index].content,newsImage: news[index].urlToImage,urlLink: news[index].url!);

                      },);

                    },child: NewsItem(reciveNews: news[index],)),);
                   }

                 },),
               )

             ],

           );

         }
       },

       );

  }
}