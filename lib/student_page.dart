import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'main_page.dart';
import 'auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'teacher_page.dart';
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';

List scheduleList = ['', '', '', '', '', ''];
final storage = FirebaseStorage.instance;
final storageRef = FirebaseStorage.instance.ref();

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    return StreamBuilder<DocumentSnapshot>(
      stream:
          usersRef.doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final userDoc = snapshot.data;
        final nameOne = userDoc!.get('name') as String;

        return Text(nameOne);
      },
    );
  }
}

class studentPage extends StatefulWidget {
  const studentPage({super.key});

  @override
  State<studentPage> createState() => _studentPageState();
}

DateTime today = DateTime.now();
String df = today.weekday.toString();
String dateStr = "${today.day}-${today.month}-${today.year}";

class _studentPageState extends State<studentPage> {
  final groupNameController = TextEditingController();
  final subjectController = TextEditingController();

  Widget box(Widget stuff, stufftwo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
      child: Container(
        height: 60,
        width: 58,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              stuff,
              const SizedBox(
                height: 5,
              ),
              Text(
                stufftwo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ]),
      ),
    );
  }

  Widget scheduleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        box(firstLesson(context), '8:00-\n9:20'),
        box(secondLesson(context), '9:30-\n10:50'),
        box(thirdLesson(context), '11:00-\n12:20'),
        box(fourthLesson(context), '12:30-\n13:50'),
        box(fifthLesson(context), '14:00-\n15:20'),
        box(sixthLesson(context), '15:30-\n16:50'),
      ],
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget groupName(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');
    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: usersRef.doc(currentUser!.email).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final nameone = userDoc!.get('group') as String;

          return Text(nameone);
        });
  }

  Widget firstLesson(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('first') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget secondLesson(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('second') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget thirdLesson(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('third') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fourthLesson(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fourth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fifthLesson(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fifth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget sixthLesson(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('sixth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  void fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance
        .collection('groups')
        .doc('RPO2-21K')
        .collection('schedule')
        .doc('monday')
        .get();

    print('User data: ${userDoc.data()}');

    scheduleList[0] = (userDoc.get('first'));
    scheduleList[1] = (userDoc.get('second'));
    scheduleList[2] = (userDoc.get('third'));
    scheduleList[3] = (userDoc.get('fourth'));
    scheduleList[4] = (userDoc.get('fifth'));
    scheduleList[5] = (userDoc.get('sixth'));
  }

  Widget _entryField(controller, title) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            labelText: title,
            labelStyle:
                const TextStyle(color: Colors.white, letterSpacing: 1)));
  }

  Widget _contentCard(icon, title) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(icon), Text(title)],
      ),
    );
  }

  Widget _studentName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          child: Text(
            nameone,
            style: const TextStyle(
                fontSize: 40,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
    );
  }

  Stream<List<Group>> readGroups() => FirebaseFirestore.instance
      .collection('groups')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Group.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: ListView(children: <Widget>[
          const DrawerHeader(
            child: UserName(),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  signOut();
                });
              },
              child: const Text('ВЫЙТИ!'))
        ]),
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        actionsIconTheme: const IconThemeData(),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [const UserName(), Text(dateStr), groupName(context)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Расписание сегодня, ' +
                  today.day.toString() +
                  '.' +
                  today.month.toString(),
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            scheduleWidget(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 110,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SchedulePage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.book),
                            const Text('Расписание')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const homeWorkUploadPage()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.book),
                            const Text('Отправить ДЗ')
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const homeWorkpage()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.book),
                            const Text('Домашние задания ')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const gradesPage()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.book),
                            const Text('Оценки')
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future createGroup({required String groupname}) async {
    final docUser = FirebaseFirestore.instance.collection('groups').doc();

    final user = Group(
      id: docUser.id,
      groupname: groupname,
    );
    final json = user.toJson();
    await docUser.set(json);
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }
}

