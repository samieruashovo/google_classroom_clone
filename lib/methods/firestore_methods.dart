import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_classroom/models/class_model.dart';
import 'package:google_classroom/models/post_model.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
      String name, String uid, String username, String classId) async {
    String res = "error";

    try {
      String postId = const Uuid().v1();
      Post post = Post(
        postName: name,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
      );
      _firestore
          .collection('class')
          .doc(classId)
          .collection('posts')
          .doc(postId)
          .set(post.toJosn());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> deleteClass(String classId) async {
    String res = "error";
    try {
      await _firestore.collection('class').doc(classId).delete();
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> deletePost(String classId, String postId) async {
    String res = "error";
    try {
      await _firestore
          .collection('class')
          .doc(classId)
          .collection('posts')
          .doc(postId)
          .delete();
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> createClass(String className, String section, String room,
      String subject, String uid, String teacherName, String classImage) async {
    String res = "error";
    try {
      const _chars =
          'AaB1234567890bCcDdEeFfGgHhIiJjKk1234567890LlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      String getRandomCLassCode() => String.fromCharCodes(
          Iterable.generate(9, (_) => _chars.codeUnitAt(Random().nextInt(9))));
      //String classId = const Uuid().v1();
      String classId = getRandomCLassCode();
      Class _class = Class(
        classImage: classImage,
        name: className,
        section: section,
        room: room,
        subject: subject,
        classId: classId,
        uid: uid,
        teacherName: teacherName,
        students: "",
      );
      _firestore.collection('class').doc(classId).set(_class.toJosn());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> joinClass(String classId, String uid) async {
    String res = "error";
    try {
      _firestore.collection('class').doc(classId).update({
        'students': FieldValue.arrayUnion([uid])
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> quitClass(String classId, String uid) async {
    String res = "error";
    try {
      _firestore.collection('class').doc(classId).update({
        'students': FieldValue.arrayRemove([uid])
      });
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
