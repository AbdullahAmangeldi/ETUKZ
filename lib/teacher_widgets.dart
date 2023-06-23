import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

class studentsPage extends StatefulWidget {
  const studentsPage({super.key});

  @override
  State<studentsPage> createState() => _studentsPageState();
}

class _studentsPageState extends State<studentsPage> {
  Widget buildUser(Student student) => Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: Icon(Icons.access_alarms_sharp),
                        content: Text(student.id),
                        actions: <Widget>[],
                      ));
            },
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor:
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                  child: Text(
                    student.name[0],
                    style: TextStyle(color: Colors.white),
                  )),
              title: Text(student.name),
              subtitle: Text(student.group),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );

  Stream<List<Student>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .where('isteacher', isEqualTo: false)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Student.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Студенты'),
      ),
      body: studList(),
    );
  }

  Widget studList() {
    return StreamBuilder(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class Student {
  String id;
  bool isteacher;
  final String name;
  final String group;

  Student({
    required this.group,
    required this.isteacher,
    required this.id,
    required this.name,
  });
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'isteacher': isteacher, 'group': group};
  static Student fromJson(Map<String, dynamic> json) => Student(
        isteacher: (json['isteacher'] ?? false),
        id: (json['id'] ?? '').toString(),
        name: (json['name'] ?? '').toString(),
        group: (json['group'] ?? '').toString(),
      );
}

Widget _entryField(
  String title,
  TextEditingController controller,
) {
  return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          labelText: title,
          labelStyle: TextStyle(color: Colors.white, letterSpacing: 1)));
}

class HomeWorkpage extends StatefulWidget {
  const HomeWorkpage({super.key});

  @override
  State<HomeWorkpage> createState() => _HomeWorkpageState();
}

class _HomeWorkpageState extends State<HomeWorkpage> {
  Widget buildAssigments(Assignment assignment) => Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {},
              child: ListTile(
                title: Text(
                  assignment.assignmentName,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text('\n\n' + assignment.assignmentDetails),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      );

  Stream<List<Assignment>> readAssigments() => FirebaseFirestore.instance
      .collection('groups')
      .doc('RPO2-21K')
      .collection('assignments')
      .snapshots()
      //groups/RPO2-21K/assignments
      .map((snapshot) =>
          snapshot.docs.map((doc) => Assignment.fromJson(doc.data())).toList());

  @override
  TextEditingController assignmentNameCont = TextEditingController();
  TextEditingController assignmentDetCont = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      actionsAlignment: MainAxisAlignment.start,
                      title:
                          Text('ДОБАВИТЬ ЗАДАНИЕ', textAlign: TextAlign.center),
                      content: Container(
                        height: 170,
                        child: Column(
                          children: [
                            _entryField('Задание', assignmentNameCont),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: _entryField('Детали', assignmentDetCont))
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('ОТМЕНИТЬ')),
                            ElevatedButton(
                                onPressed: () {
                                  createAssignment(
                                      assignmentName: assignmentNameCont.text,
                                      assignmentDetails:
                                          assignmentDetCont.text);
                                  Navigator.of(context).pop();
                                  assignmentDetCont.clear();
                                  assignmentNameCont.clear();
                                },
                                child: Text('ДОБАВИТЬ')),
                          ],
                        )
                      ],
                    ));
          }),
      appBar: AppBar(
        title: const Text('Домашние задания'),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
                child: Container(
                  height: 720,
                  child: StreamBuilder(
                      stream: readAssigments(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          final users = snapshot.data!;
                          return ListView(
                            children: users.map(buildAssigments).toList(),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future createAssignment({
  required String assignmentName,
  required String assignmentDetails,
}) async {
  final docUser = FirebaseFirestore.instance
      .collection('groups')
      .doc('RPO2-21K')
      .collection('assignments')
      .doc();
  final subject = Assignment(
      id: docUser.id,
      assignmentName: assignmentName,
      assignmentDetails: assignmentDetails);
  final json = subject.toJson();
  await docUser.set(json);
}

class Assignment {
  String id;
  final String assignmentName;
  final String assignmentDetails;
  Assignment({
    required this.id,
    required this.assignmentName,
    required this.assignmentDetails,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'assignmentName': assignmentName,
        'assignmentDetails': assignmentDetails
      };
  static Assignment fromJson(Map<String, dynamic> json) => Assignment(
      id: (json['id'] ?? '').toString(),
      assignmentName: (json['assignmentName'] ?? '').toString(),
      assignmentDetails: (json['assignmentDetails'] ?? '').toString());
}

class resultsPage extends StatefulWidget {
  const resultsPage({super.key});

  @override
  State<resultsPage> createState() => _resultsPageState();
}

class _resultsPageState extends State<resultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
