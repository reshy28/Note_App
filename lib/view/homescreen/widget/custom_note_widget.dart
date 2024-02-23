import 'package:flutter/material.dart';
import 'package:note_app/utlis/color_constants.dart';

class notes_widget extends StatefulWidget {
  const notes_widget({
    super.key,
    required this.titile,
    required this.description,
    required this.date,
    required this.noteclr,
    this.ondeletebutton,
  });
  final String titile;
  final String description;
  final String date;
  final Color noteclr;
  final VoidCallback? ondeletebutton;

  @override
  State<notes_widget> createState() => _notes_widgetState();
}

class _notes_widgetState extends State<notes_widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.noteclr,
        ),
        width: 330,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.titile,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: widget.ondeletebutton,
                        icon: Icon(
                          Icons.delete,
                          color: Colorsconstant.myblack,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.description,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 18,
                ),
                Icon(Icons.share),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
