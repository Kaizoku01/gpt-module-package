enum ContentTypes {
  applicationJson
}

String contentTypeSwitch(ContentTypes content){

  switch(content){
    case ContentTypes.applicationJson:
      return "application/json";
  }
}