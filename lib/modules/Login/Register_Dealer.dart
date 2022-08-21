
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/layoutScreen.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';

import '../../modules/Login/cubit/cubit.dart';
import '../../shared/components/constants.dart';
import '../language/language.dart';

class RegisterDealer extends StatelessWidget {
  const RegisterDealer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lang = Provider.of<ProviderLanguage>(context);
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Directionality(
          textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                lang.getText('Register_Dealer') as String,
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
            body: Directionality(
              textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.0525,
                    vertical: size.height * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Text(
                      lang.getText('Enter_Details') as String,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 28,
                        color: const Color(0xff0f0a39),
                        fontWeight: FontWeight.w700,
                        height: size.height * 0.002,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
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
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                  vertical: size.height * 0.01),
                              child: TextFormField(
                                onTap: () {},
                                keyboardType: TextInputType.name,
                                controller: loginCubit.nameController,
                                onChanged: (value) {
                                  loginCubit.saveTextFormField(value);
                                },
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
                                  border: InputBorder.none,
                                  hintText: isAr ? 'أدخل إسمك' : 'Enter your name',
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: TextFormField(
                                controller: loginCubit.emailController,
                                onTap: () {},
                                onChanged: (value) {
                                  loginCubit.saveTextFormField(value);
                                },
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null) {
                                    return 'رجاءا أدخل بريدك الإلكتروني';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
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
                                  border: InputBorder.none,
                                  hintText: isAr ? 'أدخل بريدك الإلكتروني' : 'Enter your email',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffcbc9d9),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  height: size.height * 0.001,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: TextFormField(
                                controller: loginCubit.passwordController,
                                onChanged: (value) {
                                  loginCubit.saveTextFormField(value);
                                },
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
                                decoration: InputDecoration(
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
                                  border: InputBorder.none,
                                  suffixIcon:
                                  LoginCubit.get(context).suffix != null
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
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffcbc9d9),
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
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              lang.getText('Phone') as String,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff7b7890),
                                height: size.height * 0.003,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01),
                                  child: Container(
                                    width: size.width * 0.55,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return 'رجاءا أدخل رقم هاتفك';
                                        }
                                        return null;
                                      },
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: Color(0xff0f0a39),
                                      ),
                                      decoration: InputDecoration(
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
                                        border: InputBorder.none,
                                        hintText: isAr ? 'رقم الجوال' : 'Phone Number',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 16,
                                          color: Color(0xffcbc9d9),
                                          height: size.height * 0.001,
                                        ),
                                      ),
                                      onTap: () {},
                                      keyboardType: TextInputType.phone,
                                      controller: loginCubit.phoneController,
                                      onChanged: (value) {
                                        loginCubit.saveTextFormField(value);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF5F6FA),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                        vertical: size.height * 0.01),
                                    child: const Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        '+972',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 16,
                                          color: Color(0xffcbc9d9),
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.end,
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              lang.getText('Location') as String,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff7b7890),
                                height: size.height * 0.003,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: isAr ? TextAlign.right : TextAlign.left,
                              softWrap: false,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: size.width * 0.75,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                        vertical: size.height * 0.01),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return 'رجاءا أدخل موقعك';
                                        }
                                        return null;
                                      },
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: Color(0xff0f0a39),
                                      ),
                                      decoration: InputDecoration(
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
                                        border: InputBorder.none,
                                        hintText: isAr ? 'أدخل موقعك' : 'Enter your location',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 16,
                                          color: Color(0xffcbc9d9),
                                          height: size.height * 0.001,
                                        ),
                                      ),
                                      onTap: () {},
                                      keyboardType: TextInputType.streetAddress,
                                      controller: loginCubit.locationController,
                                      onChanged: (value) {
                                        loginCubit.saveTextFormField(value);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.025,
                                ),
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xffF6C52F),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              lang.getText('Select_Service') as String,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff7b7890),
                                height: size.height * 0.003,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل نوع خدمتك';
                                }
                                return null;
                              },
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                color: Color(0xff0f0a39),
                                overflow: TextOverflow.ellipsis,
                              ),
                              decoration: InputDecoration(
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
                                border: InputBorder.none,
                                hintText: isAr ? 'خدمة فرعية أو رئيسية' : 'Primary service or Secondary',
                                hintStyle: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xffcbc9d9),
                                  height: size.height * 0.001,
                                ),
                              ),
                              onTap: () {},
                              controller: loginCubit.selectService,
                              onChanged: (value) {
                                loginCubit.saveTextFormField(value);
                              },
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              lang.getText('Price_Service') as String,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff7b7890),
                                height: size.height * 0.001,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
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
                                validator: (value) {
                                  if (value == null) {
                                    return 'رجاءا أدخل سعر خدمتك';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xff0f0a39),
                                ),
                                decoration: InputDecoration(
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
                                  border: InputBorder.none,
                                  hintText: isAr ? 'أدخل سعر الخدمة': 'Enter price service',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffcbc9d9),
                                    height: size.height * 0.001,
                                  ),
                                ),
                                onTap: () {},
                                keyboardType: TextInputType.number,
                                controller: loginCubit.priceServiceController,
                                onChanged: (value) {
                                  loginCubit.saveTextFormField(value);
                                },
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              lang.getText('Details_Service') as String,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff7b7890),
                                height: 1.7142857142857142,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
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
                                validator: (value) {
                                  if (value == null) {
                                    return 'رجاءا أدخل تفاصيل خدمتك';
                                  }
                                  return null;
                                },
                                maxLines: 5,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xff0f0a39),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                decoration: InputDecoration(
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
                                  border: InputBorder.none,
                                  hintText: isAr ? 'أدخل تفاصيل الخدمة الخاصة بك' : 'Enter details your service',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffcbc9d9),
                                    height: size.height * 0.001,
                                  ),
                                ),
                                onTap: () {},
                                controller: loginCubit.detailsServiceController,
                                onChanged: (value) {
                                  loginCubit.saveTextFormField(value);
                                },
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              lang.getText('Time_Job') as String,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff7b7890),
                                height: 1.7142857142857142,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
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
                                validator: (value) {
                                  if (value == null) {
                                    return 'رجاءا أدخل وقت العمل';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xff0f0a39),
                                ),
                                decoration: InputDecoration(
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
                                  border: InputBorder.none,
                                  hintText: isAr ? 'أدخل وقت العمل' : 'Enter time job',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffcbc9d9),
                                    height: size.height * 0.001,
                                  ),
                                ),
                                keyboardType: TextInputType.datetime,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    loginCubit.timeJobController.text =
                                        value!.format(context).toString();
                                  });
                                },
                                controller: loginCubit.timeJobController,
                                onChanged: (value) {
                                  loginCubit.saveTextFormField(value);
                                },
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.07,
                            ),
                            BuildCondition(
                              condition: state is! LoadingRegisterDealer,
                              builder: (context) => InkWell(
                                onTap: () {
                                  loginCubit.registerDealer(
                                    email: loginCubit.emailController.text,
                                    name: loginCubit.nameController.text,
                                    password:
                                    loginCubit.passwordController.text,
                                    phone: loginCubit.phoneController.text,
                                    detailsService: loginCubit
                                        .detailsServiceController.text,
                                    location:
                                    loginCubit.locationController.text,
                                    priceService:
                                    loginCubit.priceServiceController.text,
                                    workTime: loginCubit.emailController.text,
                                  );
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
                                      lang.getText('Register_Dealer') as String ,
                                      style: const TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
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
                            SizedBox(
                              height: size.height * 0.22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessRegisterDealer) {
          navigatorFinished(context,  LayoutScreen());
        }
      },
    );
  }
}