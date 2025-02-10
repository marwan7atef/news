import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  VoidCallback onGoToHome;
  HomeDrawer( {required this.onGoToHome});


  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    TextTheme textStyle=Theme.of(context).textTheme;
    return SizedBox(
      width: screenSize.width*.7,
      child: Column(

        children: [
          Container(
            width: double.infinity,
        color: AppTheme.white,
        height: screenSize.height*.2,
            alignment: Alignment.center,
            child: Text("News App",style: textStyle.titleLarge?.copyWith(color: AppTheme.black,fontWeight: FontWeight.bold),),


          ),
          Expanded(
            child: Container(
              color: AppTheme.black,
              child:
              Padding(
                padding: EdgeInsets.only(right: 16,left: 16,top: 16),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        onGoToHome();
                        Navigator.of(context).pop();


                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/Home.svg"),
                          SizedBox(width: 8,),
                          Text("Go To Home",style: textStyle.headlineMedium,)




                        ],

                      ),
                    )

                  ],


                ),
              )
              ,

            ),
          )



        ],



      ),
    );
  }
}
