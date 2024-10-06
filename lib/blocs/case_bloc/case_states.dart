abstract class CaseStates {}

class CaseInitial extends CaseStates {}

class CaseLoading extends CaseStates {}

class CaseAdded extends CaseStates {}

class CaseRefresh extends CaseStates {}

class CaseFailure extends CaseStates {
  String msg;
  CaseFailure(this.msg);
}
