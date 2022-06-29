import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
import 'package:google_classroom/pages/class/bottom_naviaton_class.dart';

class ClassCard extends StatefulWidget {
  final snap;
  const ClassCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<ClassCard> createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  @override
  Widget build(BuildContext context) {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    String imgLink = widget.snap['classImage'].toString();
    var classId = widget.snap['classId'].toString();
    bool isMe = widget.snap['uid'] == uid;
    return InkWell(
      onTap: () async {
        //var classId = widget.snap['classId'].toString();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavPageClass(snap: widget.snap)));
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(66, 133, 244, 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/$imgLink',
                fit: BoxFit.fill,
              ),
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
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Text(
                      //     widget.snap['room'] ?? '',
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      // )
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
            trailing: isMe
                ? PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('Share invite link'),
                              )),
                          PopupMenuItem(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('Edit'),
                              )),
                          PopupMenuItem(
                              onTap: () {
                                FireStoreMethods().deleteClass(classId);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('Archive'),
                              )),
                        ])
                : PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {
                                FireStoreMethods().quitClass(
                                    widget.snap['classId'].toString(),
                                    FirebaseAuth.instance.currentUser!.uid);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('Unenroll'),
                              )),
                        ]),
          )
        ],
      ),
    );
  }
}
