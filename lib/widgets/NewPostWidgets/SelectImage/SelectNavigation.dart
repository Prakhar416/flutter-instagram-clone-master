import 'package:flutter/material.dart';
import 'package:insta_clone/shared/variables.dart';

class SelectNavigation extends StatelessWidget {
  var selectedFolder;
  var expandFolderList;

  SelectNavigation({this.selectedFolder, this.expandFolderList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      color: Globals.black,
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: GestureDetector(
            onTap: expandFolderList,
            child: Text(
              selectedFolder == null ? "No Album" : selectedFolder,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          )),
          // Container(
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Icon(
          //       Icons.keyboard_arrow_up_sharp,
          //       size: 25,
          //     ),
          //   ),
          // ),
          Container(
            child: Icon(
              Icons.camera_alt_outlined,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
