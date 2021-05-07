class User {
  User({
    // this.id,
    this.name,
    this.username,
    this.phone,
    this.address,
  // this.lat,
//    this.lat,
//    this.lng,

  });

  //String id;
  String name;
  String username;
  String phone;
  Address address;
  //Geo lat;
//  String lat;
//  String lng;


  factory User.fromJson(dynamic json) {
    return User(
    //    id : json['id'].toString() ,
        name : json['name'] .toString(),
        username:json['username'] .toString(),
        phone:json['phone'] .toString(),
        address: Address.fromJson(json['address']),
     //   lat: Geo.fromJson(json['lat']),
//        lng: (json['lng'].toString()),

    );

  }
  @override
  String toString() {
    return '{  ${this.name}, ${this.username} , ${this.phone},${this.address}';
  }
}

class Address {
  Address({
    this.geo,
  });
  Geo geo;

  factory Address.fromJson( dynamic json) => Address(
    geo: Geo.fromJson(json["geo"]),
  );

  @override
  String toString() {
    return '{  ${this.geo} }';
  }
}
class Geo {
  String lat;
  String lng;

  Geo({this.lat, this.lng});

//  factory Geo.fromJson( dynamic json) => Geo(
//    lat: (json["lat"].toString()),
//    lng: (json["lng"].toString()),
//  );

  Geo.fromJson( dynamic json) {
    lat = json['lat'].toString();
    lng= json['lng'].toString();
  }
  @override
  String toString() {
    return '{  ${this.lat}, ${this.lng} }';
  }
}
