import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:unicons/unicons.dart';

import '../../../layout/Cubit/CubitBloc.dart';
import '../../../models/DeleviryServiceModel/Deleviry_Service_Model.dart';
import '../../../shared/components/constants.dart';
import '../../language/language.dart';
import '../Delivery service list/choose_meal.dart';
import '../Delivery service list/delivery_service_list.dart';

class EShopping extends StatelessWidget {
  const EShopping({Key? key}) : super(key: key);

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
                                            lang.getText('Service6',) as String,
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
                                                        .name4[index]
                                                        : LayoutCubit.get(
                                                        context)
                                                        .names4[index],
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
                                      LayoutCubit.get(context).name4.length,
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
                              LayoutCubit.get(context).all4List.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  LayoutCubit.get(context).all4List[index],
                                  index),
                            ),
                          ),
                        if (LayoutCubit.get(context).nameIndex == 1)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                              LayoutCubit.get(context).shopList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  LayoutCubit.get(context).shopList[index],
                                  index),
                            ),
                          ),
                        if (LayoutCubit.get(context).nameIndex == 2)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount: LayoutCubit.get(context)
                                  .shoesList
                                  .length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  LayoutCubit.get(context)
                                      .shoesList[index],
                                  index),
                            ),
                          ),
                        if (LayoutCubit.get(context).nameIndex == 3)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount: LayoutCubit.get(context)
                                  .clothesList
                                  .length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  LayoutCubit.get(context)
                                      .clothesList[index],
                                  index),
                            ),
                          ),
                      ],
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
  if (i == LayoutCubit.get(context).nameIndex) return const Color(0xff5300BF);

  return const Color(0xffE0E0E0);
}

Color color2(int i, context) {
  if (i != LayoutCubit.get(context).nameIndex) return const Color(0xff5300BF);

  return const Color(0xffE0E0E0);
}

Widget buildProduct(BuildContext context, Size size, DeliveryModel serviceModel,
    int index) =>
    InkWell(
      onTap: ()
      {
        navigatorTo(context, const ChooseMeal());
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            end: size.width * 0.05, start: size.width * 0.05),
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
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
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  CircleAvatar(
                    radius: size.width * 0.09,
                    backgroundImage: NetworkImage(
                      '${serviceModel.image}',
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.58,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                isAr
                                    ? '${serviceModel.title}'
                                    : '${serviceModel.title2}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: const Color(0xff383838),
                                  fontWeight: FontWeight.w700,
                                  height: size.height * 0.001,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign:
                                isAr ? TextAlign.right : TextAlign.left,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        width: size.width * 0.47,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                isAr ? serviceModel.name : serviceModel.name2,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 14,
                                  color: const Color(0xa8000000),
                                  height: size.height * 0.001,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign:
                                isAr ? TextAlign.right : TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      timenew(index, size, serviceModel),
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
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      ),
    );