import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:core';


class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  void abc() {
    print("object");
  }
  Future<void> uploadFile(String filepath, String filename) async {
    File file = File(filepath);

    try {
      await storage.ref('tests/$filepath').putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}

Storage obj = Storage();

