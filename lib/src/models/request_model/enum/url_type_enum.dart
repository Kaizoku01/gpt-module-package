
///[UrlType] enum for url types associated with OpenAI
enum UrlType {
 chatCompletion
}

///[urlTypeSwitch] enum value initializer for url type
String urlTypeSwitch(UrlType urlType){
  switch(urlType){
    case UrlType.chatCompletion:
      return "https://api.openai.com/v1/chat/completions";
  }
}