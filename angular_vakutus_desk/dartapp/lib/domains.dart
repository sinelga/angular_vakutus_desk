library domains;

class Articles{
  
  int id; 
  String Title,Description,ImageLink,Cont,PubDate;
 
}

class Navigation{
  int id;
  String Locale,Themes,SubThemes;
  
}

//class Resultsnavigation {
//  
//  final List<Navigationjs> listNavigationjs;
//  
//  Resultsnavigation(this.listNavigationjs);
//  Resultsnavigation.fromProxy(var data) :
//    listNavigationjs =data.results;
//  
//  
//}
//
//
//class Navigationjs {
////  var data;
//  final String Locale;
//  final String Themes;
//  final String SubThemes;
//  
//  
//  Navigationjs(this.Locale,this.Themes,this.SubThemes);
//  
//  Navigationjs.fromProxy(var data) :
//    Locale = data.Locale,
//    Themes = data.Themes,
//    SubThemes = data.SubThemes;
//  
//  
//}