import 'dart:html';
import 'package:polymer/polymer.dart';
import 'random_model.dart';

@CustomTag('random-item')
class RandomItem extends LIElement with Polymer, Observable {
  @published Channel item;

  factory RandomItem() => new Element.tag('li', 'random-item');
  RandomItem.created() : super.created() { polymerCreated(); }

  commitAction() {}
  
  destroyAction() {
    fire('zine-destroy-channel', detail: item);
  }
}