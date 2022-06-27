import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postName;
  final String description;
  final String username;
  final String postId;
  final DateTime datePublished;
 // final String postUrl;
  final String uid;

  Post(
      {required this.postName,
      this.description = '',
      required this.uid,
      required this.username,
      required this.postId,
      required this.datePublished,
     // required this.postUrl,
      });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        postName: snapshot['postName'],
        username: snapshot['username'],
        description: snapshot['description'],
        uid: snapshot['uid'],
        postId: snapshot['postId'],
        datePublished: snapshot['datePublished'],
      // postUrl: snapshot['postUrl'],
        );
  }

  Map<String, dynamic> toJosn() => {
        'postName': postName,
        'username': username,
        'description': description,
        'uid': uid,
        'postId': postId,
        'datePublished': datePublished,
       // 'postUrl': postUrl,
      };
}
