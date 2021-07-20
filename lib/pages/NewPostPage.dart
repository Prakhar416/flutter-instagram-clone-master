// Packages
import 'dart:convert';

import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// ignore: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/NewPostWidgets/AddFilters.dart';
import 'package:insta_clone/shared/variables.dart';
import 'package:insta_clone/state/models/ImageModel.dart';
import 'package:insta_clone/widgets/NewPostWidgets/AddPostInfo.dart';
import 'package:insta_clone/widgets/NewPostWidgets/SelectImage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:storage_path/storage_path.dart';
import 'package:image_cropper/image_cropper.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  var files;

  var folders;
  var images;

  var selectedIndexFolder = 0;
  var selectedIndexImage = 0;
  var selectedFolder;
  var selectedImage;

  bool isFolderListActive = false;

  var editedImage;
  var _stackIndex = 0;
  var _pages;

  var uint8list;
  var savedImagedPath;

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      SelectImage(
          images: images,
          folders: folders,
          selectedImage: selectedImage,
          selectedFolder: selectedFolder,
          getSelectedImage: getSelectedImage,
          getSelectedFolder: getSelectedFolder,
          isFolderListActive: isFolderListActive,
          expandFolderList: expandFolderList,
          selectedIndexImage: selectedIndexImage,
          changeIndex: changeIndex,
          cropImage: cropImage),
      AddFilters(
        image: editedImage,
        changeIndex: changeIndex,
        convertWidgetToImage: convertWidgetToImage,
      ),
      AddPostInfo(
        uint8list: uint8list,
        savedImagedPath: savedImagedPath,
        changeIndex: changeIndex,
      )
    ];

    return Material(
      color: Globals.black,
      child: SafeArea(
        child: IndexedStack(index: _stackIndex, children: _pages),
      ),
    );
  }

  void requestPermission() async {
    PermissionStatus storage = await Permission.storage.request();
    PermissionStatus camera = await Permission.camera.request();

    print('storage $storage');
    print('camera $camera');

    if (storage.isGranted && camera.isGranted) {
      fetchImages();
    } else if (storage.isDenied || camera.isDenied) {
      await openAppSettings();
    }
    //
  }

  Future<dynamic> fetchImages() async {
    var imagePathJson = await StoragePath.imagesPath;
    var imagePaths = await jsonDecode(imagePathJson) as List;
    files = imagePaths.map<ImageModel>((e) => ImageModel.fromJson(e)).toList();

    if (files != null && files!.length > 0) {
      setState(() {
        selectedIndexFolder = 0;
        folders = files!.map((element) {
          return element.folder;
        }).toList();
        selectedFolder = folders[0];
        images = files![0];
        selectedImage = files![0].files[0];
        selectedIndexImage = 0;
      });
    }
  }

  void getSelectedFolder(index) {
    setState(() {
      selectedIndexFolder = index;
      selectedFolder = folders[index];
      images = files![index];
      selectedImage = files![index].files[0];
    });
  }

  void getSelectedImage(index) {
    setState(() {
      if (files != null && files!.length > 0) {
        setState(() {
          selectedImage = files![selectedIndexFolder].files[index];
          selectedIndexImage = index;
          print(selectedImage);
          print(selectedIndexImage);
        });
      }
    });
  }

  void expandFolderList() {
    setState(() {
      isFolderListActive = !isFolderListActive;
    });
  }

  void cropImage() async {
    if (selectedImage == null) return;

    File? croppedFile = await ImageCropper.cropImage(
        compressQuality: 100,
        compressFormat: ImageCompressFormat.png,
        sourcePath: selectedImage,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
            // hideBottomControls: true,
            activeControlsWidgetColor: Colors.grey.shade700,
            backgroundColor: Colors.black,
            statusBarColor: Colors.black,
            toolbarTitle: 'Edit Image',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
            aspectRatioLockEnabled: true,
            title: 'Edit Image'));

    if (croppedFile == null) {
      return;
    } else {
      editedImage = croppedFile;
      changeIndex(
        1,
      );
    }
  }

  void convertWidgetToImage(globalKey) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    uint8list = byteData!.buffer.asUint8List();

    PermissionStatus status = await Permission.storage.request();

    print(status);

    if (status.isGranted) {
      var uuid = Uuid();

      final result = await ImageGallerySaver.saveImage(uint8list,
          name: uuid.v1(), quality: 100);

      print(result['isSuccess']);

      if (result['isSuccess'] == true) {
        var imagePath = result['filePath'];

        setState(() {
          savedImagedPath = imagePath.substring(7);
        });

        print(savedImagedPath);
      }
    }
  }

  void changeIndex(index) {
    setState(() {
      _stackIndex = index;
      // Widget name = _pages[index];
      // _pages.removeAt(index);
      // _pages.insert(index, name);
    });
  }

//
}
