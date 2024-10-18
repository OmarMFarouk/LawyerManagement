abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthSuccess extends AuthStates {
  String msg;
  AuthSuccess(this.msg);
}

class AuthFailure extends AuthStates {
  String msg;
  int code;
  AuthFailure(this.msg, this.code);
}
