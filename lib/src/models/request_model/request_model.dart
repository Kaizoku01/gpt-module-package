import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:gpt_module_package/src/models/header/enum/content_type_enum.dart';
import 'package:gpt_module_package/src/models/header/header_model.dart';
import 'package:gpt_module_package/src/models/payload/payload_model.dart';
import 'package:gpt_module_package/src/models/request_model/enum/payload_structure_enum.dart';

import '../payload/enum/model_type_enum.dart';

class RequestModel {
  final ModelType model;
  final String prompt;
  final String? imagePath;

  RequestModel({required this.model, required this.prompt, this.imagePath});

  String payloadEncoder(PayloadStructureType payloadStructureType) {
    if (imagePath == null &&
        payloadStructureType == PayloadStructureType.imageInputChatCompletion) {
      log("CANNOT USE IMAGE INPUT PAYLOAD STRUCTURE AS IMAGE PARAMETER IS NULL");
      return '';
    }
    PayloadModel payloadModel =
        PayloadModel(model: model, prompt: prompt, base64Image: _imageToBase64(imagePath));

    Map<String, dynamic> payloadMap = payloadStructureTypeSwitch(
      payloadStructureType: payloadStructureType,
      payloadModel: payloadModel,
    );
    return jsonEncode(payloadMap);
  }

  Map<String, dynamic> headerEncoder(){
    HeaderModel headerModel = HeaderModel(contentType: ContentTypes.applicationJson);
    if(headerModel.authorizationKey == null) return {};
    return headerModel.toMap();
  }

  String? _imageToBase64(String? imagePath) {
    if(imagePath == null) return null;

    File imageFile = File(imagePath);

    // Read the image file as bytes
    Uint8List imageBytes = imageFile.readAsBytesSync();

    // Encode the image bytes to Base64
    String base64String = base64Encode(imageBytes);

    return base64String;
  }
}
