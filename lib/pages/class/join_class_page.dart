import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_classroom/methods/firestore_methods.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class JoinClassPage extends StatefulWidget {
  const JoinClassPage({Key? key}) : super(key: key);

  @override
  State<JoinClassPage> createState() => _JoinClassPageState();
}

class _JoinClassPageState extends State<JoinClassPage> {
  final TextEditingController? _classCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
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
            PopupMenuButton(
                itemBuilder: (context) => [
                      const PopupMenuItem(child: Text('Send Google feedback')),
                    ]),
          ],
          title: Row(
            children: [
              const Text(
                'Join Class',
                style: TextStyle(color: Colors.black),
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
                      FireStoreMethods().joinClass(_classCodeController!.text,
                          FirebaseAuth.instance.currentUser!.uid);
                      Navigator.pop(context);
                    },
                    child: const Text('Join')),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                child: Text(
                  "You're currently signed in as",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(),
                title: Text(
                  'Your name',
                  style: TextStyle(fontSize: 13),
                ),
                subtitle: Text(
                  'youremail@example.com',
                  style: TextStyle(fontSize: 11),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                color: Colors.grey[400],
                height: 1,
                width: MediaQuery.of(context).size.width * 0.90,
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                    'Ask your teacher for the class code, then enter it here'),
              ),
              Container(
                margin: const EdgeInsets.all(14.0),
                child: TextFormField(
                  controller: _classCodeController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Class Code',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  "To sign in with a class code",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              _text("> Use an authorized account"),
              _text(
                  "> Use a class code, with 6-7 letters and numbers, \n and no spaces or symbol"),
              _text(
                  "if you are having trouble joining the class, go to\n the Help Center article "),
            ],
          ),
        ));
  }

  _text(String text) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        text,
        //style: const TextStyle(),
      ),
    );
  }
}
