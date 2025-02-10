import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';

class SourceItem extends StatelessWidget {
  bool isSelected;
  SourceModel source;
SourceItem({required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return Text(source.sourceName,style: isSelected?textStyle.labelLarge:textStyle.labelMedium,);
  }
}
