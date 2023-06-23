import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';
import 'student_page.dart';
import 'teacher_page.dart';

final db = FirebaseFirestore.instance;
final usersCollectionRef = db.collection("users");
String nameone = '';
bool _isTeacher = false;
bool _isStudent = false;
void main() => runApp(const MainPage());

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController groupController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.email)
        .get();

    print('User data: ${userDoc.data()}');

    final isTeacher = userDoc.get('isteacher') as bool;
    setState(() {
      _isTeacher = isTeacher;
    });

    final isStudent = userDoc.get('isstudent') as bool;
    setState(() {
      _isStudent = isStudent;
    });
  }

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget errorMessage(text) {
    return SafeArea(
        child: Column(
      children: [Text(text), _signOutButton()],
    ));
  }

  Stream<List<Student>> readUsers() =>
      usersCollectionRef.snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => Student.fromJson(doc.data())).toList());

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('Sign out'));
  }

  Widget buildUser(Student student) => ListTile(
        leading: const CircleAvatar(
            child: Text(
          '',
          style: TextStyle(color: Colors.white),
        )),
        title: Text(student.name + ' ' + student.group),
        subtitle: Text(student.isteacher.toString()),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder<List<Student>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return errorMessage(snapshot.error.toString());
              } else if (snapshot.hasData && _isTeacher && !_isStudent) {
                final users = snapshot.data!;
                return TeacherPage();
              } else if (snapshot.hasData && !_isTeacher && _isStudent) {
                return const studentPage();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future createUser(
      {required String name,
      required bool isTeacher,
      required String group}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user =
        Student(id: docUser.id, name: name, isteacher: isTeacher, group: group);
    final json = user.toJson();
    await docUser.set(json);
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
