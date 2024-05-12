List<RegisterModel> registerFromJson(dynamic str) => List<RegisterModel>.from((str).map((x) => RegisterModel.fromJson(x)));

class RegisterModel {

  String? email;
  String? username;
  String? password;

  RegisterModel({
    this.email,
    this.password,
    this.username
  });

  RegisterModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['email'] = email;
     _data['password'] = password;
      _data['username'] = username;

      return _data;
  }  
}