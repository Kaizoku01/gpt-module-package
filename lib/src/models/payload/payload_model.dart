import 'enum/model_type_enum.dart';
import 'enum/role_type_enum.dart';

class PayloadModel {
  final ModelType model;
  final RoleType role;
  final int maxToken;
  final String prompt;
  final String? base64Image;

  PayloadModel(
      {required this.model,
      this.role = RoleType.user,
      this.maxToken = 100,
      required this.prompt,
      this.base64Image});

  // Convert PayloadModel to a Map
  // Map<String, dynamic> toMap() {
  //   String modelName = modelTypeSwitch(model);
  //
  //   String roleDesignation = roleTypeSwitch(role);
  //
  //   return {
  //     'model': modelName,
  //     'role': roleDesignation,
  //     'maxToken': maxToken,
  //     'prompt': prompt,
  //     'imagePath': imagePath,
  //   };
  // }

}
