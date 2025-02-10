import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsItem extends StatelessWidget {
  final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
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
          ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.asset("assets/images/photo.png",width: double.infinity,fit: BoxFit.fill,height: MediaQuery.of(context).size.height*.3,)),
          SizedBox(height: 10,),
          Text("Nobel Prize in physics awarded to two scientists for machine learning discoveries",style: textStyle.labelLarge,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("By : Jon Haworth",style: textStyle.labelSmall,),
              Text(timeago.format(fifteenAgo),style: textStyle.labelSmall,),

            ],

          )
          
          
        ],
        
        
      ),
      
      
    );
  }
}