Widget buildUser(Group group) => ListTile(
      leading: const CircleAvatar(
          child: Text(
        '',
        style: TextStyle(color: Colors.white),
      )),
      title: Text(group.groupname),
    );

class Group {
  String id;
  final String groupname;

  Group({
    required this.groupname,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'groupname': groupname,
      };
  static Group fromJson(Map<String, dynamic> json) => Group(
        id: (json['id'] ?? '').toString(),
        groupname: (json['groupname'] ?? '').toString(),
      );
}

Future createSubject(
    {required String subjectname,
    required int subjecthours,
    required String groupname}) async {
  final docUser = FirebaseFirestore.instance
      .collection('groups')
      .doc('RPO2-21K')
      .collection('subjects')
      .doc();
  final subject = Subject(
      id: docUser.id, subjectname: subjectname, subjecthours: subjecthours);
  final json = subject.toJson();
  await docUser.set(json);
}

class Subject {
  String id;
  final String subjectname;
  final int subjecthours;

  Subject({
    required this.id,
    required this.subjectname,
    required this.subjecthours,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'subjectname': subjectname, 'subjecthours': subjecthours};
  static Subject fromJson(Map<String, dynamic> json) => Subject(
      id: (json['id'] ?? '').toString(),
      subjectname: (json['subjectname'] ?? '').toString(),
      subjecthours: (json['subjecthours'] ?? 0));
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  Widget schedRow(String day, Widget one, Widget two, Widget three, Widget four,
      Widget five, Widget six) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          height: 224,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pinkAccent),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  day,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'SourceSansPro'),
                ),
                Column(
                  children: [
                    subjectLine(
                      one,
                    ),
                    subjectLine(
                      two,
                    ),
                    subjectLine(
                      three,
                    ),
                    subjectLine(
                      four,
                    ),
                    subjectLine(
                      five,
                    ),
                    subjectLine(six)
                  ],
                )
              ]),
        ));
  }

  Widget subjectLine(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 24,
            child: child,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(2)),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 7,
          )
        ],
      ),
    );
  }

  Widget firstLessonMon(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('first') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget secondLessonMon(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('second') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget thirdLessonMon(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('third') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fourthLessonMon(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fourth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fifthLessonMon(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fifth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget sixthLessonMon(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('monday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('sixth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget firstLessonWed(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('wednesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('first') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget secondLessonWed(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('wednesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('second') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget thirdLessonWed(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('wednesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('third') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fourthLessonWed(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('wednesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fourth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fifthLessonWed(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('wednesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fifth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget sixthLessonWed(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('wednesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('sixth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget firstLessonThu(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('thursday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('first') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget secondLessonThu(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('thursday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('second') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget thirdLessonThu(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('thursday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('third') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fourthLessonThu(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('thursday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fourth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fifthLessonThu(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('thursday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fifth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget sixthLessonThu(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('thursday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('sixth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget firstLessonFri(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('friday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('first') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget secondLessonFri(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('friday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('second') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget thirdLessonFri(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('friday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('third') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget firstLessonSat(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('saturday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('first') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget secondLessonSat(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('saturday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('second') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget thirdLessonSat(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('saturday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('third') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fourthLessonSat(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('saturday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fourth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fifthLessonSat(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('saturday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fifth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget sixthLessonSat(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('saturday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('sixth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fourthLessonFri(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('friday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fourth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fifthLessonFri(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('friday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fifth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget sixthLessonFri(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('friday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('sixth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget firstLessonTue(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('tuesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('first') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget secondLessonTue(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('tuesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('second') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget thirdLessonTue(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('tuesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('third') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fourthLessonTue(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('tuesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fourth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget fifthLessonTue(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('tuesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(' '),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('fifth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  Widget sixthLessonTue(BuildContext context) {
    final usersRef = FirebaseFirestore.instance.collection('users');

    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groups')
            .doc('RPO2-21K')
            .collection('schedule')
            .doc('tuesday')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(''),
            );
          }

          final userDoc = snapshot.data;
          final txt = userDoc!.get('sixth') as String;

          return Text(
            txt,
            textAlign: TextAlign.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                    child: schedRow(
                        'Понедельник',
                        firstLessonMon(context),
                        secondLessonMon(context),
                        thirdLessonMon(context),
                        fourthLessonMon(context),
                        fifthLessonMon(context),
                        sixthLessonMon(context))),
                Expanded(
                    child: schedRow(
                        'Вторник',
                        firstLessonTue(context),
                        secondLessonTue(context),
                        thirdLessonTue(context),
                        fourthLessonTue(context),
                        fifthLessonTue(context),
                        sixthLessonTue(context)))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: schedRow(
                        'Среда',
                        firstLessonWed(context),
                        secondLessonWed(context),
                        thirdLessonWed(context),
                        fourthLessonWed(context),
                        fifthLessonWed(context),
                        sixthLessonWed(context))),
                Expanded(
                    child: schedRow(
                        'Четверг',
                        firstLessonThu(context),
                        secondLessonThu(context),
                        thirdLessonThu(context),
                        fourthLessonThu(context),
                        fifthLessonThu(context),
                        sixthLessonThu(context)))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: schedRow(
                        'Пятница',
                        firstLessonFri(context),
                        secondLessonFri(context),
                        thirdLessonFri(context),
                        fourthLessonFri(context),
                        fifthLessonFri(context),
                        sixthLessonFri(context))),
                Expanded(
                    child: schedRow(
                        'Суббота',
                        firstLessonSat(context),
                        secondLessonSat(context),
                        thirdLessonSat(context),
                        fourthLessonSat(context),
                        fifthLessonSat(context),
                        sixthLessonSat(context)))
              ],
            ),
          ]),
        )
      ]),
    );
  }
}

class homeWorkpage extends StatefulWidget {
  const homeWorkpage({super.key});

  @override
  State<homeWorkpage> createState() => _homeWorkpageState();
}

class _homeWorkpageState extends State<homeWorkpage> {
  Widget buildAssigments(Assignment assignment) => Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.blue,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домашние задания'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
            child: SizedBox(
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
    );
  }
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

class homeWorkUploadPage extends StatefulWidget {
  const homeWorkUploadPage({super.key});

  @override
  State<homeWorkUploadPage> createState() => _homeWorkUploadPageState();
}

class _homeWorkUploadPageState extends State<homeWorkUploadPage> {
  PlatformFile? pickedFile;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final file = File(pickedFile!.path!);
    final path = 'files/${pickedFile!.name}';

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Отправить ДЗ '),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          if (pickedFile != null)
            Container(
              height: 300,
              width: 300,
              color: Colors.blue,
              child: Image.file(
                File(pickedFile!.path!),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          if (pickedFile == null)
            Container(
              height: 300,
              width: 300,
              color: Colors.blue,
            ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    selectFile();
                  },
                  child: const Text('Выбрать файл')),
              ElevatedButton(
                  onPressed: () {
                    uploadFile();
                  },
                  child: const Text('Отправить файл'))
            ],
          )
        ]),
      ),
    );
  }
}

class gradesPage extends StatefulWidget {
  const gradesPage({super.key});

  @override
  State<gradesPage> createState() => _gradesPageState();
}

class _gradesPageState extends State<gradesPage> {
  Widget buildGrades(Grade grade) => Column(children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            child: ListTile(
              title: Text(
                grade.grade.toString(),
              ),
              subtitle: Text(grade.descrip),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ]);

  Stream<List<Grade>> readGrades() => FirebaseFirestore.instance
      .collection('users')
      .doc('abdulla@aol.com')
      .collection('grades')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Grade.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оценки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 720,
          child: StreamBuilder(
              stream: readGrades(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  final grades = snapshot.data!;
                  return ListView(
                    children: grades.map(buildGrades).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
