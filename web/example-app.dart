import 'package:polymer/polymer.dart';
import 'package:force/force_browser.dart';
import 'clickrandom.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('example-app')
class ExampleApp extends PolymerElement {
  
  @observable ClickRandom clickRandom;
  
  ForceClient forceClient = new ForceClient();
  
  ExampleApp.created() : super.created() {
    forceClient.connect();
    
    forceClient.on("notifications", (e, sender) {
        var json = e.json;
        print("received $json");
    });
  }

  void random(e, number) {
    print("number $number");
    forceClient.send('count', {"random" : number, "foo" : "hello"} );
  }
}

