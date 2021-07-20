import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/AppState.dart';

// Widgets
import 'package:insta_clone/widgets/NewPostWidgets/SelectImage/AlbumList.dart';
import 'package:insta_clone/widgets/NewPostWidgets/SelectImage/GalleryGrid.dart';
import 'package:insta_clone/widgets/NewPostWidgets/SelectImage/SelectNavigation.dart';
import 'package:insta_clone/widgets/NewPostWidgets/SelectImage/SelectedImage.dart';
import 'package:provider/provider.dart';

class SelectImage extends StatefulWidget {
  var images;
  var folders;
  var selectedImage;
  var selectedFolder;
  var expandFolderList;
  var getSelectedImage;
  var getSelectedFolder;
  var selectedIndexImage;

  var isFolderListActive;

  var changeIndex;
  var cropImage;

  SelectImage(
      {required this.images,
      required this.folders,
      required this.selectedImage,
      required this.selectedFolder,
      required this.expandFolderList,
      required this.getSelectedFolder,
      required this.getSelectedImage,
      required this.isFolderListActive,
      required this.selectedIndexImage,
      required this.changeIndex,
      required this.cropImage});

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context, listen: false);

    return Stack(
      children: [
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.black,
              leading: GestureDetector(
                  onTap: () => state.changePage(1), child: Icon(Icons.cancel)),
              title: Text('New Post'),
              actions: [
                GestureDetector(
                    onTap: () {
                      // widget.changeIndex(1);
                      widget.cropImage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
                    )),
              ],
            ),
            Expanded(
                flex: 1,
                child: SelectedImage(selectedImage: widget.selectedImage)),
            Divider(
              thickness: 1,
              color: Colors.grey.shade900,
              height: 0,
            ),
            SelectNavigation(
              selectedFolder: widget.selectedFolder,
              expandFolderList: widget.expandFolderList,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade900,
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: GalleryGrid(
                  images: widget.images,
                  getSelectedImage: widget.getSelectedImage,
                  selectedIndexImage: widget.selectedIndexImage),
            ),
          ],
        ),
        AlbumList(
            folders: widget.folders,
            getSelectedFolder: widget.getSelectedFolder,
            isFolderListActive: widget.isFolderListActive,
            expandFolderList: widget.expandFolderList)
      ],
    );
  }
}
