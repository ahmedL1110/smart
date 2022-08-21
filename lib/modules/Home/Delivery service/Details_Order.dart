import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/layout/layoutScreen.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';
import 'package:unicons/unicons.dart';

import '../../../modules/Login/cubit/cubit.dart';
import '../../../shared/components/constants.dart';
import '../../language/language.dart';
import 'Details_Service.dart';
import 'Revision_Details_Order.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit,LoginState>(
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Scaffold(
          body: Directionality(
            textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.22,
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
                        right: isAr ? size.width * 0.05 : 0,
                        left: isAr ? 0 : size.width * 0.05,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                navigatorFinished(context, LayoutScreen());
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.12,
                        right: isAr ? size.width * 0.2 : 0,
                        left: isAr ? 0 : size.width * 0.2 ,
                        child: Row(
                          children: [
                            Text(
                              Provider.of<ProviderLanguage>(context).getText('Details_Order') as String,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 20,
                                color: const Color(0xff0f0a39),
                                fontWeight: FontWeight.w700,
                                height: size.height * 0.001,
                              ),
                              textAlign: isAr ? TextAlign.right: TextAlign.left,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.05,
                          horizontal: size.width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Provider.of<ProviderLanguage>(context).getText('Add_Details_Service') as String,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xff383838),
                              fontWeight: FontWeight.w700,
                              height: size.height * 0.001,
                            ),
                            textAlign: isAr ? TextAlign.right: TextAlign.left,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            Provider.of<ProviderLanguage>(context).getText('Details_Service') as String,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: size.height * 0.001,
                            ),
                            textAlign: isAr ? TextAlign.right: TextAlign.left,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: size.height * 0.1,
                            width: size.width * 0.895,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F6FA),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
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
                                textAlign: isAr ? TextAlign.right: TextAlign.left,
                                style: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xff0f0a39),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: isAr ? ' أدخل تفاصيل الخدمة الخاصة بك' : 'Please enter details your service',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffcbc9d9),
                                    height: size.height * 0.001,
                                  ),
                                ),
                                onTap: () {},
                                onChanged: (value)
                                {
                                  loginCubit.saveTextFormField(value);
                                },
                                controller: loginCubit.detailsServiceController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  Provider.of<ProviderLanguage>(context).getText('Good_Day_Service') as String,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: const Color(0xff383838),
                                    fontWeight: FontWeight.w700,
                                    height: size.height * 0.002,
                                  ),
                                  textAlign: isAr ? TextAlign.right: TextAlign.left,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            Provider.of<ProviderLanguage>(context).getText('Day_Service') as String,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: const Color(0xff7b7890),
                              height: size.height * 0.001,
                            ),
                            textAlign: isAr ? TextAlign.right: TextAlign.left,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F6FA),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: TextFormField(
                                controller: loginCubit.dateServiceController,
                                onTap: ()
                                {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2028-09-08'),
                                  ).then((value) {
                                    loginCubit.dateTime(value);
                                  });
                                },
                                onChanged: (value)
                                {
                                  loginCubit.saveTextFormField(value);
                                },
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: isAr ? 'أدخل اليوم المناسب' : 'Please Enter Day',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: const Color(0xffcbc9d9),
                                    height: size.height * 0.001,
                                  ),
                                  suffixIcon: Icon(UniconsLine.calendar_alt),
                                  suffixIconColor: Color(0xff5300BF),
                                  border: InputBorder.none,
                                  fillColor: Colors.green.shade50,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            Provider.of<ProviderLanguage>(context).getText('Good_Time_Service') as String,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xff383838),
                              fontWeight: FontWeight.w700,
                              height: size.height * 0.001,
                            ),
                            textAlign: isAr ? TextAlign.right: TextAlign.left,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            Provider.of<ProviderLanguage>(context).getText('Time_Service') as String,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: const Color(0xff7b7890),
                              height: size.height * 0.001,
                            ),
                            textAlign: isAr ? TextAlign.right: TextAlign.left,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F6FA),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: TextFormField(
                                controller: loginCubit.timeJobController,
                                onTap: ()
                                {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    loginCubit.timeJobController.text =
                                        value!.format(context).toString();
                                  });
                                },
                                onChanged: (value)
                                {
                                  loginCubit.saveTextFormField(value);
                                },
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: isAr ?'أدخل الوقت المناسب' : 'Please Enter Time',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: const Color(0xffcbc9d9),
                                    height: size.height * 0.001,
                                  ),
                                  suffixIcon: Icon(Icons.access_time_rounded),
                                  suffixIconColor: Color(0xff5300BF),
                                  border: InputBorder.none,
                                  fillColor: Colors.green.shade50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                navigatorTo(context, DetailsService());
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
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
                                child:  Center(
                                  child: Text(
                                    Provider.of<ProviderLanguage>(context).getText('Back') as String,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 14,
                                      color: Color(0xff5300bf),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            InkWell(
                              onTap: () {
                                navigatorTo(context, RevisionDetails());
                              },
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
                                    Provider.of<ProviderLanguage>(context).getText('Next') as String,
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
                          ],
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
      listener: (context, state) {},
    );
  }
}