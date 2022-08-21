import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:unicons/unicons.dart';
import '../../models/DeleviryServiceModel/Deleviry_Service_Model.dart';
import '../../models/DetailsModel/ServiceModel.dart';
import '../../models/RegisterModel/Register_Model.dart';
import '../../models/UserModel/User_Model.dart';
import '../../modules/Home/About_Us.dart';
import '../../modules/Home/Delivery service list/delivery_service_list.dart';
import '../../modules/Home/Home_Screen.dart';
import '../../modules/Home/Settings_Screen.dart';
import '../../modules/Home/Notification_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../shared/components/constants.dart';



class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    const HomeScreen(),
    const NotificationScreen(),
    const AboutUs(),
    const SettingsScreen(),
  ];

  List<String> name = [
    'الكل',
    'كهرباء',
    'مواسير',
    'مكيفات',
    'صيانة',
    'دهان',
    'تنظيف منازل'
  ];
  List<String> names = [
    'All',
    'Electric',
    'Pipes',
    'Conditionneurs',
    'Maintenance',
    'Peinture',
    'Cleaning House'
  ];

  List<String> name2 = [
    'الكل',
    'مطاعم',
    'كافيهات',
    'سوبر ماركت',
    'شركات توصيل',
  ];
  List<String> names2 = [
    'All',
    'Restaurants',
    'Cafes',
    'Market',
    'Companies Delivery',
  ];

  List<String> name3 = [
    'الكل',
    'مراكز تعليمية',
    'أساتذة خاص',
  ];
  List<String> names3 = [
    'All',
    'Center Education',
    'Private Teachers',
  ];

  List<String> name4 = [
    'الكل',
    'مراكز تسوق',
    'محلات أحذية',
    'محلات ملابس',
  ];
  List<String> names4 = [
    'All',
    'Center Shop',
    'shoe stores',
    'clothes shop',
  ];


  List<String> name5 = [
    'الكل',
    'خدمات وقائية',
    'خدمات تأهيلية',
  ];
  List<String> names5 = [
    'All',
    'Preventive services',
    'Rehabilitation services',
  ];

  List<String> nameOrder = [
    'تفاصيل الطلب :',
    'تفاصيل الدفع :',
  ];

  List<String> detailsOrder = [
    'موعد الطلب :',
    'الخدمة :',
    'العنوان :',
    'ملاحظات :',
  ];

  List<String> detailsAnswerOrder = [
    '10-11-2020,',
    'الكهرباء',
    'رام الله-شارع القدس-عمارة 23',
    'لدي مشكلة في الكهرباء',
  ];

  String language = 'العربية';
  List<String> items = [
    'العربية',
    'English',
  ];
  List<String> items2 = [
    'English',
    'العربية',
  ];


  bool isSelect = false;

  Icon select = const Icon(Icons.radio_button_off);
  List<int> num =[];
  changeSelect() {
    isSelect = !isSelect;
    select = isSelect
        ? const Icon(
      Icons.radio_button_on,
      color: Color(0xff5300BF),
    )
        : const Icon(
      Icons.radio_button_off,
      color: Color(0xff707070),
    );
    emit(ChangeSelectItem());
  }

  int count = 0;


  void incrementItem() {
    count++;
    emit(IncrementSelectItem());
  }

  void decrementItem() {
    if (count >= 1) count--;
    emit(DecrementSelectItem());
  }

  int nameIndex = 0;

  int currentIndex = 0;

  void changename(int index) {
    nameIndex = index;
    emit(ChangenameState());
  }

  void changeBottomNac(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  RegisterModel? userModel;

  Future<void> getUserData() async {
    emit(LoadingGetUserData());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      userModel = RegisterModel.fromJson(value.data());
      emit(SuccessGetUserData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetUserData(error.toString()));
    });
  }

  List<ServiceModel> servicesList =[];
  Future<void> getServices() async
  {
    emit(LoadingGetServicesState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        servicesList.add(ServiceModel.fromJson(element.data()));
        print(servicesList.length);
      });
      emit(SuccessGetServicesState());
    }).catchError((error){
      print('aaaaaaaaaa');
      emit(ErrorGetServicesState(error));
    });
  }

  List<ServiceModel> electricityList = [];
  List<ServiceModel> allList = [];

  Future<void> getElectricity() async {
    electricityList = [];
    emit(LoadingGetServiceState());
    FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Electricity')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        electricityList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }


  List<ServiceModel> pipesList = [];

  Future<void> getPipes() async {
    pipesList = [];
    emit(LoadingGetServiceState());
    FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Pipes')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        pipesList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<ServiceModel> conditionerList = [];

  Future<void> getConditioners() async {
    conditionerList = [];
    emit(LoadingGetServiceState());
    FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Conditioners')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        conditionerList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }


  List<ServiceModel> maintenanceList = [];

  Future<void> getMaintenance() async {
    maintenanceList = [];
    emit(LoadingGetServiceState());
    FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Maintenance')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        maintenanceList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<ServiceModel> paintList = [];

  Future<void> getPaint() async {
    paintList = [];
    emit(LoadingGetServiceState());
    FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Paint')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        paintList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<ServiceModel> cleanerList = [];

  Future<void> getHouseCleaning() async {
    cleanerList = [];
    emit(LoadingGetServiceState());
    FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('House_Cleaning')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        cleanerList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<DeliveryModel> all2List = [];
  List<DeliveryModel> listRestaurants= [];
  Future<void> getRestaurants() async {
    listRestaurants = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance.collection('houses_repair')
        .doc('2')
        .collection('Restaurants')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        listRestaurants.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }


  List<DeliveryModel> listCafes= [];
  Future<void> getCafes() async {
    listCafes = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance.collection('houses_repair')
        .doc('2')
        .collection('Cafes')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        listCafes.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<DeliveryModel> marketList =[];
  Future<void> getMarkets() async {
    marketList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance.collection('houses_repair')
        .doc('2')
        .collection('Market')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        marketList.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }


  List<DeliveryModel> listDelivery= [];
  Future<void> getDelivery() async {
    listDelivery = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance.collection('houses_repair')
        .doc('2')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        listDelivery.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  Set<Marker> markers={};

  void MyLocation({required double latitude,required double longitude}){
    markers.add(
      Marker(
        markerId: MarkerId('My Location'),
        position: LatLng(latitude, longitude),
      ),
    );
    emit(SuccessLocation());
  }
  void logoutUser() async {
    emit(LoadingLogoutState());
    await FirebaseAuth.instance.signOut().then((value) {
      emit(SuccessLogoutState());
    }).catchError((error) {
      emit(ErrorLogoutState(error.toString()));
    });
  }

  List<ServiceModel> educationList = [];
  List<ServiceModel> all3List = [];

  Future<void> getEducationCenter() async {
    educationList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('3')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        educationList.add(ServiceModel.fromJson(element.data()));
        all3List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<ServiceModel> privateTeacherList = [];

  Future<void> getPrivateTeacher() async {
    privateTeacherList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('3')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        privateTeacherList.add(ServiceModel.fromJson(element.data()));
        all3List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }


  List<DeliveryModel> all4List = [];
  List<DeliveryModel> shopList = [];

  Future<void> getShopCenter() async {
    shopList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('4')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        shopList.add(DeliveryModel.fromJson(element.data()));
        all4List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<DeliveryModel> clothesList = [];

  Future<void> getClothesCenter() async {
    clothesList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('4')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        clothesList.add(DeliveryModel.fromJson(element.data()));
        all4List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<DeliveryModel> shoesList = [];

  Future<void> getShoesCenter() async {
    shoesList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('4')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        shoesList.add(DeliveryModel.fromJson(element.data()));
        all4List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<ServiceModel> all5List = [];
  List<ServiceModel> preventiveList = [];

  Future<void> getPreventive() async {
    preventiveList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('5')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        preventiveList.add(ServiceModel.fromJson(element.data()));
        all5List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }

  List<ServiceModel> rehabilitationList = [];

  Future<void> getRehabilitation() async {
    rehabilitationList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('5')
        .collection('Delivery_Companies')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        rehabilitationList.add(ServiceModel.fromJson(element.data()));
        all5List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    });
  }
}