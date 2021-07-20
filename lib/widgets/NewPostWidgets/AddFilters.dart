import 'package:flutter/material.dart';

import 'package:insta_clone/widgets/NewPostWidgets/AddFilters/FilterList.dart';
import 'package:insta_clone/widgets/NewPostWidgets/AddFilters/Filters.dart';

class AddFilters extends StatefulWidget {
  var image;
  var changeIndex;
  var convertWidgetToImage;

  AddFilters({
    this.image,
    this.changeIndex,
    this.convertWidgetToImage,
  });

  @override
  _AddFiltersState createState() => _AddFiltersState();
}

class _AddFiltersState extends State<AddFilters> {
  final GlobalKey globalKey = GlobalKey();

  var selectedIndexFilter = 0;
  final List<List<double>> filters = FILTERS;
  getSelectedIndex(index) {
    setState(() {
      selectedIndexFilter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.image == null
        ? Center(child: CircularProgressIndicator())
        : Material(
            color: Colors.black,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBar(
                    backgroundColor: Colors.black,
                    leading: GestureDetector(
                      onTap: () => widget.changeIndex(0),
                      child: Icon(Icons.arrow_back),
                    ),
                    title: Text('Add Filters'),
                    actions: [
                      GestureDetector(
                          onTap: () {
                            widget.convertWidgetToImage(globalKey);
                            widget.changeIndex(2);
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: widget.image == null
                        ? CircularProgressIndicator()
                        : RepaintBoundary(
                            key: globalKey,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.matrix(
                                  filters[selectedIndexFilter]),
                              child: Image.file(
                                widget.image,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                  ),
                  FilterList(
                    image: widget.image,
                    getSelectedIndex: getSelectedIndex,
                    selectedIndexFilter: selectedIndexFilter,
                  ),
                ],
              ),
            ),
          );
  }
}
