import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
import 'package:google_classroom/utils/utils.dart';
import 'dart:math';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreateClassPage extends StatefulWidget {
  const CreateClassPage({Key? key}) : super(key: key);

  @override
  State<CreateClassPage> createState() => _CreateClassPageState();
}

class _CreateClassPageState extends State<CreateClassPage> {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController? _classNameController = TextEditingController();
  final TextEditingController? _sectionController = TextEditingController();
  final TextEditingController? _roomController = TextEditingController();
  final TextEditingController? _subjectController = TextEditingController();
  final TextEditingController? _teacherNameController = TextEditingController();
  @override
  void dispose() {
    _classNameController!.dispose();
    _sectionController!.dispose();
    _roomController!.dispose();
    _subjectController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String randomClassNum = Random().nextInt(12).toString();
    String randomClassImg = 'banner_$randomClassNum.jpg';
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              MdiIcons.close,
              color: Colors.black54,
            )),
        title: Row(
          children: [
            const Text(
              'Create class',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            SizedBox(
              height: 30,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: const Color.fromARGB(255, 19, 100, 238),
                  ),
                  onPressed: () {
                    FireStoreMethods().createClass(
                      _classNameController!.text,
                      _sectionController!.text,
                      _roomController!.text,
                      _subjectController!.text,
                      uid,
                      _teacherNameController!.text,
                      randomClassImg,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Create')),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black54,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textField(_classNameController!, 'Class name(required)'),
            textField(_sectionController!, 'Section'),
            textField(_roomController!, 'Room'),
            textField(_subjectController!, 'Subject'),
            textField(_teacherNameController!, 'Teacher\'s name'),
          ],
        ),
      ),
    );
  }
}
