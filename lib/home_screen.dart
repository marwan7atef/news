import 'package:flutter/material.dart';
import 'package:news/catgory/catgory_view.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/catgory_model.dart';
import 'package:news/news/news_view.dart';

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


      ),
      body:selectedCat==null?CatgoryView(onSelectedCat: reciveFromOnSelectedCat):NewsView(catgoryId: selectedCat!.id),
      drawer: HomeDrawer(onGoToHome: resetHomeScreen)


    );
  }
}
