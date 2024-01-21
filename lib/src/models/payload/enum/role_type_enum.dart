enum RoleType { user, system, assistant }

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
