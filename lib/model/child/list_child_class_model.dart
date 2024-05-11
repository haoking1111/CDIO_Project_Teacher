class ListChild {
  int? id;
  String? fullName;
  int? age;
  String? birthDay;
  int? height;
  int? weight;
  bool? gender;
  String? hobby;
  int? parentId;
  int? teacherId;
  int? classroomId;

  ListChild(
      {this.id,
      this.fullName,
      this.age,
      this.birthDay,
      this.height,
      this.weight,
      this.gender,
      this.hobby,
      this.parentId,
      this.teacherId,
      this.classroomId});

  factory ListChild.fromJson(Map<String, dynamic> json) {
    return ListChild(
      id: json['id'] is String ? int.tryParse(json['id'] ?? '') : json['id'],
      fullName: json['fullName'] ?? '',
      age: json['age'] is String ? int.tryParse(json['age'] ?? '') : json['age'],
      birthDay: json['birthDay'] ?? '',
      height: json['height'] is String ? int.tryParse(json['height'] ?? '') : json['height'],
      weight: json['weight'] is String ? int.tryParse(json['weight'] ?? '') : json['weight'],
      gender: json['gender'],
      hobby: json['hobby'] ?? '',
      parentId: json['parentId'] is String ? int.tryParse(json['parentId'] ?? '') : json['parentId'],
      teacherId: json['teacherId'] is String ? int.tryParse(json['teacherId'] ?? '') : json['teacherId'],
      classroomId: json['classroomId'] is String ? int.tryParse(json['classroomId'] ?? '') : json['classroomId'],
    );
  }
}
