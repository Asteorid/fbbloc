import 'package:fbbloc/constants/colors.dart';
import 'package:flutter/material.dart';
import '/model/user.dart';
import 'package:fbbloc/constants/text_style.dart';
import 'package:fbbloc/services/shared_pref.dart';

class UserInfoPage extends StatefulWidget {
  final User userInfo;
  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late String name;
  late String email;

  @override
  void initState() {
    super.initState();
    // Инициализация SharedPreferences в initState
    sharedPreference.init().then((_) {
      setState(() {
        name = sharedPreference.getName ?? "";
        email = sharedPreference.getEmail ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'User Information',
          style: AppText.texxt,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.person_4,
                color: AppColors.icons,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                email,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.email,
                color: AppColors.icons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
