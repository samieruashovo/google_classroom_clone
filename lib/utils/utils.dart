import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
  );
  if (result == null) return null;
  return File(result.paths.first!).readAsBytes();
}

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}

textField(TextEditingController controller, String labelText) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(3),
    ),
    margin: const EdgeInsets.all(10.0),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: const UnderlineInputBorder(),
        ),
      ),
    ),
  );
}
