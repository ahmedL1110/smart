import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/RegisterModel/Register_Model.dart';
import '../../../models/UserModel/User_Model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isResend = false;
  bool isVerified = false;
  bool isLoading = false;

  late Timer timer;
  int start = 30;

  void resend() {
    isResend = true;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        start = 30;
        isResend = false;
        timer.cancel();
      } else {
        start--;
      }
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisibilityPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibilityPassword());
  }

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var priceServiceController = TextEditingController();
  var detailsServiceController = TextEditingController();
  var selectService = TextEditingController();
  var timeJobController = TextEditingController();
  var dateServiceController = TextEditingController();

  void saveTextFormField(String value) {
    value = nameController.text;
    value = emailController.text;
    value = passwordController.text;
    value = phoneController.text;
    value = locationController.text;
    value = priceServiceController.text;
    value = detailsServiceController.text;
    value = selectService.text;
    value = timeJobController.text;
    value = dateServiceController.text;
    emit(SaveTextFormField());
  }

  void dateTime(dynamic value)
  {
    dateServiceController.text = DateFormat.yMMMd().format(value!);
    emit(ChangeDateTime());
  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(SuccessLoginState(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLoginUserState(error));
    });
  }

  void createAccountCliente({
    required String email,
    required String name,
    required String uId,
  }) {
    RegisterModel registerModel = RegisterModel(
      name: name,
      email: email,
      uId: uId,
      image:
          'https://www.dotcominfoway.com/wp-content/uploads/2020/01/social-media-app-cost.png',
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(registerModel.toMap())
        .then((value) {
      emit(SuccessRegisterClient());
    }).catchError((error) {
      emit(ErrorRegisterClient(error));
    });
  }

  void registerClient({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(LoadingRegisterClient());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createAccountCliente(
        email: email,
        name: name,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRegisterClient(error.toString()));
    });
  }

  void createAccountDealer({
    required String email,
    required String name,
    required String uId,
    required String phone,
    required String detailsService,
    required String location,
    required String priceService,
    required String workTime,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      uId: uId,
      phone: phone,
      detailsService: detailsService,
      location: location,
      priceService: priceService,
      workTime: workTime,
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc()
        .collection('dealer')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(SuccessRegisterDealer());
    }).catchError((error) {
      emit(ErrorRegisterDealer(error));
    });
  }

  void registerDealer({
    required String email,
    required String name,
    required String password,
    required String phone,
    required String detailsService,
    required String location,
    required String priceService,
    required String workTime,
  }) async {
    emit(LoadingRegisterDealer());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createAccountDealer(
        email: email,
        name: name,
        phone: phone,
        detailsService: detailsService,
        location: location,
        priceService: priceService,
        workTime: workTime,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRegisterDealer(error.toString()));
    });
  }
}
