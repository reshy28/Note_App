import 'package:flutter/material.dart';
import 'package:note_app/utlis/color_constants.dart';

class Notescreenontroller {
  List notelist = [];

  ///FUNCTION TO ADD DATA
  void adddata({required titilecn, required descn, required datecn}) {
    notelist.add(
      {
        "titile": titilecn,
        "des": descn,
        "date": datecn,
        "Colors": selectedcolor,
      },
    );
  }

  ///FUNCTION TO DELETE THE DATA

  void deletedata(int index) {
    notelist.removeAt(index);
  }

  static Color selectedcolor = Colors.white;
  void onclrselection(Color newclr) {
    selectedcolor = newclr;
  }

  ////FUNCTION TO EDIT DATA
  ////FUNCTION TO SHARE DATA
}
