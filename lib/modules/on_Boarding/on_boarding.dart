import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/constants.dart';
import '../Login/Login_Screen.dart';

class BordingModel {
  final String image;
  final String title;
  final String body;

  BordingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBordingScreen extends StatefulWidget {
  @override
  _OnBordingState createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBordingScreen> {
  @override
  bool isLast = false;

  List<BordingModel> border = [
    BordingModel(
      image: 'assets/images/onBoarding_1.png',
      title: 'مرحباً!',
      body: 'شارك معنا  ... اكثر من ١٠٠ خدمة في التطبيق ',
    ),
    BordingModel(
      image: 'assets/images/onBoarding_2.png',
      title: 'طرق الدفع',
      body: 'لك حرية الاختيار إما عند الاستلام أو الدفع بالبطاقة',
    ),
    BordingModel(
      image: 'assets/images/onBoarding_3.png',
      title: 'أماكن عمل التطبيق ',
      body: 'يعمل التطبيق في جميع أنحاء ومدن الضفة الغربية والقدس',
    ),
  ];

  List<BordingModel> border2 = [
    BordingModel(
      image: 'assets/images/onBoarding_1.png',
      title: 'Hello!',
      body: 'Share with us ... more than 100 services in the application',
    ),
    BordingModel(
      image: 'assets/images/onBoarding_2.png',
      title: 'Payment Method',
      body: 'You are free to choose either upon receipt or card payment',
    ),
    BordingModel(
      image: 'assets/images/onBoarding_3.png',
      title: 'Application workplaces ',
      body: 'The application works throughout and in cities of the West Bank and Jerusalem',
    ),
  ];
  var boardControaller = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background2.png',
                    ),
                  )),
            ),
            PageView.builder(
              onPageChanged: (int index) {
                if (index == border.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              physics: const BouncingScrollPhysics(),
              controller: boardControaller,
              itemBuilder: (context, index) => isAr ? buildBorder(border[index]) : buildBorder(border2[index]),
              itemCount: border.length,
            ),
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.85,
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              child: SmoothPageIndicator(
                controller: boardControaller,
                count: border.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Color(0xffCBC9D9),
                  activeDotColor: Color(0xff5300BF),
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 2.0,
                  radius: 8,
                  expansionFactor: 2.0,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              right: MediaQuery
                  .of(context)
                  .size
                  .width * 0.83,
              child: InkWell(
                onTap: ()
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Text(
                  isAr ? 'تخطي' : 'Skip',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff5300BF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBorder(border) =>
      SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical: MediaQuery.of(context).size.height * 0.01),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery
                          .of(context)
                          .size
                          .height * 0.2,
                      child: Text(
                        '${border.title}',
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 28.0,
                          height: 1,
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery
                          .of(context)
                          .size
                          .height * 0.25,
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.85,
                        child: Text(
                          '${border.body}',
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Tajawal',
                            height: 2,
                            color: Color(0xff7B7890),
                          ),
                          textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery
                          .of(context)
                          .size
                          .height * 0.4,
                      left: MediaQuery
                          .of(context)
                          .size
                          .width * 0.075,
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.4,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        child: Image(
                          image: AssetImage(
                            '${border.image}',
                          ),
                          fit: BoxFit.contain,
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
}