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
