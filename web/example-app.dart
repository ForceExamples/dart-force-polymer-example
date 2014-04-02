import 'package:polymer/polymer.dart';
import 'package:force/force_browser.dart';
import 'clickrandom.dart';
import 'dart:html';
import 'random_model.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('example-app')
class ExampleApp extends PolymerElement {
  @observable ClickRandom clickRandom;
  
  @published String modelId;
   
  @observable RandomModel model;
  
  ForceClient forceClient = new ForceClient();
  
  ExampleApp.created() : super.created() {
    forceClient.connect();
    
    forceClient.on("notifications", (e, sender) {
        var json = e.json;
        // var random = json.random;
        print("received $json");
        model.newItem("received $json");
    });
  }
  
  void modelIdChanged() {
     model = document.querySelector('#$modelId');
  }

  void random(e, number) {
    print("number $number");
    forceClient.send('count', {"random" : number, "foo" : "hello"} );
  }
  
  void itemChangedAction() {
     if (model != null) model.itemsChanged();
  }
}

