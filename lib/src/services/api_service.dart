class OpenAiService {
  //private instance
  static OpenAiService? _openAiService;

  //key
  String? openAiApiKey;

  //private constructor
  OpenAiService._();

  factory OpenAiService() {
    _openAiService ??= OpenAiService._();
    return _openAiService!;
  }

  //initializer of key
  void openAiServiceInitialize({required String apiKey}){
    openAiApiKey = apiKey;
  }

  OpenAiService? get openAiServiceInstance => _openAiService;
}

///NOTE: API KEY SHOULD NOT BE NULL --> ALWAYS MAKE A CHECK FOR THE KEY BEFORE ANY CALLBACK OR MODEL CREATION