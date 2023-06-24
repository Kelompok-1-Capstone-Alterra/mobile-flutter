class User {
  final String? userId;
  final String? name;
  final String? email;
  final String? password;

// receiving data
  User({
    this.userId,
    this.name,
    this.email,
    this.password,
  });

  factory User.fromJson(map) {
    return User(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
// sending data
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
