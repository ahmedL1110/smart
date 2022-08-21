import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';


class ProviderLanguage with ChangeNotifier {

  String language = 'العربية';
  Map<String, Object> textAr = {
    "Home": "الرئيسية",
    "Notification": "إشعارات",
    "About_Us": "عنا",
    "Settings": "إعدادات",
    "Select_your_location": "حدد موقعك",
    "Hello": "مرحباً,",
    "How_We_can_Help_you": "كيف يمكننا مساعدتك؟",
    "What_service_are_you_looking_for": "ما الخدمة التي تبحث عنها",
    "Details_about_service": "تفاصيل عن الخدمة",
    "Language": "اللغة",
    "Rating": "تقييمك لخدماتنا",
    "Help": "طلب مساعدة",
    "Logout" : "خروج",
    "We" : "من نحن",
    "Dec" : "شركة أبل هي شركة تقنية أمريكية متعددة الجنسيات متخصصة في الإلكترونيات الاستهلاكية، البرامج والخدمات عبر الإنترنت ومقرها في كوبرتينو، كاليفورنيا، الولايات المتحدة. تعد أبل أكبر شركة لتكنولوجيا المعلومات من حيث الإيرادات (بإجمالي 365٫8 مليار دولار أمريكي في عام 2021) واعتبارًا من مايو 2022، أصبحت ثاني أكبر شركة في العالم من حيث القيمة، رابع أكبر بائع لأجهزة الكمبيوتر الشخصية من حيث مبيعات الوحدات وثاني أكبر شركة الشركة المصنعة للهاتف المحمول. إنها واحدة من أكبر خمس شركات تكنولوجيا المعلومات الأمريكية، إلى جانب ألفابت، أمازون، ميتا، ومايكروسوفت.",
    "Our_Services" : "خدماتنا",
    "Service1" : "إطلب ما تريد من خدمات",
    "Service2" : "توصيل الخدمة مجاناً",
    "Service3" : "الدفع عند الإستلام",
    "Connect" : "تواصل معنا",
    "Phone" : "رقم الهاتف",
    "Email" : "البريد الإلكتروني",
    "Url" : "موقعنا",
    "Service_Matin_House" : "خدمة صيانة المنازل",
    "Next" : "التالي",
    "Ok" : "موافق",
    "Back" : "رجوع",
    "Shekel" : "شيكل",
    "The_Total_Amount" : "المبلغ الإجمالي : ",
    "Service_Delivery" : "خدمة التوصيل المنزلي ",
    "Item1" : "تجد هنا قائمة بالوجبات المتوفرة داخل المطعم",
    "Item2" : "يمكنك إختيار ما تريد تناوله اليوم",
    "Details_Order" : "تفاصيل الطلب",
    "Add_Details_Service" : "إضافة تفاصيل الخدمة",
    "Details_Service" : "تفاصيل الخدمة",
    "Good_Day_Service" : "حدد اليوم المناسب لتلقي الخدمة",
    "Day_Service" : "يوم الخدمة",
    "Good_Time_Service" : "حدد الوقت المناسب لتلقي الخدمة",
    "Time_Service" : "وقت الخدمة",
    "Login" : "تسجيل الدخول",
    "Password" : "كلمة المرور",
    "QEmail" : "أليس لديك حساب؟",
    "Register" : "تسجيل",
    "Register_New_User" : "تسجيل مستخدم جديد",
    "Register_Item" : "يمكنك اختيار  تسجيل بياناتك كعميل أو مزود خدمة",
    "Client" : "عميل",
    "Register_Client" : "تسجيل عميل",
    "Dealer" : "مزود خدمة",
    "Register_Dealer" : "تسجيل مزود خدمة",
    "Enter_Details" : "يرجى إدخال بياناتك",
    "Text_Details" : "يمكنك كتابة بياناتك أدناه",
    "Name" : "الإسم",
    "Location" : "الموقع",
    "Select_Service" : "إختيار الخدمة",
    "Price_Service" : "سعر الخدمة",
    "Time_Job" : "وقت العمل",
    "Other" : "عذرا لا يوجد خدمات لعرضها",
    "Service4" : "خدمة العناية الصحية",
    "Service5" : "خدمة معلمي الخاص",
    "Service6" : "خدمة التسوق الإلكتروني",
    "Service7" : "خدمات أخرى",
  };
  Map<String, Object> textEn = {
    "Home": "Home",
    "Notification": "Notification",
    "About_Us": "About Us",
    "Settings": "Settings",
    "Select_your_location": "Select your location",
    "Hello": "Hello,",
    "How_We_can_Help_you": "How We can Help you?",
    "What_service_are_you_looking_for": "What service are you looking for",
    "Details_about_service": "Details about service",
    "Language": "Language",
    "Rating": "Your evaluation of our services",
    "Help": "Asked assistant",
    "Logout" : "Logout",
    "We" : "who are we",
    "Dec" : "The Apple Corporation is an American multinational technology company specializing in consumer electronics, software and online services, headquartered in Cupertino, California, United States. Apple is the largest IT company by revenue (totaling \$365.8 billion in 2021) and as of May 2022, it is the world's second-largest company by value, the fourth-largest seller of personal computers by unit sales and the second-largest company mobile phone manufacturer. It is one of the top five US IT companies, along with Alphabet, Amazon, Meta, and Microsoft.",
    "Our_Services" : "Our Services",
    "Service1" : "Ask for the services you want",
    "Service2" : "Free delivery service",
    "Service3" : "Paiement when recieving",
    "Connect" : "Connect with us",
    "Phone" : "Phone Number",
    "Url" : "The our site",
    "Service_Matin_House" : "Home Maintenance Service",
    "Next" : "Next",
    "Ok" : "OK",
    "Back" : "Back",
    "Shekel" : "Shekel",
    "The_Total_Amount" : "The Total Amount : ",
    "Service_Delivery" : "Home Delivery Service",
    "Item1" : "Here you will find a list of the meals available in the restaurant",
    "Item2" : "You can choose what you want to eat today",
    "Details_Order" : "Details Order",
    "Add_Details_Service" : "Add details service",
    "Details_Service" : "details service",
    "Good_Day_Service" : "Select the appropriate day to receive the service",
    "Day_Service" : "day service",
    "Good_Time_Service" : "Select the appropriate time to receive the service",
    "Time_Service" : "time service",
    "Login" : "Login",
    "Email" : "Email",
    "Password" : "Password",
    "QEmail" : "Don\'t have an account?",
    "Register" : "Register",
    "Register_New_User" : "Register New User",
    "Register_Item" : "You can choose to register your details as a customer or service provider",
    "Client" : "Client",
    "Register_Client" : "Register Client",
    "Dealer" : "Dealer",
    "Register_Dealer" : "Register Dealer",
    "Enter_Details" : "Please enter your details",
    "Text_Details" : "You can write your details below",
    "Name" : "Name",
    "Location" : "Location",
    "Select_Service" : "Select Service",
    "Price_Service" : "Price Service",
    "Time_Job" : "Job Time",
    "Other" : "Sorry, there are no services to display",
    "Service4" : "health care service",
    "Service5" : "Private Teacher service",
    "Service6" : "Online shopping service",
    "Service7" : "Other Service",
  };

  changeLanguage(bool language) {
    isAr = language;
    notifyListeners();
  }


  changeLan(String lang) {
    if (language != lang) isAr = !isAr;
    language = lang;
    notifyListeners();
  }

  Object? getText(String text) {
    if (isAr == true) {
      return textAr[text];
    }
    return textEn[text];
  }
}