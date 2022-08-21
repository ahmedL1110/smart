import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/layout/Cubit/CubitBloc.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:smart_service/layout/layoutScreen.dart';

import '../../../shared/components/constants.dart';
import 'Details_Order.dart';

class RevisionDetails extends StatelessWidget {
  const RevisionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: size.height * 0.19,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffF6C52F),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        50,
                      ),
                      bottomLeft: Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * 0.1,
                        right: size.width * 0.05,
                        child: IconButton(
                          onPressed: () {
                            navigatorFinished(context, LayoutScreen());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.12,
                        right: size.width * 0.2,
                        child: Text(
                          'مراجعة تفاصيل الطلب',
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 20,
                            color: const Color(0xff0f0a39),
                            fontWeight: FontWeight.w700,
                            height: size.height * 0.001,
                          ),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          buildOrder(context, size),
                        ],
                      )),
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
                        InkWell(
                          onTap: () {},
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
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
                                  'موافق',
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildOrder(BuildContext context, Size size) => Column(
  children: [
    Container(
      height: size.height * 0.26,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * .015),
            child: Text(
              'تفاصيل الطلب',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 20,
                color: const Color(0xff383838),
                fontWeight: FontWeight.w700,
                height: size.height * 0.001,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          if (true)
                            Text(
                              'موعد الطلب :',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          Spacer(),
                          Text(
                            '10-11-2020',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: [
                          if (true)
                            const Text(
                              'الخدمة',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          const Spacer(),
                          Text(
                            LayoutCubit.get(context)
                                .name[LayoutCubit.get(context).nameIndex],
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // if (HomeCubit.get(context).detailsOrder.)

                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          if (true)
                            Text(
                              'العنوان :',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          Spacer(),
                          Text(
                            'رام الله-شارع القدس-عمارة 23',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // if (HomeCubit.get(context).detailsOrder.)

                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          if (true)
                            Text(
                              'ملاحظات :',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          Spacer(),
                          Text(
                            'لدي مشكلة في الكهرباء',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // if (HomeCubit.get(context).detailsOrder.)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: size.height * 0.025,
    ),
    Container(
      height: size.height * 0.36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * .015),
            child: Text(
              'تفاصيل الدفع',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 21,
                color: const Color(0xff383838),
                fontWeight: FontWeight.w700,
                height: size.height * 0.001,
              ),
              textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'سعر الخدمة :',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff5300bf),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Spacer(),
                          Text(
                            '400 شيكل',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          if (true)

                          // if (HomeCubit.get(context).nameOrder.first ==

                          //     'تفاصيل الطلب :')

                            Text(
                              'بدل تنقلات :',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          Spacer(),
                          Text(
                            '10 شيكل',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          if (true)
                            Text(
                              'رسوم فحص :',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          Spacer(),
                          Text(
                            '2 شيكل',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // if (HomeCubit.get(context).detailsOrder.)

                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          if (true)
                            Text(
                              'خصم من المحفظة :',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          Spacer(),
                          Text(
                            '- 30 شيكل',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'طريقة الدفع :',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff5300bf),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Spacer(),
                          Text(
                            'نقدا',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: const [
                          if (true)
                            Text(
                              'اجمالي الدفع :',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          Spacer(),
                          Text(
                            '405 شيكل',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: Color(0xff5300BF),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ],
);