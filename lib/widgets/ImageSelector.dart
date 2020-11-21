import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<File> showPicker(BuildContext context) {
   return showModalBottomSheet (
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _pickImage(ImageSource.gallery).then((value) => {
                          print('Value.. $value'),
                          Navigator.of(context).pop(value)
                        });
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _pickImage(ImageSource.camera).then((value) => {
                        print('Value.. $value'),
                        Navigator.of(context).pop(value)
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<File> _pickImage(ImageSource imageSource) async {
    var pickedFile = await ImagePicker().getImage(source: imageSource);
    File imageFile = File(pickedFile.path);
    pickedFile = null;
    if (imageFile != null) {
      imageFile = await _cropImage(imageFile);
      return imageFile;
    }
    return null;
  }

  Future<File> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      final dir = await path_provider.getTemporaryDirectory();
      final targetPath = dir.absolute.path + "/${DateTime.now().millisecondsSinceEpoch}.jpg";
      final imgFile = await compressAndGetFile(imageFile, targetPath);

      return imgFile;
    }
    return null;
  }

  Future<File> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 50,
      rotate: 0,
    );

    print('Length: ${file.lengthSync()}');
    print('Length: ${result.lengthSync()}');
    return result;
  }
}