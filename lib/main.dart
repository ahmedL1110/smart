import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/layoutScreen.dart';
import 'package:smart_service/modules/on_Boarding/on_boarding.dart';
import 'package:smart_service/shared/components/constants.dart';
import 'package:smart_service/shared/network/remote/cache_helper.dart';
import 'package:smart_service/shared/styles/themes.dart';

import 'layout/Cubit/CubitBloc.dart';
import 'layout/Cubit/StateBloc.dart';
import 'modules/Login/cubit/cubit.dart';
import 'modules/language/language.dart';
import 'modules/on_Boarding/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');
  Widget? widget;
  if (uId != null) {
    widget = LayoutScreen();
  } else {
    widget = OnBordingScreen();
  }
  if(CacheHelper.getData(key: 'isAr')!= null){
    isAr = CacheHelper.getData(key: 'isAr');
  }
  print(isAr);
  runApp(
      ChangeNotifierProvider<ProviderLanguage>(
        create: (context) => ProviderLanguage(),
        child: MyApp(
          startWidget: widget,
        ),
      ),

  );
}

class MyApp extends StatelessWidget {
  Widget startWidget;

  MyApp({required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getElectricity()
            ..getConditioners()
            ..getHouseCleaning()
            ..getMaintenance()
            ..getPaint()
            ..getPipes()
            ..getServices()
            ..getDelivery()
            ..getMarkets()
            ..getCafes()
            ..getRestaurants()
            ..getShopCenter()
            ..getShoesCenter()
            ..getClothesCenter()
            ..getPreventive()
            ..getRehabilitation()
            ..getEducationCenter()
            ..getPrivateTeacher()
          ..getUserData(),
        ),
      ],
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            // localizationsDelegates: [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: [
            //   Locale('ar', 'AE'),
            // ],
            debugShowCheckedModeBanner: false,
            theme: ligthTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
