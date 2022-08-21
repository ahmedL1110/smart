import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/Cubit/CubitBloc.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:smart_service/layout/layoutScreen.dart';
import 'package:unicons/unicons.dart';

import '../../../models/DetailsModel/ServiceModel.dart';
import '../../../shared/components/constants.dart';
import '../../language/language.dart';
import 'meal_details.dart';

class ChooseMeal extends StatelessWidget {
  const ChooseMeal({Key? key}) : super(key: key);

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
                                Positioned(
                                  top: size.height * 0.08,
                                  right: isAr ? size.width * 0.05 : 0,
                                  left: isAr ? 0 : size.width * 0.05,
                                  child: Container(
                                    width: size.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                navigatorTo(
                                                    context,LayoutScreen());
                                              },
                                              icon: const Icon(
                                                Icons.arrow_back_ios,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.05,
                                            ),
                                            Text(
                                              'مطعم كنتاكي',
                                              style: const TextStyle(
                                                fontFamily: 'Tajawal',
                                                fontSize: 20,
                                                color:  Color(0xff0f0a39),
                                                fontWeight: FontWeight.w700,
                                                height: 0.6,
                                              ),
                                              textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                  false),
                                              textAlign: isAr ? TextAlign.right : TextAlign.left,
                                              softWrap: false,
                                            ),
                                            SizedBox(
                                              width: size.width * 0.26,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                //navigatorFinished(context, const HomeScreen());
                                              },
                                              icon: const Icon(
                                                UniconsLine.search,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        Container(
                                          width: size.width * 0.6,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  Provider.of<ProviderLanguage>(context).getText('Item1') as String,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    fontSize: 16,
                                                    color: Color(0xff5300BF),
                                                    fontWeight: FontWeight.w700,
                                                    height: size.height * 0.001,
                                                  ),
                                                  textHeightBehavior: TextHeightBehavior(
                                                      applyHeightToFirstAscent:
                                                      false),
                                                  textAlign: isAr ? TextAlign.right : TextAlign.left,
                                                  softWrap: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          Provider.of<ProviderLanguage>(context).getText('Item2') as String,
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 14,
                                            color: Color(0xff383838),
                                            fontWeight: FontWeight.w300,
                                            height: size.height * 0.001,
                                          ),
                                          textHeightBehavior: TextHeightBehavior(
                                              applyHeightToFirstAscent:
                                              false),
                                          textAlign: isAr ? TextAlign.right : TextAlign.left,
                                          softWrap: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.23),
                          child: ListView.builder(
                            itemCount: LayoutCubit.get(context).allList.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => buildProduct(
                              context,
                              size,
                              LayoutCubit.get(context).allList[index],
                              index,
                            ),
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
  if (i == LayoutCubit.get(context).nameIndex) return Color(0xff5300BF);

  return Color(0xffE0E0E0);
}

Color color2(int i, context) {
  if (i != LayoutCubit.get(context).nameIndex) return Color(0xff5300BF);

  return Color(0xffE0E0E0);
}

Widget buildProduct(BuildContext context, Size size, ServiceModel serviceModel,
    int index) =>
    Padding(
      padding: EdgeInsetsDirectional.only(
          end: size.width * 0.05, start: size.width * 0.05),
      child: Column(
        children: [
          Container(
            height: size.height * 0.17,
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
                      'https://upload.wikimedia.org/wikipedia/ar/3/3b/KFC.png'),
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.001,
                    ),
                    Container(
                      width: size.width * 0.58,
                      child: Row(
                        children: [
                          Text(
                            '${serviceModel.title}',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: Color(0xff383838),
                              fontWeight: FontWeight.w700,
                              height: size.height * 0.001,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text(
                            '4.9',
                            style: TextStyle(fontSize: 12, color: Colors.amber),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'مطعم للوجبات السريعة',
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
                    Container(
                      width: size.width * 0.58,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '54.99',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              height: size.height * 0.002,
                            ),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            Provider.of<ProviderLanguage>(context).getText('Shekel') as String,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              height: size.height * 0.002,
                            ),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: isAr ? TextAlign.right : TextAlign.left,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              navigatorTo(context, MealDetails());
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xff5300BF),
                              foregroundColor: Colors.white,
                              radius: size.height * 0.02,
                              child: Icon(Iconsax.add),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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

double name(Size size, int index) {
  if (index == 0)
    return size.width * 0.15;
  else if (index > 0 && index < 3)
    return size.width * 0.2;
  else if (index == 3)
    return size.width * 0.24;
  else
    return size.width * 0.27;
}
