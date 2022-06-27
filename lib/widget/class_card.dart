import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
import 'package:google_classroom/pages/class_page.dart';
import 'package:google_classroom/utils/utils.dart';

class ClassCard extends StatefulWidget {
  final snap;
  const ClassCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  deleteClass(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var classId = widget.snap['classId'].toString();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClassPage(
                      snap: widget.snap,
                    )));
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(66, 133, 244, 1),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: .0),
                    child: Text(
                      widget.snap['name'] ?? '',
                      style: const TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.snap['section'] ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          widget.snap['room'] ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                widget.snap['teacherName'] ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
