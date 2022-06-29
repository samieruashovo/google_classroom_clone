import 'package:flutter/material.dart';
import 'package:google_classroom/utils/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsClassPage extends StatefulWidget {
  final snap;
  const SettingsClassPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<SettingsClassPage> createState() => _SettingsClassPageState();
}

class _SettingsClassPageState extends State<SettingsClassPage> {
  final TextEditingController? _classNameController = TextEditingController();
  final TextEditingController? _sectionController = TextEditingController();
  final TextEditingController? _roomController = TextEditingController();
  final TextEditingController? _subjectController = TextEditingController();
  final TextEditingController? _teacherNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            MdiIcons.close,
            color: Colors.black54,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
        title: Row(
          children: [
            const Text(
              'Class settings',
              style: TextStyle(color: Colors.black),
            ),
            const Expanded(child: SizedBox.shrink()),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  primary: const Color.fromARGB(255, 19, 100, 238),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Save')),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text(
              'About',
              style: TextStyle(
                  color: Color.fromARGB(255, 19, 100, 238), fontSize: 25),
            ),
          ),
          textField(_classNameController!, widget.snap['name']),
          textField(_sectionController!, 'Description'),
          textField(_roomController!, widget.snap['section']),
          textField(_subjectController!, widget.snap['room']),
          textField(_teacherNameController!, widget.snap['subject']),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text(
              'General',
              style: TextStyle(
                  color: Color.fromARGB(255, 19, 100, 238), fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Student invite settings"),
                PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.black54,
                    ),
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                              child: Text('Disable invite codes')),
                          const PopupMenuItem(child: Text('Reset invite code')),
                        ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text("Class code: ${widget.snap['classId']}"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Invite link: examplelink.com"),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Colors.black54,
                    ))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListTile(
                leading: Image.asset(
                  'assets/meet.png',
                  cacheHeight: 25,
                ),
                title: const Text(
                  'Manage Meet link',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                ),
              )),
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 3),
            child: Text(
              "Classroom Meet link",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Classroom Meet links offer added safety features. \n\nYou don't have permission to create or edit he Meet\n link.\nContact your admin to get access.",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Stream sttings\nStudents can post and comment"),
          ),
          const Divider(
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Stream sttings\nStudents can post and comment"),
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      )),
    );
  }
}
