import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_classroom/methods/storage_methods.dart';
import 'package:google_classroom/models/class_model.dart';
import 'package:google_classroom/models/post_model.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String name, /*Uint8List file,*/ String uid,
      String username, String classId) async {
    String res = "error";

    try {
      // String photoUrl =
      //     await StorageMethods().uploadFileToStorage('posts', file);
      String postId = const Uuid().v1();
      Post post = Post(
        postName: name,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        //postUrl: photoUrl,
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

  Future<String> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    String res = "error";
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = "success";
      } else {
        res = "please enter text";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> deletePost(String postId) async {
    String res = "error";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> createClass(String className, String section, String room,
      String subject, String uid, String teacherName) async {
    String res = "error";
    try {
      String classId = const Uuid().v1();
      Class _class = Class(
        name: className,
        section: section,
        room: room,
        subject: subject,
        classId: classId,
        uid: uid,
        teacherName: teacherName,
      );
      _firestore.collection('class').doc(classId).set(_class.toJosn());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
