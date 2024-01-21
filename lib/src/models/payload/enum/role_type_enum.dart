
///[RoleType] enum for role designation associated with OpenAi
enum RoleType { user, system, assistant }

///[roleTypeSwitch] role enum value initializer
String roleTypeSwitch(RoleType role) {
  switch (role) {
    case RoleType.user:
      return "user";
    case RoleType.system:
      return "system";
    case RoleType.assistant:
      return "assistant";
  }
}
