///[OpenAiServiceManager] manager class for initializing OpenAi services
class OpenAiServiceManager {
  //private instance
  static OpenAiServiceManager? _openAiServiceManager;

  //api key
  String? openAiApiKey;

  //private constructor
  OpenAiServiceManager._();

  factory OpenAiServiceManager() {
    _openAiServiceManager ??= OpenAiServiceManager._();
    return _openAiServiceManager!;
  }

  //initializer of key
  void initialize({required String apiKey}){
    openAiApiKey = apiKey;
  }

  //public getter for instance
  OpenAiServiceManager? get openAiServiceManagerInstance => _openAiServiceManager;
}