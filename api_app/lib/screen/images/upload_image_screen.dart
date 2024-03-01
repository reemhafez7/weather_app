import 'dart:io';

import 'package:api_app/get/images_get_controller.dart';
import 'package:api_app/utils/context_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/api_response.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  double? _progressValue=0;
  late ImagePicker _imagePicker;
  XFile? _pickedImage;
  //اذا هادا مش نل يعني الصورة مختارة

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imagePicker=ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body:Column(
        children: [
          LinearProgressIndicator(
            minHeight: 8,
            color: Colors.green.shade500,
            backgroundColor: Colors.orange.shade200,
            value: _progressValue,
          ),
          Expanded(
              child: _pickedImage != null
                  ? Image.file(File(_pickedImage!.path),)
                  : IconButton(
                  onPressed: ()=> _pickImage(),
                  icon: Icon(Icons.camera),
                  iconSize: 48,
              ),
          ),
          ElevatedButton.icon(
              onPressed: ()=>_uploadImage(),
              icon: Icon(Icons.cloud_upload),
              label:Text('UPLOAD'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              maximumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ) ,
    );
  }

  void _pickImage() async {
    XFile? _image= await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 80
    );
    if(_image != null){
      setState(() {
        _pickedImage= _image;
      });
    }
  }


  void _performUpload(){
    if(_checkData()){
      _uploadImage();
    }
  }

  bool _checkData (){
    if(_pickedImage != null){
      return true;
    }
    context.showSnackBar(message: 'Pick image to upload', error: true);
    return false;
  }
  //هلأ عشان يتحرك الي فوق بس يعمل ابلود
void _uploadImage() async {
  _updateProgressValue();
  ApiResponse apiResponse = await ImagesGetController.to.upload(_pickedImage!.path);
  _updateProgressValue(value: apiResponse.success?1 :0);
  if(apiResponse.success){
    setState(() {
      _pickedImage= null;
    });
    context.showSnackBar(message: apiResponse.message, error: apiResponse.success);
  }
}

  void _updateProgressValue({double? value}) async {
     setState(() {
       _progressValue=value;
     });
  }
}
