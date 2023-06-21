class User{
  String? id;
  String? name;
  String phone;
  String? pass;
  String? countryId;

  User({this.id,this.name,required this.phone,this.pass,this.countryId});

  toJson(Map json){
    return {
      "name": name,
      "phone": phone,
      "email": "user$phone@mersal.com",
      "password":pass,
      "password_confirmation":pass,
      "type":'client',
      "country_id":json["country_id"]
    };
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        pass:json['pass'],
        countryId:json["country_id"]
    );
  }
}