class ServerResponse {
  int? statusCode;
  bool success;
  String? resCode;
  String? successMessage;
  String? errorMessage;
  var value;

  ServerResponse({
    this.statusCode,
    this.resCode,
    required this.success,
    this.successMessage,
    this.errorMessage,
    this.value,
  });

  static defaultError({
    String rescode = defaultSuccessCode,
  }) =>
      ServerResponse(
          statusCode: 400,
          success: false,
          errorMessage: defaultErrorCode,
          resCode: rescode);

  static defaultSuccess({String? successMessage, var value}) => ServerResponse(
      statusCode: 200,
      success: true,
      successMessage: successMessage,
      resCode: defaultSuccessCode,
      value: value);
}

const defaultSuccessCode = "DEFAULT_SUCCESS_CODE";
const defaultErrorCode = "DEFAULT_ERROR";
const defaultErrorMessage = "An error occurred";

/// Custom error codes
const invalidCode = "invalid_code";
const phoneNotFound = "email_not_found";
const wrongPhoneOrPassword = "wrong_email_or_password";

bool successResponse(int? code) {
  if (code == null) return false;
  bool res = code >= 200 && code <= 301;
  return res;
}
