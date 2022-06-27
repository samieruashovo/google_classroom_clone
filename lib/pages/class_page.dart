import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/pages/create_post_screen.dart';
import 'package:google_classroom/pages/drawer_page.dart';
import 'package:google_classroom/widget/post_card.dart';

class ClassPage extends StatefulWidget {
  //final classId;
  final snap;

  ClassPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  //var uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    var classId = widget.snap['classId'].toString();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      drawer: const DrawerPage(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 110,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(66, 133, 244, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.snap['name'] ?? '',
                      style: const TextStyle(fontSize: 23, color: Colors.white),
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
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: Colors.grey[400]!),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              height: 70,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ListTile(
                leading: CircleAvatar(),
                title: Text(
                  'Share with your class...',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              )),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('class')
                  .doc(classId)
                  .collection('posts')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (contx, index) => Container(
                    margin: const EdgeInsets.all(10.0),
                    child: PostCard(
                      snap: snapshot.data!.docs[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreatePostScreen(classId: classId)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
