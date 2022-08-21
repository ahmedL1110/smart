class UserModel
{
  late String name;
  late String email;
  late String uId;
  late String phone;
  late String location;
  late String priceService;
  late String detailsService;
  late String workTime;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.location,
    required this.priceService,
    required this.detailsService,
    required this.workTime,

  });

  UserModel.fromJson(Map<String,dynamic>? json)
  {
    name = json!['name'] ?? ' ';
    uId = json['uId'] ?? ' ';
    email = json['email'] ?? ' ';
    phone = json['phone'] ?? ' ';
    location = json['location'] ?? ' ';
    priceService = json['priceService'] ?? ' ';
    detailsService = json['detailsService'] ?? ' ';
    workTime = json['workTime'] ?? ' ';
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name' : name,
        'email' : email,
        'uId' : uId,
        'phone' : phone,
        'location' : location,
        'priceService' : priceService,
        'detailsService' : detailsService,
        'workTime' : workTime,
      };
  }

}