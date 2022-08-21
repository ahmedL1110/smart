import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/components/constants.dart';
import '../language/language.dart';
import 'Register_Cliente.dart';
import 'Register_Dealer.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            Provider.of<ProviderLanguage>(context).getText('Register_New_User') as String,
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 20,
              color: Color(0xff0f0a39),
              fontWeight: FontWeight.w700,
              height: size.height * 0.001,
            ),
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.right,
            softWrap: false,
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff0f0a39),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.0525,vertical: size.height * 0.02),
          child: Directionality(
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.13,
                    ),
                    Text(
                      Provider.of<ProviderLanguage>(context).getText('Register_New_User') as String,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 28,
                        color: Color(0xff0f0a39),
                        fontWeight: FontWeight.w700,
                        height: size.height * 0.0025,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: size.width * 0.895,
                      child:  Text(
                        Provider.of<ProviderLanguage>(context).getText('Register_Item') as String,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20,
                          color: const Color(0xff7b7890),
                          height: size.height * 0.002,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: isAr ? TextAlign.right : TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: ()
                      {
                        navigatorTo(context, const RegisterCliente());
                      },
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.895,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: Center(
                          child: Text(
                            Provider.of<ProviderLanguage>(context).getText('Client') as String,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xff5300bf),
                              fontWeight: FontWeight.w700,
                              height: size.height * 0.0015,
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: ()
                      {
                        navigatorTo(context, const RegisterDealer());
                      },
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.895,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff5300BF),
                        ),
                        child: Center(
                          child: Text(
                            Provider.of<ProviderLanguage>(context).getText('Dealer') as String,
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height * 0.35,
                      width: size.width * 0.895,
                      child: const Image(
                        image: AssetImage(
                          'assets/images/login.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}