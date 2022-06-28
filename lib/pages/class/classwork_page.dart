import 'package:flutter/material.dart';
import 'package:google_classroom/pages/drawer_page.dart';

class ClassworkPage extends StatelessWidget {
  final String title;
  const ClassworkPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 5, 122, 218),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black54,
              ))
        ],
      ),
      drawer: const DrawerPage(),
      body: const Center(
        child: Text(
          "Add assignments and other work for the \n\t\t\t\tclass and organize it into the topic",
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 5, 122, 218),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
