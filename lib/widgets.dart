import 'package:flutter/material.dart';

// CREATE TASKCARD WIDGET
class TaskCardWidget extends StatelessWidget {
  // CREATE CUSTOM FIELDS & CONSTRUCTORS
  final String? title;
  final String? desc;
  TaskCardWidget({this.title, this.desc});

  // END OF CUSTOM FIELDS & CONSTRUCTORS

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),

      //BOX FIELD FOR TODO's
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      // END OF BOX FIELD FOR TODO's

      // TASK & DESCRIPTION
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Unnamed Task)",
            style: TextStyle(
              color: Color(0xFF211551),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              desc ?? "No Description Added",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF868290),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
      // END OF TASK & DESCRIPTION
    );
  }
}
// END OF TASK CARD WIDGET

// CREATE TODO WIDGET
class TodoWidget extends StatelessWidget {
  // CREATE CUSTOM FIELDS & CONSTRUCTORS
  final String? text;
  final bool isDone;
  TodoWidget({this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          // ADD CHECK ICON BUTTON
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              color: isDone ? Color(0xFF7349FE) : Colors.transparent,
              borderRadius: BorderRadius.circular(6.0),
              border: isDone ? null : Border.all(
                color: Color(0xFF86829D),
                width: 1.5,
              )
            ),
            child: Image(image: AssetImage('assets/images/check_icon.png')),
          ),
          // END OF CHECK ICON BUTTON

          Flexible(
                      child: Text(
              text ?? "(Unnamed Todo)",
              style: TextStyle(
                color: isDone ? Color(0xFF211551) : Color(0xFF86829D),
                fontSize: 16.0,
                fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// END OF TODO WIDGET


class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection) {
      return child;
    }
  
}