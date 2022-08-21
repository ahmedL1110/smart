import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:unicons/unicons.dart';

import '../../../layout/Cubit/CubitBloc.dart';
import '../../../models/DetailsModel/ServiceModel.dart';
import '../../../shared/components/constants.dart';
import '../../language/language.dart';
import '../Delivery service/Details_Order.dart';


class PrivateTeacher extends StatelessWidget {
  const PrivateTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = Provider.of<ProviderLanguage>(context);
        return Scaffold(
          body: Directionality(
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.32,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xffF6C52F),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              40,
                            ),
                            bottomLeft: Radius.circular(
                              40,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                    top: size.height * 0.08,
                                    right: isAr ? size.width * 0.05 : 0,
                                    left: isAr ? 0 : size.width * 0.05,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: size.height * 0.1,
                                    right: isAr ? size.width * 0.15 : 0,
                                    left: isAr ? 0 : size.width * 0.15,
                                    child: Row(
                                      children: [
                                        Text(
                                          lang.getText('Service5',) as String,
                                          style: const TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 20,
                                            color: const Color(0xff0f0a39),
                                            fontWeight: FontWeight.w700,
                                            height: 0.6,
                                          ),
                                          textHeightBehavior:
                                          const TextHeightBehavior(
                                              applyHeightToFirstAscent:
                                              false),
                                          textAlign: isAr
                                              ? TextAlign.right
                                              : TextAlign.left,
                                          softWrap: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: size.height * 0.08,
                                    right: isAr ? 0 : size.width * 0.05,
                                    left: isAr ? size.width * 0.05 : 0,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            print('Hello');
                                          },
                                          icon: const Icon(
                                            UniconsLine.search,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: size.width * 0.06),
                                child: Container(
                                  height: size.height * 0.115,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.08,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            LayoutCubit.get(context)
                                                .changename(index);
                                          },
                                          child: Container(
                                            height: size.height * 0.035,
                                            width: size.width * 0.22,
                                            decoration: BoxDecoration(
                                                color:
                                                color(index, context),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10)),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                EdgeInsets.symmetric(
                                                    horizontal:
                                                    size.width *
                                                        0.001),
                                                child: Text(
                                                  isAr
                                                      ? LayoutCubit.get(
                                                      context)
                                                      .name3[index]
                                                      : LayoutCubit.get(
                                                      context)
                                                      .names3[index],
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    fontSize: 14,
                                                    color: color2(
                                                        index, context),
                                                    letterSpacing:
                                                    -0.33764714050292965,
                                                  ),
                                                  textAlign:
                                                  TextAlign.center,
                                                  softWrap: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                    itemCount:
                                    LayoutCubit.get(context).name3.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (LayoutCubit.get(context).nameIndex == 0)
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.23),
                          child: ListView.builder(
                            itemCount:
                            LayoutCubit.get(context).all3List.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => buildProduct(
                              context,
                              size,
                              LayoutCubit.get(context).all3List[index],
                            ),
                          ),
                        ),
                      if (LayoutCubit.get(context).nameIndex == 1)
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.23),
                          child: ListView.builder(
                            itemCount: LayoutCubit.get(context)
                                .educationList
                                .length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => buildProduct(
                              context,
                              size,
                              LayoutCubit.get(context).educationList[index],
                            ),
                          ),
                        ),
                      if (LayoutCubit.get(context).nameIndex == 2)
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.23),
                          child: ListView.builder(
                            itemCount:
                            LayoutCubit.get(context).privateTeacherList.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => buildProduct(
                              context,
                              size,
                              LayoutCubit.get(context).privateTeacherList[index],
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
                        InkWell(
                          onTap: () {
                            navigatorTo(context, const DetailsOrder());
                          },
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
                              child: Center(
                                child: Text(
                                  lang.getText('Next') as String,
                                  style: const TextStyle(
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
      });
  }
}

Color color(int i, context) {
  if (i == LayoutCubit.get(context).nameIndex) return Color(0xff5300BF);

  return Color(0xffE0E0E0);
}

Color color2(int i, context) {
  if (i != LayoutCubit.get(context).nameIndex) return Color(0xff5300BF);

  return Color(0xffE0E0E0);
}

Widget buildProduct(
    BuildContext context, Size size, ServiceModel serviceModel) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Column(
        children: [
          Container(
            height: (LayoutCubit.get(context).isSelect) ? size.height * 0.18 : size.height * 0.18,
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
                20,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.height * 0.002),
                  child: Row(
                    children: [
                      Text(
                        isAr ? serviceModel.title : serviceModel.title2,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 21,
                          color: Color(0xff383838),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          LayoutCubit.get(context).changeSelect();
                          print(LayoutCubit.get(context).count);
                        },
                        icon: LayoutCubit.get(context).select,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xffBDC4CC),
                  height: 0.5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.height * 0.005),
                  child: Text(
                    isAr ? serviceModel.name : serviceModel.name2,
                    style: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      color: Color(0xff383838),
                      height: 1.625,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        serviceModel.price,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 12,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          height: size.height * 0.002,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        Provider.of<ProviderLanguage>(context).getText('Shekel')
                        as String,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 12,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          height: size.height * 0.002,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                if (LayoutCubit.get(context).isSelect)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.025,
                        vertical: size.height * 0.005),
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          Provider.of<ProviderLanguage>(context)
                              .getText('The_Total_Amount') as String,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 12,
                            color: const Color(0xff5300bf),
                            fontWeight: FontWeight.w700,
                            height: size.height * 0.002,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          '${int.parse(serviceModel.price)}',
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 12,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            height: size.height * 0.002,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          Provider.of<ProviderLanguage>(context)
                              .getText('Shekel') as String,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 12,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            height: size.height * 0.002,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    );