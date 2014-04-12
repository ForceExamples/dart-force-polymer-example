import 'package:polymer/polymer.dart';
import 'dart:math';

/**
 * A Polymer click counter element.
 */
@CustomTag('click-random')
class ClickRandom extends PolymerElement {
  @published int number = 0;

  ClickRandom.created() : super.created() {
  }

  void random() {
    var rng = new Random();
    number=rng.nextInt(250);
    
    fire('random-generated', detail: number);
  }
}

