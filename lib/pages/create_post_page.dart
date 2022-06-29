import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
import 'package:google_classroom/utils/utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreatePostScreen extends StatefulWidget {
  final String classId;
  final bool isMe;
  final String className;
  const CreatePostScreen(
      {Key? key,
      required this.classId,
      required this.isMe,
      required this.className})
      : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
            const Expanded(child: SizedBox.shrink()),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  primary: const Color.fromARGB(255, 19, 100, 238),
                ),
                onPressed: () {
                  post(FirebaseAuth.instance.currentUser!.uid,
                      _nameController.text, widget.classId);
                  Navigator.pop(context);
                },
                child: const Text('Post')),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              widget.isMe
                  ? const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.people_outline,
                        color: Colors.black54,
                      ),
                    )
                  : const SizedBox.shrink(),
              widget.isMe
                  ? Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 190, 222, 248),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 9),
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        widget.className,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 4, 117, 210)),
                      ),
                    )
                  : const SizedBox.shrink(),
              widget.isMe
                  ? Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 190, 222, 248),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 9),
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'All students',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 4, 117, 210)),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.multiline,
                  autofocus: false,
                  maxLines: null,
                  decoration: const InputDecoration(
                    icon: Icon(
                      MdiIcons.menu,
                      color: Colors.grey,
                    ),
                    labelText: 'Share with your class',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            width: MediaQuery.of(context).size.width * 0.90,
            child: Column(
              children: [
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                    labelText: 'Enter your name',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Icon(
                  MdiIcons.attachment,
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width * 0.80,
                child: const Text('Add attrachment'),
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }

  void post(String uid, String username, String classId) async {
    try {
      String res = await FireStoreMethods().uploadPost(
          _nameController.text, uid, _usernameController.text, classId);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
