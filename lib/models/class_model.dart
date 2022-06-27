import 'package:cloud_firestore/cloud_firestore.dart';

class Class {
  final String name;
  final String section;
  final String room;
  final String subject;
  final String uid;
  final String classId;
  final String teacherName;
  Class({
    required this.teacherName,
    required this.classId,
    required this.name,
    required this.section,
    required this.room,
    required this.subject,
    required this.uid,
  });

  static Class fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Class(
        name: snapshot['name'],
        room: snapshot['room'],
        section: snapshot['section'],
        subject: snapshot['subject'],
        classId: snapshot['classId'],
        uid: snapshot['uid'],
        teacherName: snapshot['teacherName']);
  }

  Map<String, dynamic> toJosn() => {
        'name': name,
        'room': room,
        'section': section,
        'subject': subject,
        'uid': uid,
        'classId': classId,
        'teacherName': teacherName,
      };
}
