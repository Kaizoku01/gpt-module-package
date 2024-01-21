import 'package:gpt_module_package/src/models/payload/enum/model_type_enum.dart';
import 'package:gpt_module_package/src/models/payload/enum/role_type_enum.dart';
import 'package:gpt_module_package/src/models/payload/payload_model.dart';

///[PayloadStructureType] enum for payload structure types associated with OpenAI
enum PayloadStructureType { imageInputChatCompletion, textInputChatCompletion }

///[payloadStructureTypeSwitch] enum value initializer for payload structures
Map<String, dynamic> payloadStructureTypeSwitch(
    {required PayloadStructureType payloadStructureType,
    required PayloadModel payloadModel}) {
  switch (payloadStructureType) {
    // image + text prompt input (GPT-4)
    case PayloadStructureType.imageInputChatCompletion:
      return {
        "model": modelTypeSwitch(payloadModel.model),
        "messages": [
          {
            "role": roleTypeSwitch(payloadModel.role),
            "content": [
              {"type": "text", "text": payloadModel.prompt},
              {
                "type": "image_url",
                "image_url": {
                  "url": "data:image/jpeg;base64,${payloadModel.base64Image}"
                }
              }
            ]
          }
        ],
        "max_tokens": payloadModel.maxToken
      };
      // text prompt input (GPT-3.5)
    case PayloadStructureType.textInputChatCompletion:
      return {
        "model": modelTypeSwitch(payloadModel.model),
        "messages": [
          {
            "role": roleTypeSwitch(payloadModel.role),
            "content": [
              {"type": "text", "text": payloadModel.prompt},
            ]
          }
        ],
        "max_tokens": payloadModel.maxToken
      };
  }
}
