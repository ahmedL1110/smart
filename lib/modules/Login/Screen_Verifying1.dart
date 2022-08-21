import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_service/modules/Login/Register.dart';

import '../../shared/components/constants.dart';


class Verifying2 extends StatefulWidget {
  const Verifying2({Key? key}) : super(key: key);

  @override
  State<Verifying2> createState() => _Verifying2State();
}

class _Verifying2State extends State<Verifying2> {
  bool isResend = false;
  bool isVerified = false;
  bool isLoading = false;

  late Timer timer;

  int start = 30;

  void resend() {
    setState(() {
      isResend = true;
    });
    Duration oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (start == 0) {
          start = 30;
          isResend = false;
          timer.cancel();
        } else {
          start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background2.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: size.height * 0.2,
                    right: size.width * 0.3,
                    left: size.width * 0.3,
                    child: Image(
                      image: const AssetImage(
                        'assets/images/smarts.png',
                      ),
                      fit: BoxFit.contain,
                      height: size.height * 0.15,
                      width: size.width * 0.35,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.4,
                    right: size.width * 0.3,
                    left: size.width * 0.3,
                    child: const Text(
                      'كود التفعيل',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        //color: Color(0xff5300BF),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.465,
                    right: size.width * 0.15,
                    child: const Text(
                      'لقد تم  إرسال كود التفعيل  إلى الرقم 0597788221 ',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 14,
                        color: const Color(0xff7b7890),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.51,
                    right: size.width * 0.35,
                    left: size.width * 0.35,
                    child: const Text(
                      'مكون من 6 أرقام ',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 14,
                        color: Color(0xff7b7890),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.55,
                    right: size.width * 0.06,
                    left: size.width * 0.06,
                    child: Form(
                      child: Row(
                        children: [
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5300BF),
                                  ),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              cursorColor: const Color(0xff5300BF),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5300BF),
                                  ),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              cursorColor: const Color(0xff5300BF),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5300BF),
                                  ),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              cursorColor: const Color(0xff5300BF),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5300BF),
                                  ),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              cursorColor: const Color(0xff5300BF),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5300BF),
                                  ),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              cursorColor: const Color(0xff5300BF),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xff5300BF),
                                  ),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              cursorColor: const Color(0xff5300BF),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.65,
                    right: size.width * 0.1,
                    left: size.width * 0.1,
                    child: SizedBox(
                      width: size.width * 0.8,
                      child: ElevatedButton(
                        clipBehavior: Clip.antiAlias,
                        onPressed: () {
                          navigatorTo(context, RegisterScreen());
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(
                              (0xff5300BF),
                            ),
                          ),

                        ),
                        child: const Text(
                          'تأكيد الرقم',
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 18,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              height: 2),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                  if(!isResend)
                    Positioned(
                      top: size.height * 0.74,
                      right: size.width * 0.1,
                      left: size.width * 0.22,
                      child: const Text(
                        'لم أستلم كود التفعيل؟',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: Color(0xff7b7890),
                          height: 1.7142857142857142,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  if(isResend)
                    Positioned(
                      top: size.height * 0.74,
                      right: size.width * 0.2,
                      left: size.width * 0.2,
                      child: const Text(
                        'انتظر قليلا ليتم إعادة ارسال كود التفعيل',
                        style:  TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: Color(0xff7b7890),
                          height: 1.7142857142857142,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  if (!isResend)
                    Positioned(
                      top: size.height * 0.72,
                      right: size.width * 0.6,
                      child: TextButton(
                        onPressed: () {
                          if (isResend) return;
                          return resend();
                        },
                        child: const Text(
                          'أعد الارسال',
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 14,
                            color: Color(0xff5300bf),
                            fontWeight: FontWeight.w700,
                            //height: 1.7142857142857142,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                      ),
                    ),
                  if (isResend)
                    Positioned(
                      top: size.height * 0.72,
                      right: size.width * 0.4,
                      child: Text(
                        '\n\n ${start.toString()} : 00',
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 32,
                          color: Color(0xfff6c52f),
                          fontWeight: FontWeight.w500,
                          height: 0.75,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}