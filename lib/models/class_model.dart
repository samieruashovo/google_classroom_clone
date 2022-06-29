import 'package:cloud_firestore/cloud_firestore.dart';

class Class {
  final String name;
  final String section;
  final String room;
  final String subject;
  final String uid;
  final String classId;
  final String teacherName;
  final String classImage;
  final String students;
  Class({
    required this.students,
    required this.teacherName,
    required this.classId,
    required this.name,
    required this.section,
    required this.room,
    required this.subject,
    required this.uid,
    required this.classImage,
  });

  static Class fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Class(
        classImage: snapshot['classImage'],
        name: snapshot['name'],
        room: snapshot['room'],
        section: snapshot['section'],
        subject: snapshot['subject'],
        classId: snapshot['classId'],
        uid: snapshot['uid'],
        teacherName: snapshot['teacherName'],
        students: snapshot['students']);
  }

  Map<String, dynamic> toJosn() => {
        'classImage': classImage,
        'name': name,
        'room': room,
        'section': section,
        'subject': subject,
        'uid': uid,
        'classId': classId,
        'teacherName': teacherName,
        'students': students
      };
}
