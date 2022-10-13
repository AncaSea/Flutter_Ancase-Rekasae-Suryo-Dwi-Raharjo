class UserModel {
  String? name;
  String? job;

  UserModel(
    this.name,
    this.job,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'job': job,
    };
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    job = map['job'];
  }
}
