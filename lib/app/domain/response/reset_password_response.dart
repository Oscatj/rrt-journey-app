enum ResetPasswordResponse {
  ok,
  networkRequestFailed,
  userDisable,
  userNotFound,
  tooManyRequests,
  unknown,
}

ResetPasswordResponse stringToResetPasswordResponse(String code){
  switch(code){
    case "internal-error":
      return ResetPasswordResponse.tooManyRequests;
    case "user-not-found":
      return ResetPasswordResponse.userNotFound;
    case "user-disable":
      return ResetPasswordResponse.userDisable;
    case "network-request-failed":
      return ResetPasswordResponse.networkRequestFailed;
    default:
      return ResetPasswordResponse.unknown;
  }
}