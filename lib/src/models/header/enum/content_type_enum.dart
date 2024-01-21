
///[ContentTypes] Enum containing all content types associated by OpenAI api
enum ContentTypes {
  applicationJson
}

///[contentTypeSwitch] contentType enum value initializer method.
String contentTypeSwitch(ContentTypes content){
  switch(content){
    case ContentTypes.applicationJson:
      return "application/json";
  }
}