class CatgoryModel {
  String id;
  String imageName;
  String Name;
  CatgoryModel({required this.id,required this.imageName,required this.Name});
  static List<CatgoryModel>catgores=[
    CatgoryModel(Name:"General" ,id: "general", imageName: "general"),
    CatgoryModel(Name:"Business" ,id: "business", imageName: "business"),
    CatgoryModel(Name:"Sports" ,id: "sports", imageName: "sports"),
    CatgoryModel(Name: "Technology",id: "technology", imageName: "technology"),
    CatgoryModel(Name: "Science",id: "science", imageName: "science"),
    CatgoryModel(Name:"Health" ,id: "health", imageName: "health"),
    CatgoryModel(Name: "Entertainment",id: "entertainment", imageName: "entertainment"),


  ];



}