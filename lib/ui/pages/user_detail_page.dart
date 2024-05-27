import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/random_user.dart';
import '../controllers/user_controller.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  RandomUser user = Get.arguments[0];

  final controllerName = TextEditingController();
  final controllerCity = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerGender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    controllerName.text = user.name;
    controllerCity.text = user.city;
    controllerEmail.text = user.email;
    controllerGender.text = user.gender;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await userController.deleteUser(user.id);
              Get.back();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            TextField(
                controller: controllerName,
                decoration: InputDecoration(
                  labelText: 'Name',
                )),
            SizedBox(
              height: 5,
            ),
            TextField(
                key: Key('TextFieldCity'),
                controller: controllerCity,
                decoration: InputDecoration(
                  labelText: 'City',
                )),
            SizedBox(
              height: 5,
            ),
            TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                )),
            SizedBox(
              height: 5,
            ),
            TextField(
                controller: controllerGender,
                decoration: InputDecoration(
                  labelText: 'Gender',
                )),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            RandomUser userM = user;
                            userM.name = controllerName.text;
                            userM.city = controllerCity.text;
                            userM.email = controllerEmail.text;
                            userM.gender = controllerGender.text;
                            await userController.updateUser(userM);
                            Get.back();
                          },
                          child: Text("Save")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
