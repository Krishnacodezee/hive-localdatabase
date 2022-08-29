import 'package:hive/hive.dart';

part 'hivemodel.g.dart';

@HiveType(typeId: 1)
class Detail {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? userid;

  @HiveField(2)
  String? mobilenumber;

  @HiveField(3)
  String? email;
  Detail({required this.email,required this.mobilenumber,required this.userid,required this.name});

}
