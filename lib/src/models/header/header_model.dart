
import 'dart:developer';

import '../../../gpt_module_package.dart';
import 'enum/content_type_enum.dart';

class HeaderModel {
  final ContentTypes contentType;
  final String? authorizationKey = OpenAiService().openAiApiKey as String;

  HeaderModel({required this.contentType}){
    if(authorizationKey == null){
      log("INSTANTIATION OF THE SERVICE INSTANCE FAILED");
    }
  }

  Map<String, dynamic> toMap() {
    String contentTypeString = contentTypeSwitch(contentType);
    return {
      "Content-Type": contentTypeString,
      "Authorization": "Bearer $authorizationKey"
    };
  }

}