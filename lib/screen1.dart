import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storagae/storage.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

var results;
var abc;
Storage storage = Storage();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  results = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'jpeg', 'png', 'jpg'],
                  );
                  setState(() {
                    results = results;
                  });
                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("No file Selected")));
                  }
                  final filepath = results.files.single.path;
                  final filename = results.files.single.name;
                  storage.uploadFile(filepath, filename);
                },
                child: const Text("Add File")),
            if (results != null)
              Container(
                  child: Image.file(
                File(results.files.single.path),
              ))
          ],
        ),
      ),
    );
  }
}
