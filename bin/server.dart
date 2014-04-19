library example_force_polymer;

import 'dart:async';
import 'dart:io';
import 'package:logging/logging.dart' show Logger, Level, LogRecord;
import 'package:force/force_serverside.dart';
import 'package:forcemvc/force_mvc.dart';
import 'package:mustache4dart/mustache4dart.dart'; 

part 'post_controller.dart';

final Logger log = new Logger('ChatApp');

void main() {
  // Set up logger.
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 8080 : int.parse(portEnv);
  
  ForceServer fs = new ForceServer(host: "0.0.0.0", port: port, startPage: "index.html" );
  if (fs.server.viewRender is MustacheRender) {
    MustacheRender mustacheRender = fs.server.viewRender;
    mustacheRender.delimiter = new Delimiter('[[', ']]');
  }
  fs.on('count', (e, sendable) { 
    sendable.send('notifications', e.json);
  });
  
  fs.start();
}
