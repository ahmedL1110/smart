class RegisterModel
{
  late String name;
  late String email;
  late String uId;
  late String image;

  RegisterModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.image,

  });

  RegisterModel.fromJson(Map<String,dynamic>? json)
  {
    name = json!['name'] ?? ' ';
    uId = json['uId'] ?? ' ';
    email = json['email'] ?? ' ';
    image = json['image'] ?? ' ';

  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name' : name,
        'email' : email,
        'uId' : uId,
        'image' : image,
      };
  }

}