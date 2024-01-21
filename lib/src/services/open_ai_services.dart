import 'package:http/http.dart' as http;

import '../../gpt_module_package.dart';

class OpenAiServices {
  ///[model] model type(name) passed as enum
  final ModelType model;

  ///[prompt] prompt text for gpt api
  final String prompt;

  ///[imagePath] image path provided by the user (locally)
  final String? imagePath;

  late RequestModel _requestModel;

  static late http.Response _response;

  OpenAiServices({required this.model, required this.prompt, this.imagePath}) {
    _requestModel = RequestModel(model: model, prompt: prompt);
  }

  Future<http.Response> requestAndGet() async {
    Uri uri = Uri.parse(urlTypeSwitch(UrlType.chatCompletion));

    Map<String, String> header =
        _requestModel.headerEncoder() as Map<String, String>;

    String payload = _requestModel
        .payloadEncoder(PayloadStructureType.textInputChatCompletion);
    _response = await http.post(uri, headers: header, body: payload);
    return _response;
  }
}
