import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';

import '../models/new_respone.dart';
import '../models/source_respone.dart';
class APIServices{
static Future<SourceRespone> getSources(String catgoryId)async {
Uri uri=Uri.https(APIConstant.baseURl,APIConstant.sourcesEndpoint, {
  "apiKey":APIConstant.aPIKey,
  "category":catgoryId,
},
);
http.Response response=await http.get(uri);
Map<String,dynamic>json =jsonDecode(response.body);
return SourceRespone.fromJson(json);



}
static Future<NewRespone>getNews(String sourceId)async{
   Uri uri=Uri.https(APIConstant.baseURl,APIConstant.newsEndpoint,{
     "apiKey":APIConstant.aPIKey,
     "sources":sourceId,

   });
    http.Response response=await http.get(uri);
     Map<String,dynamic>json =jsonDecode(response.body);
  return NewRespone.fromJson(json);



}
static Future<NewRespone>getCatgoryNews(String CatgoryId)async{
  Uri uri=Uri.https(APIConstant.baseURl,APIConstant.newsEndpoint,{
    "apiKey":APIConstant.aPIKey,
    "category":CatgoryId,
  });
  http.Response response=await http.get(uri);
  Map<String,dynamic>json =jsonDecode(response.body);
  return NewRespone.fromJson(json);



}
}