class UserModel {
  String? name;
  String? email;
  String? password;
  double? lat;
  double? lng;
  String? token;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.lat,
      required this.lng,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    lat = json['lat'];
    lng = json['lng'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['token'] = this.token;
    return data;
  }
}
