import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
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
    String randomClassNum = Random().nextInt(13).toString();
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
            Container(
              padding: const EdgeInsets.only(left: 70),
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
      body: Column(
        children: [
          _textField(_classNameController!, 'Class name(required)'),
          _textField(_sectionController!, 'Section'),
          _textField(_roomController!, 'Room'),
          _textField(_subjectController!, 'Subject'),
          _textField(_teacherNameController!, 'Teachers name'),
        ],
      ),
    );
  }

  _textField(TextEditingController controller, String labelText) {
    return Container(
      color: Colors.grey[200],
      margin: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}

//for random class images
// Random random = Random();
// int radomClassNum = random.nextInt(13);
/*
for random class code
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
     // for calling the function --- print(getRandomString(5));
    */