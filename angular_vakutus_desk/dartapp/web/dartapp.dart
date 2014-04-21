library recipe_book;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:dartapp/recipe_book.dart';
import 'package:dartapp/smallarticle/smallarticle_component.dart';
//import 'package:dartapp/bigarticle/bigarticle_component.dart';
import 'package:dartapp/bigarticle/bigarticle_component.dart';

@MirrorsUsed(targets: const['domains'], override: '*')
import 'dart:mirrors';



class MyAppModule extends Module {
  MyAppModule() {
    type(RecipeBookController);
    type(SmallArticleComponent);
    type(BigArticleComponent);
    
  }
}

void main() {
//  ngBootstrap(module: new MyAppModule());
  applicationFactory()
        .addModule(new MyAppModule())
        .run();
  
  
}




