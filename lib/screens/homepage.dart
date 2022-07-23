import 'package:flutter/material.dart';
import 'package:what_todo/database_helper.dart';
import 'package:what_todo/widgets.dart';

import 'package:what_todo/screens/taskpage.dart';

import '../models/task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper _dpHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ADD LOGO
                  Container(
                    margin: EdgeInsets.only(
                      top: 32.0,
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  // END OF ADD LOGO

                  // LIST OF TODO's
                  Expanded(
                    child: FutureBuilder(
                      future: _dpHelper.getTasks(),
                      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TaskPage(
                                            task: snapshot.data![index]),
                                      ),
                                    ).then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: TaskCardWidget(
                                    title: snapshot.data?[index].title,
                                    desc: snapshot.data?[index].description,
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                  ),
                  // END OF LIST OF TODO'S
                ],
              ),

              // ADD TASK ICON BUTTON
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskPage(
                                  task: null,
                                ))).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF7349FE), Color(0xFF643FDB)],
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                      ),
                      //color: Color(0xFF7349FE),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/add_icon.png'),
                    ),
                  ),
                ),
              )
              // END OF TASK ICON BUTTON
            ],
          ),
        ),
      ),
    );
  }
}
