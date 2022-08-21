class ServiceModel {
  dynamic name;
  dynamic title;
  dynamic price;
  dynamic name2;
  dynamic title2;
  dynamic image;


  ServiceModel({
    required this.name,
    required this.title,
    required this.price,
    required this.title2,
    required this.name2,
    required this.image,
  });

  ServiceModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    title = json['title'];
    price = json['price'];
    title2 = json['title2'];
    name2 = json['name2'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'price': price,
      'name2': name2,
      'title2': title2,
      'image': image,
    };
  }
}