
import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';

enum ENV{
  PRODUCTION,
  DEV,
}

class Application {

  static ENV env = ENV.DEV;
  // static Router router;
  static TabController controller;
  

  Map<String, String> get config{
    if(Application.env == ENV.PRODUCTION){
      return {};
    }
    if(Application.env == ENV.DEV){
      return {};
    }
     return {};
  }
 

}
