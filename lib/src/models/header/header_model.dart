import 'dart:developer';
import '../../../gpt_module_package.dart';

///[HeaderModel] Data Model for http Header body.
class HeaderModel {
  ///[contentType] content type parameter passed as enum value
  final ContentTypes contentType;

  ///[authorizationKey] authorization key for auth parameter
  final String? authorizationKey = OpenAiService().openAiApiKey as String;


  HeaderModel({required this.contentType}){
    //Log message when service manager is not initialized
    if(authorizationKey == null){
      log("INSTANTIATION OF THE SERVICE INSTANCE FAILED");
    }
  }

  ///[toMap] map converter for headerModel
  Map<String, dynamic> toMap() {
    String contentTypeString = contentTypeSwitch(contentType);
    return {
      "Content-Type": contentTypeString,
      "Authorization": "Bearer $authorizationKey"
    };
  }

}