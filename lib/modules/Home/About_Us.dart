import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/Cubit/CubitBloc.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';

import '../../shared/components/constants.dart';
import '../language/language.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lang = Provider.of<ProviderLanguage>(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.22,
                      decoration: const BoxDecoration(
                        color: Color(0xffF6C52F),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            50,
                          ),
                          bottomRight: Radius.circular(
                            50,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.155,
                      right: isAr ? size.width * 0.25 : 0,
                      left: isAr ? 0 : size.width * 0.25,
                      child: Row(
                        children: [
                          Text(
                            lang.getText('About_Us') as String,
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 20,
                              color: Color(0xff0f0a39),
                              fontWeight: FontWeight.w700,
                              height: 1.6,
                            ),
                            textHeightBehavior: const TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.15,
                      right: isAr ? size.width * 0.1 : 0,
                      left: isAr ? 0 : size.width * 0.1,
                      child: Row(
                        children: const [
                          Icon(Icons.info_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.getText('We') as String,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 18,
                          color: Color(0xff5300bf),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2.5,
                              blurRadius: 10,
                            ),
                          ],
                          color: const Color(0xffffffff),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.02,
                              right: size.width * 0.04,
                              left: size.width * 0.04),
                          child: Text(
                            lang.getText('Dec') as String,
                            textDirection: isAr
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: 2.142857142857143,
                            ),
                            textHeightBehavior: const TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            //textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        lang.getText('Our_Services') as String,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 18,
                          color: Color(0xff5300bf),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2.5,
                              blurRadius: 10,
                            ),
                          ],
                          color: const Color(0xffffffff),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.02,
                                  right: size.width * 0.04,
                                  left: size.width * 0.04),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 18,
                                    color: Color(0xff5300bf),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    lang.getText('Service1') as String,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: const Color(0xff7b7890),
                                      height: size.height * 0.0016,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: size.height * 0.03,
                              color: Color(0xffE2E2E2),
                              thickness: size.height * 0.0006,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: isAr ? size.width * 0.04 : 0,
                                  left: isAr ? 0 : size.width * 0.04),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 18,
                                    color: Color(0xff5300bf),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Expanded(
                                    child: Text(
                                      lang.getText('Service2') as String,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 14,
                                        color: const Color(0xff7b7890),
                                        height: size.height * 0.0016,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: size.height * 0.03,
                              color: Color(0xffE2E2E2),
                              thickness: size.height * 0.0006,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.04,
                                  left: size.width * 0.04),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 18,
                                    color: Color(0xff5300bf),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    lang.getText('Service3') as String,
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: const Color(0xff7b7890),
                                      height: size.height * 0.0016,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        lang.getText('Connect') as String,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 18,
                          color: const Color(0xff5300bf),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.223,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2.5,
                              blurRadius: 10,
                            ),
                          ],
                          color: const Color(0xffffffff),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.02,
                                right: size.width * 0.04,
                                left: size.width * 0.04,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lang.getText('Phone') as String,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: Color(0xff383838),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textHeightBehavior:
                                    const TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.right,
                                    softWrap: false,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.007,
                                  ),
                                  Text(
                                    '+972597686355',
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: const Color(0xa8000000),
                                      height: size.height * 0.0016,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: size.height * 0.03,
                              color: Color(0xffE2E2E2),
                              thickness: size.height * 0.0006,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.04,
                                  left: size.width * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lang.getText('Email') as String,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: const Color(0xff383838),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textHeightBehavior: const TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.right,
                                    softWrap: false,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.007,
                                  ),
                                  Text(
                                    'am353792@hotmail.com',
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: const Color(0xa8000000),
                                      height: size.height * 0.0016,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: size.height * 0.03,
                              color: Color(0xffE2E2E2),
                              thickness: size.height * 0.0006,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.04,
                                  left: size.width * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lang.getText('Url') as String,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: const Color(0xff383838),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textHeightBehavior: const TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.right,
                                    softWrap: false,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.007,
                                  ),
                                  Text(
                                    'https://www.facebook.com/profile.php?id=100008542814403',
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 12,
                                      color: const Color(0xa8000000),
                                      height: size.height * 0.0016,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}