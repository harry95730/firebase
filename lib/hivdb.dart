import 'package:hive/hive.dart';
part 'hivdb.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String displayName;

  @HiveField(3)
  late String photourl;

  User(
      {required this.name,
      required this.email,
      required this.displayName,
      required this.photourl});
}
