class User {
  User({
    this.name,
    this.username,
    this.phone,
    this.address,
    this.lat,
    this.lng,

  });
  String name;
  String username;
  String phone;
  Address address;
  String lat;
  String lng;

  factory User.fromJson(dynamic json) {
    return User(
        name : json['name'] .toString(),
        username:json['username'] .toString(),
        phone:json['phone'] .toString(),
        address: Address.fromJson(json['address']),
        lat: json['lat'].toString(),
        lng: (json['lng'].toString()),

    );
  }
  @override
  String toString() {
    return '{  ${this.name}, ${this.username} , ${this.phone},${this.lat},${this.lng}';
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
  Geo.fromJson( dynamic json) {
    lat = json['lat'].toString();
    lng= json['lng'].toString();
  }
  @override
  String toString() {
    return '{  ${this.lat}, ${this.lng} }';
  }
}
