import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/layout/Cubit/CubitBloc.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:unicons/unicons.dart';

import '../../../shared/components/constants.dart';
import '../Delivery service/Details_Order.dart';
import 'choose_meal.dart';


class MealDetails extends StatelessWidget {
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Directionality(
              textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.4,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.thaqfny.com/wp-content/uploads/2022/02/%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1-%D9%88%D8%AC%D8%A8%D8%A7%D8%AA-%D9%83%D9%86%D8%AA%D8%A7%D9%83%D9%8A-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                60,
                              ),
                              bottomLeft: Radius.circular(
                                60,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.23),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.08),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.6,
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset.fromDirection(
                                          1.5,
                                          10,
                                        ),
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(
                                      30,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.06,
                                        vertical: size.height * 0.05),
                                    child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'سوبر ميجا ديل - مكس',
                                                    style: TextStyle(
                                                      fontFamily: 'Tajawal',
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xff383838),
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      height:
                                                      size.height * 0.002,
                                                    ),
                                                    textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                        false),
                                                    textAlign: TextAlign.right,
                                                    softWrap: false,
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.002,
                                                  ),
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      Text(
                                                        '4.9',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                            Colors.amber),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              const Text(
                                                '54.99',
                                                style: TextStyle(
                                                  fontFamily: 'Metropolis',
                                                  fontSize: 31,
                                                  color:
                                                  const Color(0xff4a4b4d),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.start,
                                                softWrap: false,
                                              ),
                                              Text(
                                                'شيكل',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontSize: 14,
                                                  color:
                                                  const Color(0xff000000),
                                                  fontWeight: FontWeight.w500,
                                                  height: size.height * 0.002,
                                                ),
                                                textHeightBehavior:
                                                const TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                    false),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          Text(
                                            'الوصف',
                                            style: TextStyle(
                                              fontFamily: 'Tajawal',
                                              fontSize: 14,
                                              color: const Color(0xff4a4b4d),
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.right,
                                            softWrap: false,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            'سوبر ميجا ديل - مكس تحتوي 12 قطعة دجاج + بطاطا',
                                            style: TextStyle(
                                              fontFamily: 'Tajawal',
                                              fontSize: 12,
                                              color: const Color(0xff7c7d7e),
                                              height: 1.5833333333333333,
                                            ),
                                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                            textAlign: TextAlign.right,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.025,
                                          ),
                                          const Divider(
                                            color: Color(0xffBDC4CC),
                                            height: 0.1,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.025,
                                          ),
                                          Text(
                                            'تخصيص الطلب',
                                            style: TextStyle(
                                              fontFamily: 'Tajawal',
                                              fontSize: 14,
                                              color: Color(0xff383838),
                                              fontWeight: FontWeight.w600,
                                              height: size.height * 0.001,
                                            ),
                                            textHeightBehavior:
                                            TextHeightBehavior(
                                                applyHeightToFirstAscent:
                                                false),
                                            textAlign: TextAlign.right,
                                            softWrap: false,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Text(
                                                'عدد الوجبات',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontSize: 14,
                                                  color: Color(0xff383838),
                                                  fontWeight: FontWeight.w600,
                                                  height: size.height * 0.001,
                                                ),
                                                textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                    false),
                                                textAlign: TextAlign.right,
                                                softWrap: false,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  UniconsLine.minus_circle,
                                                  color: Color(0xff5300BF),
                                                  size: 25,
                                                ),
                                              ),
                                              Text(
                                                '0',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontSize: 20,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.w700,
                                                  height: size.height * 0.003,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  UniconsLine.plus_circle,
                                                  size: 25,
                                                  color: Color(0xff5300BF),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: double.infinity,
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.0525,
                          vertical: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  navigatorTo(context, ChooseMeal());
                                },
                                child: Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xff5300BF),
                                          offset: Offset(
                                            0.5,
                                            0.5,
                                          ),
                                          blurRadius: 0.5,
                                          blurStyle: BlurStyle.solid),
                                      BoxShadow(
                                          color: Color(0xff5300BF),
                                          offset: Offset(
                                            -0.5,
                                            -0.5,
                                          ),
                                          blurRadius: 0.5,
                                          blurStyle: BlurStyle.solid),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'رجوع',
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 14,
                                        color: Color(0xff5300bf),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  navigatorTo(context, const DetailsOrder());
                                },
                                child: Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: const Color(0xff5300BF),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'التالي',
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 14,
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}