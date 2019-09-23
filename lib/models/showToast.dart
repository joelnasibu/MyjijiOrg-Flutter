import 'package:flutter/material.dart';

class ShowToast {
  
  String text;
  BuildContext ctx;
  int duration;
  ShowToast(this.ctx,this.text,this.duration);
  @override
  void Toast() {
    final snack = Scaffold.of(ctx);
    snack.showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: duration),
      
    ));
  }
}