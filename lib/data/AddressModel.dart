import 'dart:convert';
/// page : {"total":"1","current":"1","size":"10"}
/// result : {"crs":"EPSG:900913","type":"address","items":[{"id":"4113510900106240000","address":{"zipcode":"13487","category":"road","road":"경기도 성남시 분당구 판교로 242 (삼평동)","parcel":"삼평동 624","bldnm":"","bldnmdc":""},"point":{"x":"14148853.48172358","y":"4495338.919111188"}}]}

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));
String addressModelToJson(AddressModel data) => json.encode(data.toJson());
class AddressModel {
  AddressModel({
      Page? page, 
      Result? result,}){
    _page = page;
    _result = result;
}

  AddressModel.fromJson(dynamic json) {
    _page = json['page'] != null ? Page.fromJson(json['page']) : null;
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  Page? _page;
  Result? _result;

  Page? get page => _page;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_page != null) {
      map['page'] = _page?.toJson();
    }
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

/// crs : "EPSG:900913"
/// type : "address"
/// items : [{"id":"4113510900106240000","address":{"zipcode":"13487","category":"road","road":"경기도 성남시 분당구 판교로 242 (삼평동)","parcel":"삼평동 624","bldnm":"","bldnmdc":""},"point":{"x":"14148853.48172358","y":"4495338.919111188"}}]

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      String? crs, 
      String? type, 
      List<Items>? items,}){
    _crs = crs;
    _type = type;
    _items = items;
}

  Result.fromJson(dynamic json) {
    _crs = json['crs'];
    _type = json['type'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }
  String? _crs;
  String? _type;
  List<Items>? _items;

  String? get crs => _crs;
  String? get type => _type;
  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crs'] = _crs;
    map['type'] = _type;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "4113510900106240000"
/// address : {"zipcode":"13487","category":"road","road":"경기도 성남시 분당구 판교로 242 (삼평동)","parcel":"삼평동 624","bldnm":"","bldnmdc":""}
/// point : {"x":"14148853.48172358","y":"4495338.919111188"}

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));
String itemsToJson(Items data) => json.encode(data.toJson());
class Items {
  Items({
      String? id, 
      Address? address, 
      Point? point,}){
    _id = id;
    _address = address;
    _point = point;
}

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _point = json['point'] != null ? Point.fromJson(json['point']) : null;
  }
  String? _id;
  Address? _address;
  Point? _point;

  String? get id => _id;
  Address? get address => _address;
  Point? get point => _point;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_point != null) {
      map['point'] = _point?.toJson();
    }
    return map;
  }

}

/// x : "14148853.48172358"
/// y : "4495338.919111188"

Point pointFromJson(String str) => Point.fromJson(json.decode(str));
String pointToJson(Point data) => json.encode(data.toJson());
class Point {
  Point({
      String? x, 
      String? y,}){
    _x = x;
    _y = y;
}

  Point.fromJson(dynamic json) {
    _x = json['x'];
    _y = json['y'];
  }
  String? _x;
  String? _y;

  String? get x => _x;
  String? get y => _y;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['x'] = _x;
    map['y'] = _y;
    return map;
  }

}

/// zipcode : "13487"
/// category : "road"
/// road : "경기도 성남시 분당구 판교로 242 (삼평동)"
/// parcel : "삼평동 624"
/// bldnm : ""
/// bldnmdc : ""

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());
class Address {
  Address({
      String? zipcode, 
      String? category, 
      String? road, 
      String? parcel, 
      String? bldnm, 
      String? bldnmdc,}){
    _zipcode = zipcode;
    _category = category;
    _road = road;
    _parcel = parcel;
    _bldnm = bldnm;
    _bldnmdc = bldnmdc;
}

  Address.fromJson(dynamic json) {
    _zipcode = json['zipcode'];
    _category = json['category'];
    _road = json['road'];
    _parcel = json['parcel'];
    _bldnm = json['bldnm'];
    _bldnmdc = json['bldnmdc'];
  }
  String? _zipcode;
  String? _category;
  String? _road;
  String? _parcel;
  String? _bldnm;
  String? _bldnmdc;

  String? get zipcode => _zipcode;
  String? get category => _category;
  String? get road => _road;
  String? get parcel => _parcel;
  String? get bldnm => _bldnm;
  String? get bldnmdc => _bldnmdc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zipcode'] = _zipcode;
    map['category'] = _category;
    map['road'] = _road;
    map['parcel'] = _parcel;
    map['bldnm'] = _bldnm;
    map['bldnmdc'] = _bldnmdc;
    return map;
  }

}

/// total : "1"
/// current : "1"
/// size : "10"

Page pageFromJson(String str) => Page.fromJson(json.decode(str));
String pageToJson(Page data) => json.encode(data.toJson());
class Page {
  Page({
      String? total, 
      String? current, 
      String? size,}){
    _total = total;
    _current = current;
    _size = size;
}

  Page.fromJson(dynamic json) {
    _total = json['total'];
    _current = json['current'];
    _size = json['size'];
  }
  String? _total;
  String? _current;
  String? _size;

  String? get total => _total;
  String? get current => _current;
  String? get size => _size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['current'] = _current;
    map['size'] = _size;
    return map;
  }

}