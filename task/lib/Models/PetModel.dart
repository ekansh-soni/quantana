class PetModel {
  PetModel({
      List<Data>? data,}){
    _data = data;
}

  PetModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
PetModel copyWith({  List<Data>? data,
}) => PetModel(  data: data ?? _data,
);
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// userName : "Leanne Graham"
/// petName : "Bret"
/// petImage : "https://cdn.shibe.online/shibes/04be82add971f2b8490b5ec2308d3426e8494ad9.jpg"
/// isFriendly : true

class Data {
  Data({
      num? id, 
      String? userName, 
      String? petName, 
      String? petImage, 
      bool? isFriendly,}){
    _id = id;
    _userName = userName;
    _petName = petName;
    _petImage = petImage;
    _isFriendly = isFriendly;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _petName = json['petName'];
    _petImage = json['petImage'];
    _isFriendly = json['isFriendly'];
  }
  num? _id;
  String? _userName;
  String? _petName;
  String? _petImage;
  bool? _isFriendly;
Data copyWith({  num? id,
  String? userName,
  String? petName,
  String? petImage,
  bool? isFriendly,
}) => Data(  id: id ?? _id,
  userName: userName ?? _userName,
  petName: petName ?? _petName,
  petImage: petImage ?? _petImage,
  isFriendly: isFriendly ?? _isFriendly,
);
  num? get id => _id;
  String? get userName => _userName;
  String? get petName => _petName;
  String? get petImage => _petImage;
  bool? get isFriendly => _isFriendly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['petName'] = _petName;
    map['petImage'] = _petImage;
    map['isFriendly'] = _isFriendly;
    return map;
  }

}