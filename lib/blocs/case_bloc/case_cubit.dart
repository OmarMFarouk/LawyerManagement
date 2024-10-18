import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lawyermanagement/models/cases_model.dart';
import 'package:lawyermanagement/models/countries_model.dart';
import 'package:lawyermanagement/services/api/cases_api.dart';

import '../auth_bloc/auth_cubit.dart';
import 'case_states.dart';

class CaseCubit extends Cubit<CaseStates> {
  CaseCubit() : super(CaseInitial());
  static CaseCubit get(context) => BlocProvider.of(context);
  TextEditingController subjectCont = TextEditingController();
  TextEditingController typeCont = TextEditingController();
  TextEditingController caseNumberCont = TextEditingController();
  TextEditingController archiveNumberCont = TextEditingController();
  TextEditingController courtChamberCont = TextEditingController();
  TextEditingController noteCont = TextEditingController();
  CountryModule? selectedCountry;
  String clientId = '';
  CasesModel? casesModel;
  List<Case> searchList = [];
  PlatformFile? pickedFile;
  fetchCases() async {
    emit(CaseLoading());
    try {
      await CasesApi().fetchCases().then((res) {
        casesModel = CasesModel.fromJson(res);
        emit(CaseInitial());
      });
    } catch (e) {
      emit(CaseFailure('Check Internet'));
    }
  }

  addCase() async {
    if (pickedFile != null) {
      Case newCase = Case(
        vendorId: currentVendor!.vendordetails!.vendorid,
        caseArchiveNumber: archiveNumberCont.text.trim(),
        caseClientId: clientId,
        caseCountry: selectedCountry!.name,
        caseNumber: caseNumberCont.text.trim(),
        caseCourtChamber: courtChamberCont.text.trim(),
        caseSubject: subjectCont.text.trim(),
        caseType: typeCont.text.trim(),
      );
      emit(CaseLoading());
      EasyLoading.show(status: 'Uploading...', dismissOnTap: false);
      await CasesApi()
          .addCase(
              model: newCase,
              fileData: pickedFile!.bytes,
              fileName: pickedFile!.name,
              fileSize: pickedFile!.size)
          .then((res) {
        if (res['success'] == true) {
          emit(CaseAdded());
          clearControllers();
          EasyLoading.dismiss();
          fetchCases();
        } else {
          emit(CaseFailure('Check Internet'));
        }
      });
    }
  }

  void getMatch({required String query}) {
    searchList.clear();
    for (Case? caseDetails in casesModel!.cases!) {
      if (caseDetails!.caseClientName!
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          caseDetails.caseNumber!.toLowerCase().contains(query.toLowerCase()) ||
          caseDetails.caseSubject!
                  .toLowerCase()
                  .contains(query.toLowerCase()) &&
              !searchList.contains(caseDetails)) {
        searchList.add(caseDetails);
        emit(CaseInitial());
      }
      if (query == "") {
        searchList.clear();
      }
    }
    emit(CaseInitial());
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'jpeg',
        'pdf',
        'txt',
        'doc',
        'docx',
        'doc'
      ],
    );

    if (result != null) {
      pickedFile = result.files.single;
    }
    emit(CaseInitial());
  }

  addFile({required caseId, required caseClientId}) async {
    if (pickedFile != null) {
      emit(CaseLoading());
      EasyLoading.show(status: 'Uploading...', dismissOnTap: false);
      await CasesApi()
          .addCaseFile(
              caseClientId: caseClientId,
              caseId: caseId,
              fileData: pickedFile!.bytes,
              fileName: pickedFile!.name,
              fileSize: pickedFile!.size)
          .then((res) {
        if (res['success'] == true) {
          emit(CaseAdded());
          EasyLoading.dismiss();
          clearControllers();
          fetchCases();
        } else {
          emit(CaseFailure('Check Internet'));
        }
      });
    }
  }

  clearControllers() {
    selectedCountry = null;
    caseNumberCont.clear();
    subjectCont.clear();
    archiveNumberCont.clear();
    courtChamberCont.clear();
    typeCont.clear();
    clientId = '';
    pickedFile = null;
  }
}
