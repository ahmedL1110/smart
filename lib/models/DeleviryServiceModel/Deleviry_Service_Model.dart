class DeliveryModel{
  dynamic name;
  dynamic name2;
  dynamic title;
  dynamic title2;
  dynamic state;
  dynamic state2;
  dynamic image;


  DeliveryModel({
    required this.name,
    required this.name2,
    required this.title,
    required this.title2,
    required this.state,
    required this.state2,
    required this.image,
  });

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    name2 = json['name2'];
    title = json['title'];
    title2 = json['title2'];
    state = json['state'];
    state2 = json['state2'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'state': state,
      'name2': name2,
      'title2': title2,
      'state2': state2,
      'image': image,
    };
  }
}