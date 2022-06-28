import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_classroom/pages/class/create_class_page.dart';
import 'package:google_classroom/pages/drawer_page.dart';
import 'package:google_classroom/widget/class_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Google Classroom',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 1,
          actions: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(getProfilemage()),
              backgroundColor: Colors.transparent,
            ),
            PopupMenuButton(
                itemBuilder: (context) => [
                      const PopupMenuItem(child: Text('Refresh')),
                      const PopupMenuItem(child: Text('Send Google feedback')),
                    ])
          ],
        ),
        drawer: const SizedBox(
          child: DrawerPage(),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('class').snapshots(),
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
                margin: const EdgeInsets.all(3.0),
                child: ClassCard(snap: snapshot.data!.docs[index].data()),
              ),
            );
          },
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue),
          children: [
            SpeedDialChild(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateClassPage()));
                },
                label: 'Create class',
                child: const Icon(Icons.add)),
            SpeedDialChild(label: 'Join class', child: const Icon(Icons.add)),
          ],
        ));
  }
}

getProfilemage() {
  if (FirebaseAuth.instance.currentUser!.photoURL != null) {
    return FirebaseAuth.instance.currentUser!.photoURL;
  }
}