import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/catgory/catgory_view.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/catgory_model.dart';
import 'package:news/news/news_view.dart';
import 'package:news/search/catgory_search.dart';
import 'package:news/search/news_search.dart';

class HomeScreen extends StatefulWidget {
static const String routeName="/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
CatgoryModel? selectedCat;

void reciveFromOnSelectedCat(CatgoryModel recivedCat){
  selectedCat=recivedCat;
  selectedCat;
  setState(() {

  });


}
void resetHomeScreen(){
  if(selectedCat==null)return;
  selectedCat=null;
  setState(() {
    
  });
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:selectedCat==null? Text("Home"):Text(selectedCat!.Name),
        actions: [
          GestureDetector(onTap: () async{
            await showSearch(context: context, delegate:selectedCat==null?CatgorySearch(onSelectedCat: reciveFromOnSelectedCat):NewsSearch(catgoryId:selectedCat!.id));

          },child: SvgPicture.asset("assets/icons/Search.svg",height: 24,width: 24,fit: BoxFit.scaleDown,))

        ],


      ),
      body:selectedCat==null?CatgoryView(onSelectedCat: reciveFromOnSelectedCat):NewsView(catgoryId: selectedCat!.id),
      drawer: HomeDrawer(onGoToHome: resetHomeScreen)


    );
  }
}
