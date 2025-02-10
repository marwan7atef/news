import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/source_model.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/source_item.dart';

class NewsView extends StatefulWidget {
  NewsView({required this.catgoryId});
  String catgoryId;


  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List<SourceModel>sources=List.generate(10, (index) => SourceModel(id: "$index", sourceName: "source$index"),);
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return
       Column(
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
                tabs: sources.map((source) => SourceItem(source:source, isSelected:currentIndex==sources.indexOf(source) ),).toList()),
          ),
          Expanded(child: 
          ListView.separated(padding: EdgeInsets.only(top: 15),separatorBuilder: (context, index) => SizedBox(height: 16,),itemCount:10 ,itemBuilder: (context, index) => NewsItem(),)
          
          )

        ],

      );

  }
}