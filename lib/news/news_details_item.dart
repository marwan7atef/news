import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsItem extends StatelessWidget {
String? newsImage;
String? newsDetials;
String urlLink;
NewsDetailsItem({required this.newsDetials,required this.newsImage,required this.urlLink});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network(newsImage??"https://t3.ftcdn.net/jpg/11/38/46/34/360_F_1138463480_ztIhPGTAklkgMRl9gLHjOUvl2xWE7fqY.jpg",width: double.infinity,height: MediaQuery.of(context).size.height*.25,fit: BoxFit.fill,)),
          SizedBox(
            height: 8,

          ),
          Text(newsDetials??"",style: textTheme.labelMedium!.copyWith(color: AppTheme.black),maxLines: 5,),
         Spacer(),
          ElevatedButton(onPressed: () async{
           await launchUrl(Uri.parse(urlLink)).then((value) {


           },).catchError((error){
             print(error);

           });

          }, child: Text("View Full Articel",style: textTheme.labelLarge,),)






        ],

      ),
    );
  }
}
