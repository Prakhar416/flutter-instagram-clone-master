import 'dart:io';
import 'package:flutter/material.dart';

import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class AddPostInfo extends StatefulWidget {
  var savedImagedPath;
  var uint8list;
  var changeIndex;

  AddPostInfo({this.savedImagedPath, this.uint8list, this.changeIndex});

  @override
  _AddPostInfoState createState() => _AddPostInfoState();
}

class _AddPostInfoState extends State<AddPostInfo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController description = TextEditingController();

  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context, listen: false);

    addNewPost() async {
      var id = state.user.id;
      final url = Uri.parse("http://10.0.2.2:5000/post/add/$id");

      var request = http.MultipartRequest('POST', url)
        ..fields['description'] = description.text
        ..files.add(
            await http.MultipartFile.fromPath('image', widget.savedImagedPath));
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Uploaded!');
        var appState = Provider.of<AppState>(context, listen: false);
        var postState = Provider.of<PostState>(context, listen: false);

        postState.getFriendsPosts(appState.user.id);
      }
    }

    // print(widget.savedImagedPath);
    // print(widget.uint8list);

    return widget.savedImagedPath == null || widget.uint8list == null
        ? Center(child: CircularProgressIndicator())
        : Material(
            color: Colors.black,
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.black,
                      leading: GestureDetector(
                        onTap: () {
                          widget.changeIndex(1);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      title: Text('Post Info'),
                      actions: [
                        GestureDetector(
                            onTap: () async {
                              await addNewPost();
                              state.changePage(1);
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
                    SingleChildScrollView(
                      child: Column(children: [
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            setState(() {
                              isTyping = false;
                            });
                          },
                          child: AnimatedContainer(
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 800),
                              height: isTyping == false
                                  ? MediaQuery.of(context).size.width
                                  : 150,
                              child: widget.savedImagedPath == null
                                  ? CircularProgressIndicator()
                                  : Image.file(
                                      File(widget.savedImagedPath),
                                      fit: BoxFit.contain,
                                    )),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.shade800,
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Form(
                              key: _formKey,
                              child: TextField(
                                controller: description,
                                onTap: () {
                                  setState(() {
                                    isTyping = true;
                                  });
                                },
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.blue)),
                                  hintText: 'Add A Description',
                                  contentPadding: EdgeInsets.all(
                                    10,
                                  ),
                                ),
                              )),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
