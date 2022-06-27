import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
import 'package:google_classroom/utils/utils.dart';

class CreatePostScreen extends StatefulWidget {
  final String classId;
  const CreatePostScreen({Key? key, required this.classId}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.black,
          ),
        ),
        actions: [
          SizedBox(
            height: 5,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 18, 140, 240))),
              onPressed: () {
                post(FirebaseAuth.instance.currentUser!.uid,
                    _nameController.text, widget.classId);
              },
              child: const Text('Post'),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.people_outline),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('text 01'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('all students'),
              )
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Icon(Icons.more),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Share with your class',
                        enabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your name',
                        enabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.more),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width * 0.80,
                child: const Text('Add attrachment'),
              )
            ],
          ),
        ],
      ), // create class er post start korbo
    );
  }

  _selectFile(BuildContext parentContext) async {
    return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose file'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickFile();
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void post(String uid, String username, String classId) async {
    try {
      String res = await FireStoreMethods().uploadPost(_nameController.text,
          /*_file!,*/ uid, _usernameController.text, classId);
      if (res == "success") {
        showSnackBar(context, 'Posted!');
        clearImage();
      } else {
        showSnackBar(context, res);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
