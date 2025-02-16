import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/new_respone.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsItem extends StatelessWidget {

  Articles reciveNews;
  NewsItem({required this.reciveNews});
  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: AppTheme.white),
        borderRadius: BorderRadius.circular(16)

      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network(reciveNews.urlToImage??"https://t3.ftcdn.net/jpg/11/38/46/34/360_F_1138463480_ztIhPGTAklkgMRl9gLHjOUvl2xWE7fqY.jpg",width: double.infinity,fit: BoxFit.fill,height: MediaQuery.of(context).size.height*.3,)),
          SizedBox(height: 10,),
          Text(reciveNews.title??"",style: textStyle.labelLarge,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reciveNews.source?.name??"",style: textStyle.labelSmall,),
              Text(timeago.format(DateTime.parse(reciveNews.publishedAt!) ),style: textStyle.labelSmall,),

            ],

          )
          
          
        ],
        
        
      ),
      
      
    );
  }
}
