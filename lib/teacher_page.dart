import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/idk.dart';
import 'package:flutter_application_1/student_page.dart';
import 'package:flutter_application_1/teacher_widgets.dart';
import 'teacher_widgets.dart';
import 'auth.dart';
import 'student_page.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage();

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  bool _isTeacher = false;
  String _userName = '';

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

  void fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc('teacher@aol.com')
        .get();

    print('User data: ${userDoc.data()}');

    _isTeacher = userDoc.get('isteacher') as bool;
    _userName = userDoc.get('name') as String;
    setState(() {});
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

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
              child: CircularProgressIndicator(),
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
              child: CircularProgressIndicator(),
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
              child: CircularProgressIndicator(),
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
              child: CircularProgressIndicator(),
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
              child: CircularProgressIndicator(),
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
              child: CircularProgressIndicator(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: ListView(children: <Widget>[
          DrawerHeader(
            child: Text(_userName),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  signOut();
                });
              },
              child: Text('ВЫЙТИ!'))
        ]),
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        actionsIconTheme: const IconThemeData(),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const UserName(),
            Text(dateStr),
          ],
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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeWorkpage()),
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
                            const Text('Задания ')
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const studentsPage()),
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
                            const Text('Студенты ')
                          ],
                        ),
                      ),
                    ),
                  ),
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
                              builder: (context) => MyImagePage()),
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
                            const Text('Сдатые задания ')
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const gradesPageTeacher()),
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
                            const Text('Оценки ')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String errorDetector = '';

class gradesPageTeacher extends StatefulWidget {
  const gradesPageTeacher({super.key});

  @override
  State<gradesPageTeacher> createState() => _gradesPageTeacherState();
}

class _gradesPageTeacherState extends State<gradesPageTeacher> {
  Widget _entryField(
      String title, TextEditingController controller, bool numOnly) {
    return TextField(
        keyboardType: (numOnly) ? TextInputType.number : TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            labelText: title,
            labelStyle: TextStyle(color: Colors.white, letterSpacing: 1)));
  }

  Widget buildGrades(Grade grade) => Column(children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            child: ListTile(
              title: Text(
                grade.grade.toString(),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(grade.descrip),
            ),
          ),
        ),
        SizedBox(
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

  final gradeController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    actionsAlignment: MainAxisAlignment.start,
                    title: Text('ДАТЬ ОЦЕНКУ', textAlign: TextAlign.center),
                    content: Container(
                      height: 170,
                      child: Column(
                        children: [
                          _entryField('Оценка', gradeController, true),
                          SizedBox(
                            height: 10,
                          ),
                          _entryField('Описание', descController, false),
                          SizedBox(
                            height: 20,
                          ),
                          Text(errorDetector),
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
                                if (gradeController.text.isEmpty) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Введите оценку'),
                                      content: const Text(
                                          'Введенное вами значение пусто'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              context, 'Отменить'),
                                          child: const Text('Отменить'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (0 <=
                                        int.parse(gradeController.text) &&
                                    int.parse(gradeController.text) <= 100) {
                                  addGrade(
                                      grade: int.parse(gradeController.text),
                                      descrip: descController.text);
                                  Navigator.pop(context);
                                  gradeController.clear();
                                  descController.clear();
                                } else {
                                  gradeController.clear();
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(
                                          'Введите значение от 0 - 100'),
                                      content: const Text(
                                          'Введенное вами значение не валидно'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Отмена'),
                                          child: const Text('Отмена'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: Text('ДОБАВИТЬ')),
                        ],
                      )
                    ],
                  ))),
      appBar: AppBar(
        title: Text('Оценки'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
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

Future addGrade({required int grade, required String descrip}) async {
  final docUser = FirebaseFirestore.instance
      .collection('users')
      .doc('abdulla@aol.com')
      .collection('grades')
      .doc();

  final subject = Grade(
    id: docUser.id,
    grade: grade,
    descrip: descrip,
  );
  final json = subject.toJson();
  await docUser.set(json);
}

class Grade {
  String id;
  final int grade;
  final String descrip;

  Grade({
    required this.id,
    required this.grade,
    required this.descrip,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'grade': grade, 'descrip': descrip};
  static Grade fromJson(Map<String, dynamic> json) => Grade(
        id: (json['id'] ?? '').toString(),
        grade: (json['grade'] ?? 0),
        descrip: (json['descrip'] ?? '').toString(),
      );
}
