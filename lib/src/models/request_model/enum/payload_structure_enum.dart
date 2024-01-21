import 'package:gpt_module_package/src/models/payload/enum/model_type_enum.dart';
import 'package:gpt_module_package/src/models/payload/enum/role_type_enum.dart';
import 'package:gpt_module_package/src/models/payload/payload_model.dart';

enum PayloadStructureType { imageInputChatCompletion, textInputChatCompletion }

Map<String, dynamic> payloadStructureTypeSwitch(
    {required PayloadStructureType payloadStructureType,
    required PayloadModel payloadModel}) {
  switch (payloadStructureType) {
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
