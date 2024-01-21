
///[ModelType] enum for model names associated with OpenAi
enum ModelType {
  gpt3_5Turbo,
  gpt3_5Turbo_1106,
  gpt4_1106Preview,
  gpt4VisionPreview
}

///[modelTypeSwitch] model enum value initializer
String modelTypeSwitch(ModelType model){
  switch(model){
    case ModelType.gpt3_5Turbo:
      return "gpt-3.5-turbo";
    case ModelType.gpt3_5Turbo_1106:
      return "gpt-3.5-turbo-1106";
    case ModelType.gpt4_1106Preview:
      return "gpt-4-1106-preview";
    case ModelType.gpt4VisionPreview:
      return "gpt-4-vision-preview";
  }
}