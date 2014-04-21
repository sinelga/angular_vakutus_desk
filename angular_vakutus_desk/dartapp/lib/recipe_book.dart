library recipe_book_controller;

import 'package:angular/angular.dart';
import 'dart:async';
import "package:js/js.dart" as js;
import "package:jsonp/jsonp.dart" as jsonp;
import "package:dartapp/domains.dart";
import 'package:intl/intl.dart';

@Controller(
    selector: '[recipe-book]',
    publishAs: 'ctrl')
class RecipeBookController {
//  Recipe selectedRecipe;
    List<Navigation> navigationList;
    List<Articles> articlesList;
    Navigation selectedNavigation;
    Articles selectedArticles;
    bool articleSelected;
    bool navigationListLoaded ;
    bool articlesListLoaded;

  RecipeBookController() {

    navigationList = new List<Navigation>();
    articlesList = new List<Articles>();
    _loadDataJsonp();
  }
  void _loadDataJsonp() {

    navigationListLoaded = false;
    articlesListLoaded = false;
    articleSelected= false;
    
    Future<js.Proxy> result = jsonp.fetch(
        
        uri: "http://suomipornome2.appspot.com/start?callback=?"
          
    );

    result.then((js.Proxy proxy) {
     
      navigationListLoaded =true;  
      display(proxy["results"]);
      
    });
    
    getArticles("fi_FI","finances","Ulkomaat");   
   
  }
  
  void display(var data) {
    
    for (var i=0;i < data.length;i++){
      
      Navigation navigation = new Navigation();
      
      navigation.id = i;
      navigation.Locale = data[i]["Locale"];
      navigation.Themes = data[i]["Themes"];
      navigation.SubThemes = data[i]["SubThemes"];
            
      navigationList.add(navigation);
    
    }   
  }
  
  void selectNavigation(Navigation navigation) {
    selectedNavigation = navigation;
   
    if (articleSelected && articlesListLoaded)  {
      
      articleSelected = false;
      articlesListLoaded = false;
    
      
    }
    getArticles(selectedNavigation.Locale,selectedNavigation.Themes,selectedNavigation.SubThemes);
    
    
  }
  
  void selectArticles(Articles articles) {
    selectedArticles = articles;
    
    articleSelected = true;
  }
  
  void closeBigArticle() {
 
    articleSelected = false;
    
    
  }
  
 
  void getArticles(String locale,String themes,String subthemes) {
  
    Future<js.Proxy> result = jsonp.fetch(
        
        uri: "http://suomipornome2.appspot.com/jsonout?locale="+locale+"&themes="+themes+"&subthemes="+subthemes+"&callback=?"
                 
    );

    result.then((js.Proxy proxy) {
      
        articlesListLoaded = true;
        displayArticles(proxy["results"]);
 
     
    });
        
  }
  
  void displayArticles(var data){
    
    if (articlesList.isNotEmpty) {
      
      articlesList.clear();      
      
    }
    
    for (var i=0;i < data.length;i++){
      
      var article = new Articles();
           article.id = i;
           article.Title = data[i].Title;
           DateTime pubDate = DateTime.parse(data[i]["PubDate"]);
           var timeStamp = new DateFormat("d-MMM-yyyy");
           String pubDateStr = timeStamp.format(pubDate);
           article.PubDate = pubDateStr;
           article.Title = data[i]["Title"];
           String imglinkstr = data[i]["ImageLink"].replaceFirst("w=468","w=200");
           article.ImageLink = imglinkstr;
           article.Cont = data[i]["Cont"];
           
           articlesList.add(article);
      
    }
        
  }
    
}

