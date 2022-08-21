import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/layoutScreen.dart';
import 'package:smart_service/modules/Login/cubit/cubit.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/remote/cache_helper.dart';
import '../language/language.dart';
import 'Register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create:  (BuildContext context) =>LoginCubit() ,
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is SuccessLoginState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uid,
          ).then(
                (value) => navigatorFinished(
              context,
              LayoutScreen(),
            ),
          );
        }
      }, builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Form(
          //key: formKey,
          child: Scaffold(
            body: Directionality(
              textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
              child: Column(
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
                            left:  size.width * 0.3,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    Provider.of<ProviderLanguage>(context).getText('Login') as String,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.48,
                            right: isAr ? size.width * 0.06 : 0,
                            left: isAr ? 0 : size.width * 0.06 ,
                            child: Text(
                              Provider.of<ProviderLanguage>(context).getText('Email') as String,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: const Color(0xff7b7890),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.51,
                            right: size.width * 0.06,
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.895,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffF5F6FA),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02),
                                child: TextFormField(
                                  controller: loginCubit.emailController,
                                  onTap: () {},
                                  onChanged: (value) {
                                    loginCubit.saveTextFormField(value);
                                  },
                                  textAlign: isAr ? TextAlign.right : TextAlign.left,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'رجاءا أدخل بريدك الإلكتروني';
                                    }
                                    return null;
                                  },
                                  maxLengthEnforcement: MaxLengthEnforcement
                                      .truncateAfterCompositionEnds,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon:  Icon(
                                      Icons.email_outlined,
                                      color: Color(0xff5300BF),
                                    ) ,
                                    hintText: 'ahmed@hotmail.com',
                                    hintStyle:  TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: Color(0xffEEDFF9),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xff0F0A39),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.58,
                            right: isAr ?size.width * 0.06 : 0,
                            left: isAr ? 0 : size.width * 0.06,
                            child: Text(
                              Provider.of<ProviderLanguage>(context).getText('Password') as String,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: const Color(0xff7b7890),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.61,
                            right: size.width * 0.06,
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.895,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffF5F6FA),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02),
                                child: TextFormField(
                                  controller: loginCubit.passwordController,
                                  onTap: () {},
                                  onChanged: (value) {
                                    loginCubit.saveTextFormField(value);
                                  },
                                  textAlign: isAr ? TextAlign.right : TextAlign.left,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'رجاءا أدخل كلمة المرور';
                                    }
                                    return null;
                                  },
                                  maxLengthEnforcement: MaxLengthEnforcement
                                      .truncateAfterCompositionEnds,
                                  obscureText: LoginCubit.get(context).isPassword,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: LoginCubit.get(context).suffix != null ? IconButton(
                                      onPressed: () {
                                        LoginCubit.get(context)
                                            .changeVisibilityPassword();
                                      },
                                      icon: Icon(
                                        LoginCubit.get(context).suffix,
                                        color: Color(0xff5300BF),
                                      ),
                                    ) : null,
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Color(0xff5300BF),
                                    ),
                                    hintText: '******',
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: Color(0xffEEDFF9),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    //height: size.height * 0.0055,
                                    color: Color(0xff0F0A39),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.7,
                            right: size.width * 0.06,
                            child: BuildCondition(
                              condition: state is! LoadingLoginState,
                              builder: (context) => Container(
                                width: size.width * 0.895,
                                child: ElevatedButton(
                                  clipBehavior: Clip.hardEdge,
                                  onPressed: () {
                                    LoginCubit.get(context).loginUser(
                                      email: loginCubit.emailController.text,
                                      password:
                                      loginCubit.passwordController.text,
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(
                                        (0xff5300BF),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    Provider.of<ProviderLanguage>(context).getText('Login') as String,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 18,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                              ),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.76,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.06),
                              child: Row(
                                children: [
                                  Text(
                                    Provider.of<ProviderLanguage>(context).getText('QEmail') as String,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: const Color(0xff7b7890),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigatorFinished(
                                          context, RegisterScreen());
                                    },
                                    child:  Text(
                                      Provider.of<ProviderLanguage>(context).getText('Register') as String,
                                      style:const TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: const Color(0xff5300BF),
                                        fontWeight: FontWeight.w700,
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
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}