import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/state/provider/SearchState.dart';
import 'package:insta_clone/widgets/SharedWidgets/CustomIcon.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  var onIsTyping;
  bool isTyping;

  SearchBar({this.onIsTyping, this.isTyping = false});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var searchState = Provider.of<SearchState>(context, listen: false);

    return Row(
      children: [
        widget.isTyping == true
            ? Container(
                width: 40,
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                        widget.onIsTyping(false);
                        searchState.clearUsers();
                        _search.clear();
                      },
                      child: Icon(Icons.arrow_back)),
                ),
              )
            : Container(),
        Container(
          margin: widget.isTyping
              ? EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 10)
              : EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
          width: widget.isTyping
              ? MediaQuery.of(context).size.width - 55
              : MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(5)),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isTyping == false
                  ? CustomIcon(
                      iconName: "search.svg",
                      size: 14,
                      iconColor: Colors.white,
                    )
                  : Container(),
              widget.isTyping == false
                  ? SizedBox(
                      width: 10,
                    )
                  : Container(),
              Expanded(
                flex: 1,
                child: TextFormField(
                  onTap: () {
                    widget.onIsTyping(true);
                    print("typing");
                  },
                  controller: _search,
                  onChanged: (_search) {
                    if (_search.length > 3) {
                      searchState.searchUser(_search);
                    }
                  },
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
