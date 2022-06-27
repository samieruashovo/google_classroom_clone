import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 100,
            child: DrawerHeader(child: Text('Google Classrom')),
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text("New Group"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text("New Group"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text("New Group"),
            onTap: () {},
          ),
          const Divider(),
          Column(
            children: [
              const Text(
                'Teaching',
                style: TextStyle(color: Colors.grey),
              ),
              // StreamBuilder(
              //   stream:
              //       FirebaseFirestore.instance.collection('class').snapshots(),
              //   builder: (context,
              //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
              //           snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     return ListView.builder(
              //       itemCount: snapshot.data!.docs.length,
              //       itemBuilder: (contx, index) => Container(
              //           margin: const EdgeInsets.all(10.0),
              //           child: ListTile(
              //             leading: const CircleAvatar(),
              //             title: Text(snapshot.data!.docs[index].data()['name'] ??
              //                 'name'),
              //           ) //child: ClassCard(snap: snapshot.data!.docs[index].data()),
              //           ),
              //     );
              //   },
              // ),
              const Divider(),
            ],
          ),
          Column(
            children: [
              const Text('Enrolled'),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('To-do'),
                onTap: () {},
              ),
              ListTile(
                leading: const CircleAvatar(),
                title: const Text('ACT 201(Fall 2021-22)'),
                subtitle: const Text('CSE'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Offline files'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Offline files'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Offline files'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Help'),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
