import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              child: Row(
                children: const [
                  Text(
                    "G",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 66, 133, 244)),
                  ),
                  Text(
                    "o",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 219, 68, 55)),
                  ),
                  Text(
                    "o",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 244, 160, 0)),
                  ),
                  Text(
                    "g",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 66, 133, 244)),
                  ),
                  Text(
                    "l",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 15, 157, 88)),
                  ),
                  Text(
                    "e",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 219, 68, 55)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Classrom",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              MdiIcons.homeOutline,
              color: Color.fromARGB(255, 8, 136, 240),
            ),
            title: const Text(
              'Classes',
              style: TextStyle(
                color: Color.fromARGB(255, 8, 136, 240),
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(MdiIcons.calendarBlank),
            title: const Text("Calendar"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_outlined,
            ),
            title: const Text("Notificatons"),
            onTap: () {},
          ),
          const Divider(),
          Column(
            children: [
              const Text(
                'Teaching',
                style: TextStyle(color: Colors.grey),
              ),
              ListTile(
                leading: const CircleAvatar(),
                title: const Text('ACT 201(Fall 2021-22)'),
                subtitle: const Text('CSE'),
                onTap: () {},
              ),
              const Divider(),
            ],
          ),
          Column(
            children: [
              const Text('Enrolled'),
              ListTile(
                leading: const Icon(MdiIcons.calendarCheck),
                title: const Text('To-do'),
                onTap: () {},
              ),
              ListTile(
                leading: const CircleAvatar(),
                title: const Text('Biology'),
                subtitle: const Text('BIO'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(MdiIcons.checkCircleOutline),
                title: const Text('Offline files'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(MdiIcons.downloadBoxOutline),
                title: const Text('Archived classes'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(MdiIcons.folderOutline),
                title: const Text('Classroom folders'),
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
