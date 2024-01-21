import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../../gpt_module_package.dart';

class OpenAiServices {
  ///[model] model type(name) passed as enum
  final ModelType model;

  ///[prompt] prompt text for gpt api
  final String prompt;

  ///[imagePath] if the image is present locally use the byteLoader() method before passing.
  ///image url can be passed directly
  final dynamic image;

  ///[_requestModel] requestModel private instance
  late RequestModel _requestModel;

  ///[_response] response by gpt stored as private variable
  static late http.Response _response;

  OpenAiServices({required this.model, required this.prompt, this.image}) {
    _requestModel = RequestModel(model: model, prompt: prompt, imageContent: image);

  }

  Future<http.Response> requestAndGet() async {
    //initial structureType
    PayloadStructureType payloadStructureType = PayloadStructureType.textInputChatCompletion;

    //local image structure check
    if(_requestModel.imageContent is Uint8List){
      payloadStructureType = PayloadStructureType.assetImageInputChatCompletion;
    }
    //network image structure check
    else if(_requestModel.imageContent is String){
      payloadStructureType = PayloadStructureType.networkImageInputChatCompletion;
    }

    //url switching
    Uri uri = Uri.parse(urlTypeSwitch(UrlType.chatCompletion));

    //header setup
    Map<String, String> header =
        _requestModel.headerEncoder();

    //payload setup
    String payload = await  _requestModel
        .payloadEncoder(payloadStructureType);

    //api post call made to OpenAI
    _response = await http.post(uri, headers: header, body: payload);

    //response as output
    return _response;
  }

  ///[responseContent] map out the actual content from response.
  String responseContent(){
    //mapping out
    Map<String, dynamic> data = jsonDecode(_response.body);

    //only content returned
    return data['choices'][0]['message']['content'];
  }

}
