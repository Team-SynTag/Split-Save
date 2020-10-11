class User {
  final String id;
  final String username;
  final String email;

  User({this.id, this.username, this.email});

  factory User.fromMap(Map<String, dynamic> data) {
    User user = User(id: data['id'], username: data['username'], email: data['email']);
    return user;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, email: 'email'};
  }
}
