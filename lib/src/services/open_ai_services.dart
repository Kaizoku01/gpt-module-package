import 'package:http/http.dart' as http;
import 'dart:io';
import '../../gpt_module_package.dart';

class OpenAiServices {
  ///[model] model type(name) passed as enum
  final ModelType model;

  ///[prompt] prompt text for gpt api
  final String prompt;

  ///[imagePath] image path provided by the user (locally)
  final File? imageFile;

  late RequestModel _requestModel;

  static late http.Response _response;

  OpenAiServices({required this.model, required this.prompt, this.imageFile}) {
    _requestModel = RequestModel(model: model, prompt: prompt, imageFile: imageFile);
  }

  Future<http.Response> requestAndGet() async {
    PayloadStructureType payloadStructureType = PayloadStructureType.textInputChatCompletion;

    if(_requestModel.imageFile != null){
      payloadStructureType = PayloadStructureType.imageInputChatCompletion;
    }

    Uri uri = Uri.parse(urlTypeSwitch(UrlType.chatCompletion));

    Map<String, String> header =
        _requestModel.headerEncoder();

    String payload = _requestModel
        .payloadEncoder(payloadStructureType);
    _response = await http.post(uri, headers: header, body: payload);
    return _response;
  }
}
