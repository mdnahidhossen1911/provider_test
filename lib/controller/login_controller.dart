import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginController extends ChangeNotifier{
  bool _inProgress = false;
  bool get inProgress =>_inProgress;

  _setInProgress(bool inProgress){
    _inProgress = inProgress;
    notifyListeners();
  }

  Future<void> login(String url, Map<String,dynamic> data) async {
    _setInProgress(true);
    try{
      Response response = await post(Uri.parse(url),body: data);
      if(response.statusCode == 200){
        log('success');
      }else{
        log('unsuccess');
        log(response.body);
      }
    }catch(e){
      log(e.toString());
    }
    _setInProgress(false);

  }

}