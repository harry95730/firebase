import 'package:flutter_application_3/hivdb.dart';
import 'package:flutter_application_3/userclass.dart';
import 'package:hive/hive.dart';

List<Usr> lis = [];

Future<void> addUsersToBox(Usr harry) async {
  final userBox = await Hive.openBox<User>('userBox');
  List<User> users = userBox.values.toList();
  bool xl = false;
  for (var user in users) {
    if ((user.name == harry.name &&
        user.displayName == harry.displayname &&
        harry.email == user.email)) {
      xl = true;
      break;
    }
  }
  if (!xl) {
    User numb = User(
        displayName: harry.displayname,
        name: harry.name,
        email: harry.email,
        photourl: harry.photourl);
    lis.add(harry);
    userBox.add(numb);
  }
}

Future<void> retrieveUsersFromBox() async {
  final userBox = await Hive.openBox<User>('userBox');

  List<User> retrievedUsers = userBox.values.toList();
  lis.clear();
  for (var user in retrievedUsers) {
    Usr numb = Usr(
        displayname: user.displayName,
        email: user.email,
        name: user.name,
        photourl: user.photourl);
    lis.add(numb);
  }
}
