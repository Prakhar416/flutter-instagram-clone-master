import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/NewPostWidgets/AddFilters/Filters.dart';

class FilterList extends StatelessWidget {
  final List<List<double>> filters = FILTERS;

  var image;
  var getSelectedIndex;
  var selectedIndexFilter;
  FilterList({
    this.image,
    this.getSelectedIndex,
    this.selectedIndexFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await getSelectedIndex(index);
            },
            child: Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(filters[index]),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: selectedIndexFilter == index
                          ? Border.all(
                              color: Colors.white,
                              width: 3,
                            )
                          : null,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                        ))),
              ),
            ),
          );
        },
      ),
    );
  }
}
