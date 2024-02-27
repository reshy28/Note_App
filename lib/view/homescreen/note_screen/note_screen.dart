// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:note_app/controller/note_screen_controller.dart';
import 'package:note_app/utlis/color_constants.dart';
import 'package:note_app/view/homescreen/widget/custom_note_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Notescreenontroller notescreenontrollerobj = Notescreenontroller();

  TextEditingController titilecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  List colorsbuilder = [
    Colors.red,
    Colors.grey,
    Colors.purple,
    Colors.green,
  ];
  int selectedcolorindex = 0;

  var _formKey = GlobalKey<FormState>();

  final bool isedit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsconstant.myblack,
      appBar: AppBar(
        backgroundColor: Colorsconstant.myblack,
        centerTitle: true,
        title: Text(
          "PENPAD",
          style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontStyle: FontStyle.italic),
        ),
      ),
      body: notescreenontrollerobj.notelist.isEmpty
          ? Center(
              child: Text(
                "NO DATAS FOUND",
                style: TextStyle(
                    color: Colorsconstant.mywhite, fontStyle: FontStyle.italic),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) => notes_widget(
                    ondeletebutton: () {
                      notescreenontrollerobj.deletedata(index);
                      setState(() {});
                    },
                    ondeditbutton: () {
                      titilecontroller.text =
                          notescreenontrollerobj.notelist[index]["titile"];
                      descontroller.text =
                          notescreenontrollerobj.notelist[index]["des"];
                      datecontroller.text =
                          notescreenontrollerobj.notelist[index]["date"];

                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              //////Keybord visible avan vendi ,mobiles
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: StatefulBuilder(
                            builder: (context, bottomsetState) => Container(
                              decoration: BoxDecoration(
                                color: Colorsconstant.mygrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if (titilecontroller
                                              .text.isNotEmpty) {
                                            return null;
                                          } else {
                                            return "Enter a valid titile";
                                          }
                                        },
                                        controller: titilecontroller,
                                        decoration: InputDecoration(
                                            label: Text("Titile"),
                                            border: OutlineInputBorder(),
                                            fillColor: Colorsconstant.mygrey),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (descontroller.text.isNotEmpty) {
                                            return null;
                                          } else {
                                            return "Enter a valid Description";
                                          }
                                        },
                                        controller: descontroller,
                                        decoration: InputDecoration(
                                            label: Text("Description"),
                                            border: OutlineInputBorder(),
                                            fillColor: Colorsconstant.mygrey),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (datecontroller.text.isNotEmpty) {
                                            return null;
                                          } else {
                                            return "Enter a valid Date";
                                          }
                                        },
                                        controller: datecontroller,
                                        decoration: InputDecoration(
                                            label: Text("Date"),
                                            border: OutlineInputBorder(),
                                            fillColor: Colorsconstant.mygrey),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: 60,
                                          width: 230,
                                          child: ListView.builder(
                                            itemCount: colorsbuilder.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  notescreenontrollerobj
                                                      .onclrselection(
                                                          colorsbuilder[
                                                              selectedcolorindex]);

                                                  selectedcolorindex = index;
                                                  bottomsetState(() {});
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    border: selectedcolorindex ==
                                                            index
                                                        ? Border.all(
                                                            width: 8.0,
                                                            strokeAlign: BorderSide
                                                                .strokeAlignInside,
                                                            color:
                                                                Colorsconstant
                                                                    .mygrey)
                                                        : null,
                                                    color: colorsbuilder[index],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                child: Center(
                                                    child: Text("Cancel")),
                                                decoration: BoxDecoration(
                                                  color: Colorsconstant.mywhite,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                height: 40,
                                                width: 90,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  // notescreenontrollerobj
                                                  //     .adddata(
                                                  //         titilecn:
                                                  //             titilecontroller
                                                  //                 .text,
                                                  //         datecn: datecontroller
                                                  //             .text,
                                                  //         descn: descontroller
                                                  //             .text);

                                                  editedata(index);

                                                  clearcontroller();

                                                  setState(() {});

                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Container(
                                                child: Center(
                                                  child: Text("Update"),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colorsconstant.mywhite,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                height: 40,
                                                width: 90,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    titile: notescreenontrollerobj.notelist[index]["titile"]
                        .toString(),
                    description: notescreenontrollerobj.notelist[index]["des"]
                        .toString(),
                    date: notescreenontrollerobj.notelist[index]["date"]
                        .toString(),
                    noteclr: notescreenontrollerobj.notelist[index]["Colors"],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: notescreenontrollerobj.notelist.length),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  //////Keybord visible avan vendi ,mobiles
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: StatefulBuilder(
                builder: (context, bottomsetState) => Container(
                  decoration: BoxDecoration(
                    color: Colorsconstant.mygrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (titilecontroller.text.isNotEmpty) {
                                return null;
                              } else {
                                return "Enter a valid titile";
                              }
                            },
                            controller: titilecontroller,
                            decoration: InputDecoration(
                                label: Text("Titile"),
                                border: OutlineInputBorder(),
                                fillColor: Colorsconstant.mygrey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (descontroller.text.isNotEmpty) {
                                return null;
                              } else {
                                return "Enter a valid Description";
                              }
                            },
                            controller: descontroller,
                            decoration: InputDecoration(
                                filled: true,
                                label: Text("Description"),
                                border: OutlineInputBorder(),
                                fillColor: Colorsconstant.mygrey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            readOnly: true,
                            validator: (value) {
                              if (datecontroller.text.isNotEmpty) {
                                return null;
                              } else {
                                return "Enter a valid Date";
                              }
                            },
                            controller: datecontroller,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () async {
                                      final DateTime? pickeddate =
                                          await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2025));

                                      if (pickeddate != null) {
                                        String formated =
                                            DateFormat("DD/MM/yyy")
                                                .format(pickeddate);
                                        datecontroller.text = formated;
                                      }
                                    },
                                    child: Icon(Icons.calendar_month_outlined)),
                                label: Text("Date"),
                                border: OutlineInputBorder(),
                                fillColor: Colorsconstant.mywhite),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              height: 60,
                              width: 230,
                              child: ListView.builder(
                                itemCount: colorsbuilder.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      notescreenontrollerobj.onclrselection(
                                          colorsbuilder[selectedcolorindex]);

                                      selectedcolorindex = index;
                                      bottomsetState(() {});
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border: selectedcolorindex == index
                                            ? Border.all(
                                                width: 8.0,
                                                strokeAlign: BorderSide
                                                    .strokeAlignInside,
                                                color: Colorsconstant.mygrey)
                                            : null,
                                        color: colorsbuilder[index],
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    child: Center(child: Text("Cancel")),
                                    decoration: BoxDecoration(
                                      color: Colorsconstant.mywhite,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: 40,
                                    width: 90,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      notescreenontrollerobj.adddata(
                                          titilecn: titilecontroller.text,
                                          datecn: datecontroller.text,
                                          descn: descontroller.text);
                                      clearcontroller();

                                      setState(() {});

                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text("Save"),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colorsconstant.mywhite,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: 40,
                                    width: 90,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // function to clear the controller datas
  void clearcontroller() {
    titilecontroller.clear();
    descontroller.clear();
    datecontroller.clear();
  }

  void editedata(int index) {
    notescreenontrollerobj.notelist[index] = {
      "titile": titilecontroller.text,
      "des": descontroller.text,
      "date": datecontroller.text,
      "Colors": Notescreenontroller.selectedcolor,
    };
  }
}
