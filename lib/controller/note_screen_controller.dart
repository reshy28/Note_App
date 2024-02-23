import 'package:flutter/material.dart';

class Notescreenontroller {
  List notelist = [
    {
      "titile": "reshy",
      "des": "endhoke und mwone vishesham",
      "date": "20/10/2024",
      "Colors": Colors.white,
    },
    {
      "titile": "reshy",
      "des":
          "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently",
      "date": "20/10/2024",
      "Colors": Colors.white,
    },
    {
      "titile": "reshy",
      "des": "endhoke und mwone vishesham",
      "date": "20/10/2024",
      "Colors": Colors.white,
    },
    {
      "titile": "reshy",
      "des": "endhoke und mwone vishesham",
      "date": "20/10/2024",
      "Colors": Colors.white,
    },
  ];

  ///FUNCTION TO ADD DATA
  void adddata({required titilecn, required descn, required datecn}) {
    notelist.add(
      {
        "titile": titilecn,
        "des": descn,
        "date": datecn,
        "Colors": Colors.white,
      },
    );
  }

  ///FUNCTION TO DELETE THE DATA

  void deletedata(int index) {
    notelist.removeAt(index);
  }

  // function to clear the controller datas

  void clearcontroller() {}

  ////FUNCTION TO EDIT DATA
  ////FUNCTION TO SHARE DATA
}
