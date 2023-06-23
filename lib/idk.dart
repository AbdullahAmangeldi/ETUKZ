import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class MyImagePage extends StatefulWidget {
  @override
  _MyImagePageState createState() => _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
  String? _imageURL = '';
  late Future<ListResult> futureFiles;

  Future<void> getImageURL() async {
    // Get the document containing the URL of the image from Firestore
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('images')
        .doc('IMG-20230506-WA0010')
        .get();

    // Check if the document exists before accessing its data
  }

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseStorage.instance.ref('files').listAll();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сдатые задания'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: 200,
                child: FutureBuilder<ListResult>(
                  future: futureFiles,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final files = snapshot.data!.items;
                      return ListView.builder(
                          itemCount: files.length,
                          itemBuilder: ((context, index) {
                            final file = files[index];
                            return Container(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(file.name.toString()),
                                    trailing: IconButton(
                                      onPressed: () => downloadFile(file),
                                      icon: Icon(Icons.download),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
                    } else if (snapshot.hasError) {
                      return Text('');
                    } else {
                      return const Text('');
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }

  Future downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();

    //String directoryPath = root.path + '/bozzetto_camera';
    final tempDir = await getTemporaryDirectory();
    final path = (tempDir.path + '/' + ref.name);
    await Dio().download(url, path.toString());

    await GallerySaver.saveImage('${tempDir.path}/${ref.name}');
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('${ref.name} жазылды!')));
  }
}
