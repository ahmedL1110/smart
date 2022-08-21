import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/Cubit/CubitBloc.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';

import '../../models/DetailsModel/ServiceModel.dart';
import '../../shared/components/constants.dart';
import '../language/language.dart';
import 'Delivery service list/delivery_service_list.dart';
import 'Delivery service/Details_Service.dart';
import 'E-Shopping/Service.dart';
import 'Health-Care/Service.dart';
import 'MyMap.dart';
import 'Other_Service.dart';
import 'Private_Teacher/Service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var searchController = TextEditingController();
    var lang = Provider.of<ProviderLanguage>(context,listen: true);
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return BuildCondition(
          condition: LayoutCubit.get(context).userModel != null,
          builder: (context) => Scaffold(
            body: Directionality(
              textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.35,
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
                          top: size.height * 0.17,
                          right: isAr ? size.width * 0.07 : 0,
                          left: isAr? 0 : size.width * 0.07,
                          child: Row(
                            children: [
                              Text(
                                lang.getText('Hello') as String,
                                textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 18,
                                  color: const Color(0xff5300bf),
                                  fontWeight: FontWeight.w700,
                                  height: size.height * 0.001,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.17,
                          right:isAr ? size.width * 0.2 : 0,
                          left:isAr ? 0 :  size.width * 0.2 ,
                          child: Row(
                            children: [
                              Text(
                                LayoutCubit.get(context).userModel!.name,
                                textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 18,
                                  color: const Color(0xff5300bf),
                                  fontWeight: FontWeight.w700,
                                  height: size.height * 0.001,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.2,
                          right: isAr ? size.width * 0.07 : 0,
                          left: isAr ? 0 : size.width * 0.07,
                          child: Row(
                            children: [
                              Text(
                                lang.getText('How_We_can_Help_you') as String,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 14,
                                  color: const Color(0xff0f0a39),
                                  height: size.height * 0.001,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.1,
                          right: size.width * 0.08,
                          left: size.width * 0.08,
                          child: Container(
                            height: size.height * 0.05,
                            decoration: const BoxDecoration(
                              color: Color(0xffF6C52F),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Color(0xff5300BF),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                  vertical: size.height * 0.01),
                              child: InkWell(
                                onTap: ()
                                {
                                  navigatorTo(context, MyMap());
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xff5300BF),
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Text(
                                      lang.getText('Select_your_location') as String,
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: const Color(0xff000000),
                                        height: size.height * 0.0001,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Color(0xff5300BF),
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.24,
                          right: size.width * 0.08,
                          left: size.width * 0.08,
                          child: Container(
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: const Color(0xffffffff),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                  vertical: size.height * 0.01),
                              child: TextFormField(
                                onTap: () {},
                                textAlign: TextAlign.start,
                                controller: searchController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: lang.getText('What_service_are_you_looking_for') as String,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffcbc9d9),
                                    height: size.height * 0.001,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search_sharp,
                                    color: Color(0xffcbc9d9),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.3,
                              right: size.width * 0.05,
                              left: size.width * 0.05),
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: LayoutCubit.get(context).servicesList.length,
                            itemBuilder: (context, index) => buildService(
                                context,
                                size,
                                LayoutCubit.get(context).servicesList[index],
                                index),
                            separatorBuilder: (context, index) => SizedBox(
                              height: size.height * 0.01,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator(),),
        );
      },
      listener: (context, state) {},
    );
  }
}

Widget buildService(BuildContext context, Size size,
    ServiceModel servicesModel, int index) =>
    Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            offset: Offset.fromDirection(
              1.5,
              10,
            ),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.02, vertical: size.height * 0.01),
        child: InkWell(
          focusColor: Colors.red,
          splashColor: Colors.red,
          onTap: () {
            if (LayoutCubit.get(context).servicesList[index].title == 'خدمة صيانة المنازل') {
              navigatorTo(context, DetailsService());
            }
            if (LayoutCubit.get(context).servicesList[index].title == 'خدمة التوصيل المنزلي') {
              navigatorTo(context, DeliveryServiceList());
            }
            if (LayoutCubit.get(context).servicesList[index].title == 'خدمة معلمي الخاص') {
              navigatorTo(context, PrivateTeacher());
            }
            if (LayoutCubit.get(context).servicesList[index].title == 'خدمة التسوق الإلكتروني') {
              navigatorTo(context, EShopping());
            }
            if (LayoutCubit.get(context).servicesList[index].title == 'خدمة العناية الصحية') {
              navigatorTo(context, HealthCare());
            }
            if (LayoutCubit.get(context).servicesList[index].title == 'خدمات أخرى') {
              navigatorTo(context, OtherService());
            }
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xff5300BF),
                child: Image(
                  image: NetworkImage(
                    servicesModel.image,
                  ),
                  fit: BoxFit.contain,
                  height: size.height * 0.035,
                  width: size.width * 0.08,
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isAr ? servicesModel.title : servicesModel.name,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      color: Color(0xff383838),
                      fontWeight: FontWeight.w700,
                      height: size.height * 0.001,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                    softWrap: false,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    Provider.of<ProviderLanguage>(context).getText('Details_about_service') as String,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 14,
                      color: Color(0xa8000000),
                      height: size.height * 0.001,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color(
                  0xffCBC9D9,
                ),
              ),
            ],
          ),
        ),
      ),
    );