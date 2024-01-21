import 'dart:convert';
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
  final dynamic imageContent;

  RequestModel({required this.model, required this.prompt, this.imageContent});

  ///[payloadEncoder] final encoded json containing payload data
  Future<String> payloadEncoder(
      PayloadStructureType payloadStructureType) async {
    //formatted image
    String? image = _imageFormat(imageContent);

    //payload model obj
    PayloadModel payloadModel =
        PayloadModel(model: model, prompt: prompt, base64Image: image);

    //converted payload model obj into respective structure
    Map<String, dynamic> payloadMap = payloadStructureTypeSwitch(
      payloadStructureType: payloadStructureType,
      payloadModel: payloadModel,
    );
    //converted to json String
    return jsonEncode(payloadMap);
  }

  ///[headerEncoder] final map containing header data
  Map<String, String> headerEncoder() {
    //header model object
    HeaderModel headerModel =
        HeaderModel(contentType: ContentTypes.applicationJson);

    //edgeCase
    if (headerModel.authorizationKey == null) return {};

    //converted to map
    return headerModel.toMap();
  }

  ///[_imageFormat] method for converting image file into base64String
  String? _imageFormat(dynamic content) {
    if (content != null) {
      //final imageOutput

      //network image
      if (content is String) {
        return content;
      }
      //local image
      else if (content is Uint8List) {
        return base64Encode(content);
      }
    }
    return null;
  }
}
