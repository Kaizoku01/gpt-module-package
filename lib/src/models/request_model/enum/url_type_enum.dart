enum UrlType {
 chatCompletion
}

String urlTypeSwitch(UrlType urlType){
  switch(urlType){
    case UrlType.chatCompletion:
      return "https://api.openai.com/v1/chat/completions";
  }
}