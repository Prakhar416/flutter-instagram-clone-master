import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_clone/state/models/ImageModel.dart';

class GalleryGrid extends StatelessWidget {
  var images;
  var getSelectedImage;
  var selectedIndexImage;

  GalleryGrid(
      {this.images, this.selectedIndexImage, required this.getSelectedImage});

  @override
  Widget build(BuildContext context) {
    return images == null
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 4, mainAxisSpacing: 4),
            itemCount: images.files.length,
            itemBuilder: (_, index) {
              var file = images.files[index];
              return GestureDetector(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        selectedIndexImage == index
                            ? Colors.white.withOpacity(0.4)
                            : Colors.white.withOpacity(0),
                        BlendMode.lighten),
                    child: Image.file(
                      File(file),
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () async {
                    await getSelectedImage(index);
                  });
            },
          );
  }
}
