import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: ListView.separated(
          itemBuilder: (context, index) => notes_widget(
                ondeletebutton: () {
                  notescreenontrollerobj.deletedata(index);
                  setState(() {});
                },
                titile:
                    notescreenontrollerobj.notelist[index]["titile"].toString(),
                description:
                    notescreenontrollerobj.notelist[index]["des"].toString(),
                date: notescreenontrollerobj.notelist[index]["date"].toString(),
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
            builder: (context) => Container(
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text("Titile"),
                          border: OutlineInputBorder(),
                          fillColor: Colorsconstant.mygrey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text("Description"),
                          border: OutlineInputBorder(),
                          fillColor: Colorsconstant.mygrey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text("Date"),
                          border: OutlineInputBorder(),
                          fillColor: Colorsconstant.mygrey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        width: 230,
                        child: ListView.builder(
                          itemCount: 8,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(9),
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
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              notescreenontrollerobj.notelist.add(
                                {
                                  "titile": "reshy",
                                  "des": "endhoke und mwone vishesham",
                                  "date": "20/10/2024",
                                  "Colors": Colors.purple,
                                },
                              );
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Center(child: Text("Save")),
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
          );
        },
      ),
    );
  }
}
