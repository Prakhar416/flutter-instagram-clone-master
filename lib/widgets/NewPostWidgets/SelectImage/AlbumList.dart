import 'package:flutter/material.dart';
import 'package:insta_clone/shared/variables.dart';

class AlbumList extends StatelessWidget {
  List<dynamic> folders;
  var getSelectedFolder;
  var isFolderListActive;
  var expandFolderList;

  AlbumList(
      {required this.folders,
      this.getSelectedFolder,
      this.isFolderListActive,
      this.expandFolderList});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      left: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width - 20,
        height:
            isFolderListActive ? MediaQuery.of(context).size.height * 0.80 : 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          // border: Border(
          //     bottom: BorderSide(width: 1, color: Globals.grey),
          //     top: BorderSide(width: 1, color: Globals.grey),
          //     left: BorderSide(width: 1, color: Globals.grey),
          //     right: BorderSide(width: 1, color: Globals.grey)),
          color: Globals.grey.shade900,
        ),
        child: Column(
          children: [
            Container(
              child: GestureDetector(
                onTap: expandFolderList,
                child: Icon(
                  isFolderListActive
                      ? Icons.keyboard_arrow_down_sharp
                      : Icons.keyboard_arrow_up_sharp,
                  size: 25,
                ),
              ),
            ),
            Expanded(
              child: folders == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: folders.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: GestureDetector(
                              onTap: () {
                                getSelectedFolder(index);
                                expandFolderList();
                              },
                              child: Text('${folders[index].toString()}')),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
