import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:gpt_module_package/src/models/header/enum/content_type_enum.dart';
import 'package:gpt_module_package/src/models/header/header_model.dart';
import 'package:gpt_module_package/src/models/payload/payload_model.dart';
import 'package:gpt_module_package/src/models/request_model/enum/payload_structure_enum.dart';
import '../payload/enum/model_type_enum.dart';

///[RequestModel] post request model which will be used for http post request
class RequestModel {
  ///[model] model type(name) passed as enum
  final ModelType model;

  ///[prompt] prompt text for gpt api
  final String prompt;

  ///[imagePath] image path provided by the user (locally)
  final File? imageFile;

  RequestModel({required this.model, required this.prompt, this.imageFile});

  ///[payloadEncoder] final encoded json containing payload data
  String payloadEncoder(PayloadStructureType payloadStructureType) {
    //payload model obj
    PayloadModel payloadModel =
        PayloadModel(model: model, prompt: prompt, base64Image: _imageToBase64(imageFile));
    //converted payload model obj into respective structure
    Map<String, dynamic> payloadMap = payloadStructureTypeSwitch(
      payloadStructureType: payloadStructureType,
      payloadModel: payloadModel,
    );
    //converted to json String
    return jsonEncode(payloadMap);
  }

  ///[headerEncoder] final map containing header data
  Map<String, String> headerEncoder(){
    //header model object
    HeaderModel headerModel = HeaderModel(contentType: ContentTypes.applicationJson);

    //edgeCase
    if(headerModel.authorizationKey == null) return {};

    //converted to map
    return headerModel.toMap();
  }

  ///[_imageToBase64] method for converting image file into base64String
  String? _imageToBase64(File? imageFile) {
    print('entered $imageFile');
    if(imageFile == null) return null;

    // Read the image file as bytes
    List<int> imageBytes = imageFile.readAsBytesSync();
    print('fucked');
    // Encode the image bytes to Base64
    String base64String = base64Encode(imageBytes);

    return base64String;
  }
}
