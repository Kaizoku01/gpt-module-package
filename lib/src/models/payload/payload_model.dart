import 'enum/model_type_enum.dart';
import 'enum/role_type_enum.dart';

///[PayloadModel] Data model for http payload body.
class PayloadModel {
  ///[model] model name passed as enum value
  final ModelType model;

  ///[role] role designation passed as enum value
  final RoleType role;

  ///[maxToken] max token value i.e output word limit
  final int maxToken;

  ///[prompt] prompt text for gpt api
  final String prompt;

  ///[base64Image] converted image to base64 string for sending to api
  final String? base64Image;

  PayloadModel(
      {required this.model,
      this.role = RoleType.user,
      this.maxToken = 100,
      required this.prompt,
      this.base64Image});
}
