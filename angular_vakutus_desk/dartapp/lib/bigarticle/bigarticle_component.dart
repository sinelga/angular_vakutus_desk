library bigarticle;

import 'package:angular/angular.dart';
import "package:dartapp/domains.dart";


@NgComponent(
    selector: 'bigarticle',
    templateUrl: 'packages/dartapp/bigarticle/bigarticle_component.html',
    applyAuthorStyles: true,
//    cssUrl: 'packages/dartapp/smallarticle/smallarticle_component.css',
    publishAs: 'cmp')
 class  BigArticleComponent{

  @NgOneWay('articelobj')

    Articles articelobj; 
  
}