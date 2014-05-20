library example_force_polymer;

import 'dart:async';
import 'dart:io';
import 'package:force/force_serverside.dart';
import 'package:forcemvc/force_mvc.dart';
import 'package:mustache4dart/mustache4dart.dart'; 

part 'post_controller.dart';

void main() {

// Setup what port to listen to 
var portEnv = Platform.environment['PORT'];
var port = portEnv == null ? 8080 : int.parse(portEnv);
var serveClient = portEnv == null ? true : false;

// Create a force server
ForceServer fs = new ForceServer(port: port, 
                                clientFiles: '../client/build/web/',
                                clientServe: serveClient);

  // Setup logger
  fs.setupConsoleLog();

  if (fs.server.viewRender is MustacheRender) {
    MustacheRender mustacheRender = fs.server.viewRender;
    mustacheRender.delimiter = new Delimiter('[[', ']]');
  }
  fs.on('count', (e, sendable) { 
    sendable.send('notifications', e.json);
  });
  
  fs.start();
}
