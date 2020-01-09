import 'package:flutter/material.dart';
import 'package:organizer/style.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Chats",
        style: boldViewDown.copyWith(fontSize: ExtraLargeSize + 15),),
        ),
      
    );
  }
}