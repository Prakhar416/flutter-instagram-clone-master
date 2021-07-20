import 'dart:io';

import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {
  var selectedImage;

  SelectedImage({this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: selectedImage == null
          ? Center(child: CircularProgressIndicator())
          : Image.file(
              File(selectedImage!),
              fit: BoxFit.contain,
            ),
    );
  }
}
