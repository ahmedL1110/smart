import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/Cubit/StateBloc.dart';
import 'package:unicons/unicons.dart';

import '../../layout/Cubit/CubitBloc.dart';
import '../language/language.dart';


class OtherService extends StatelessWidget {
  const OtherService({Key? key}) : super(key: key);
  
  get isAr => null;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lang = Provider.of<ProviderLanguage>(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return Directionality(
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              body: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.25,
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
                                          lang.getText('Service7',) as String,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.2,right: size.width * 0.1,left: size.width * 0.1),
                        child: Container(
                          height: size.height * 0.2,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
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
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                lang.getText('Other') as String,
                                style: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 20,
                                  color: Color(0xff383838),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}