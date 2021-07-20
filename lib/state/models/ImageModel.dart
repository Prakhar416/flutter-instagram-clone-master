class ImageModel {
  late List<String> files;
  late String folder;

  ImageModel({this.files = const [], this.folder = ""});

  ImageModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }
}
