import 'dart:convert';

class Comment {
  final int id;
  final String name;
  final String email;
  final String body;
  Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Comment copyWith({
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ body.hashCode;
  }
}
