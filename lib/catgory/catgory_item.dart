import 'package:flutter/material.dart';
import '../models/catgory_model.dart';

class CatgoryItem extends StatelessWidget {
  CatgoryModel catgory;
  CatgoryItem({required this.catgory});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(24),child: Image.asset("assets/images/${catgory.imageName}.png",width: double.infinity,height: MediaQuery.of(context).size.height*.24,fit: BoxFit.fill,));
  }
}
