import 'package:flutter/material.dart';
import 'package:google_classroom/pages/drawer_page.dart';

class PeoplePage extends StatelessWidget {
  final String title;
  const PeoplePage({Key? key, required this.title}) : super(key: key);

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Text(
                  "Teachers",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 4, 108, 194),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add_outlined,
                      color: Color.fromARGB(255, 4, 108, 194),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 4, 108, 194),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8.0, 90, 8.0, 8.0),
              child: ListTile(
                leading: const Text(
                  "Students",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 4, 108, 194),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add_outlined,
                      color: Color.fromARGB(255, 4, 108, 194),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 4, 108, 194),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 180),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Invite students to your class",
                      style: TextStyle(),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        primary: const Color.fromARGB(255, 19, 100, 238),
                      ),
                      onPressed: () {},
                      child: const Text("Invite"),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
