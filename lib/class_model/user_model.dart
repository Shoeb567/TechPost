class User {
  User({
    this.id,
    this.name,
    this.username,
  });

  String id;
  String name;
  String username;

  factory User.fromJson(dynamic json) {
    return User(
        id : json['id'].toString() ,
        name : json['name'] .toString(),
        username:json['username'] .toString());
  }
  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.username} }';
  }
}