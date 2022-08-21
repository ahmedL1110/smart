import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/layoutScreen.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';

import '../../modules/Login/cubit/cubit.dart';
import '../../shared/components/constants.dart';
import '../language/language.dart';

class RegisterCliente extends StatelessWidget {
  const RegisterCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        var lang = Provider.of<ProviderLanguage>(context);
        return Directionality(
          textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                lang.getText('Register_Client') as String,
                style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 20,
                  color: Color(0xff0f0a39),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
                softWrap: false,
              ),
              iconTheme: const IconThemeData(
                color: Color(0xff0f0a39),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.0525,
                  vertical: size.height * 0.02),
              child: Form(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Text(
                        lang.getText('Enter_Details') as String,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 28,
                          color: const Color(0xff0f0a39),
                          fontWeight: FontWeight.w700,
                          height: size.height * 0.001,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        lang.getText('Text_Details') as String,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20,
                          color: Color(0xff7b7890),
                          height: size.height * 0.002,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        lang.getText('Name') as String,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: Color(0xff7b7890),
                          height: size.height * 0.001,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.01),
                        child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          controller: loginCubit.nameController,
                          onTap: ()
                          {
                            print(loginCubit.nameController);
                          },
                          onChanged: (value)
                          {
                            loginCubit.saveTextFormField(value);
                          },
                          mouseCursor: MouseCursor.defer,
                          validator: (value) {
                            if (value == null) {
                              return 'رجاءا أدخل إسمك';
                            }
                            return null;
                          },
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            height: size.height * 0.002,
                            fontSize: 16,
                            color: const Color(0xff0f0a39),
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: isAr ? 'أدخل إسمك': 'Enter your name',
                            filled: true,
                            fillColor: const Color(0xffF5F6FA),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xffcbc9d9),
                              height: size.height * 0.001,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        lang.getText('Email') as String,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: const Color(0xff7b7890),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: TextFormField(
                          controller: loginCubit.emailController,
                          onTap: () {},
                          textAlign: TextAlign.start,
                          onChanged: (value)
                          {
                            loginCubit.saveTextFormField(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null) {
                              return 'رجاءا أدخل بريدك الإلكتروني';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: isAr ? 'أدخل بريدك الإلكتروني': 'Enter your email',
                            hintStyle: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: Color(0xffcbc9d9),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F6FA),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 16,
                            height: size.height * 0.002,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        lang.getText('Password') as String,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          color: const Color(0xff7b7890),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: TextFormField(
                          controller: loginCubit.passwordController,
                          onTap: () {},
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null) {
                              return 'رجاءا أدخل كلمة المرور';
                            }
                            return null;
                          },
                          obscureText: LoginCubit.get(context).isPassword,
                          onChanged: (value)
                          {
                            loginCubit.saveTextFormField(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: LoginCubit.get(context).suffix != null
                                ? IconButton(
                              onPressed: () {
                                LoginCubit.get(context)
                                    .changeVisibilityPassword();
                              },
                              icon: Icon(
                                LoginCubit.get(context).suffix,
                                color: Color(0xffF6C52F),
                              ),
                            )
                                : null,
                            hintText: isAr ? 'أدخل كلمة المرور' : 'Enter your password',
                            filled: true,
                            fillColor: const Color(0xffF5F6FA),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            hintStyle: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: Color(0xffcbc9d9),
                            ),
                          ),
                          style:  TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: Color(0xff0F0A39),
                              height: size.height * 0.002
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      BuildCondition(
                        condition: state is! LoadingRegisterClient,
                        builder: (context) => InkWell(
                          onTap: () {
                            LoginCubit.get(context).registerClient(
                              email: loginCubit.emailController.text,
                              name: loginCubit.nameController.text,
                              password: loginCubit.passwordController.text,
                            );
                            // if(formKey.currentState!.validate())
                            // {
                            //   LoginCubit.get(context).registerClient(
                            //     email: emailController.text,
                            //     name: nameController.text,
                            //     password: passwordController.text,
                            //   );
                            // }
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
                                lang.getText('Register_Client') as String,
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  height: size.height * 0.001,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),
                            ),
                          ),
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessRegisterClient) {
          navigatorFinished(context, LayoutScreen());
        }
      },
    );
  }
}