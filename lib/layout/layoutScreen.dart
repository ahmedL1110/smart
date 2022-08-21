import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:smart_service/shared/components/constants.dart';
import 'package:unicons/unicons.dart';
import '../modules/language/language.dart';
import 'Cubit/CubitBloc.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state)
      {
      },
      builder: (context, state) {
        var homeCubit = LayoutCubit.get(context);
        var lang = Provider.of<ProviderLanguage>(context,listen: true);
        return Directionality(
          textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            body: homeCubit.screen[homeCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeCubit.currentIndex,
              onTap: (value)
              {
                homeCubit.changeBottomNac(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(UniconsLine.home_alt),
                  label: lang.getText('Home') as String,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.notification),
                  label: lang.getText('Notification') as String,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.info_circle),
                  label: lang.getText('About_Us') as String,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.setting),
                  label: lang.getText('Settings') as String,
                ),
              ],
              selectedItemColor: const Color(0xff5300BF),
              unselectedItemColor: const Color(0xff979797),
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                color:  Color(0xff5300BF),
                letterSpacing: 0.256,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                letterSpacing: 0.256,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}