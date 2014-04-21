library recipe_book;

import 'package:angular/angular.dart';
import 'package:angular/application_factory_static.dart';
import 'package:dartapp/recipe_book.dart';
import 'package:dartapp/smallarticle/smallarticle_component.dart';
//import 'package:dartapp/bigarticle/bigarticle_component.dart';
import 'package:dartapp/bigarticle/bigarticle_component.dart';

@MirrorsUsed(targets: const['domains'], override: '*')
import 'dart:mirrors';
import 'dartapp_static_expressions.dart' as generated_static_expressions;
import 'dartapp_static_metadata.dart' as generated_static_metadata;
import 'dartapp_static_injector.dart' as generated_static_injector;



class MyAppModule extends Module {
  MyAppModule() {
    type(RecipeBookController);
    type(SmallArticleComponent);
    type(BigArticleComponent);
    
  }
}

void main() {
//  ngBootstrap(module: new MyAppModule());
  staticApplicationFactory(generated_static_injector.factories, generated_static_metadata.typeAnnotations, generated_static_expressions.getters, generated_static_expressions.setters, generated_static_expressions.symbols)
        .addModule(new MyAppModule())
        .run();
  
  
}




