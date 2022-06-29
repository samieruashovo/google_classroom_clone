import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
import 'package:google_classroom/pages/class/comment_page.dart';
import 'package:intl/intl.dart';

class PostCard extends StatefulWidget {
  final snap;
  final String classId;
  const PostCard({Key? key, required this.snap, required this.classId})
      : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var postUid = widget.snap['uid'];
    bool _isMe = postUid == uid;
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            border: Border.all(width: 0.7, color: Colors.grey[400]!),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Text(
                                widget.snap['username'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(
                                widget.snap.data()['datePublished'].toDate(),
                              ),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _isMe
                      ? PopupMenuButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                    onTap: () {
                                      FireStoreMethods().deletePost(
                                          widget.classId,
                                          widget.snap['postId']);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 40),
                                      child: Text('Delete'),
                                    )),
                              ])
                      : const SizedBox.shrink(),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  widget.snap['postName'],
                  style: const TextStyle(),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CommentPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 20,
                    width: 320,
                    child: Text(
                      'Add a comment',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
