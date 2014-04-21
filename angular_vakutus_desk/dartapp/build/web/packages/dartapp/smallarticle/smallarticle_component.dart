library smallarticle;

import 'package:angular/angular.dart';
import "package:dartapp/domains.dart";

@Component(
    selector: 'smallarticle',
    templateUrl: 'packages/dartapp/smallarticle/smallarticle_component.html',
    applyAuthorStyles: true,
    cssUrl: 'packages/dartapp/smallarticle/smallarticle_component.css',
    publishAs: 'cmp')
 class SmallArticleComponent {

  @NgOneWay('articelobj')

    Articles articelobj; 
  
}