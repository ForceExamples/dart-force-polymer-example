library ex.web.elements.random_model;

import 'dart:html';
import 'package:polymer/polymer.dart';

class Channel extends Observable {
  @observable String name;
  @observable String url;

  Channel(this.url);
  Channel.withName(this.name, this.url);

  Channel.fromJson(Map json)
      : name = json['name'], url = json['url'];

  Map toJson() => { 'name': name, 'url': url };

  String toString() => "$name -> $url";
}

@CustomTag('random-model')
class RandomModel extends PolymerElement {
  @published ObservableList<Channel> items;
  @published String storageId;

  @observable int activeCount = 0;

  factory RandomModel() => new Element.tag('random-model');
  RandomModel.created() : super.created();

  void ready() {
    async((_) {
      if (items == null) items = new ObservableList<Channel>();
    });
  }

  void itemsChanged() {
    //if (storage != null) {
    //  storage.value = items;
    //  storage.save();
    //}
  }

  /*void storageIdChanged() {
    storage = document.querySelector('#$storageId');
    if (storage != null && storage.value != null) {
      items = toObservable(storage.value.map((i) => new Channel.fromJson(i)));
    }
  }*/

  void newItem(String title) {
    title = title.trim();
    if (title != '') {
      items.add(new Channel(title));
      itemsChanged();
    }
  }

  void destroyItem(Channel item) {
    if (items.remove(item)) itemsChanged();
  }
}