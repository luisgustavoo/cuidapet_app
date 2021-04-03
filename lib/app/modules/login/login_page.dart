
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/facebook_button.dart';
import '../../shared/theme_utils.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = 'Login'}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeightDp,
      width: ScreenUtil.screenWidthDp,
      child: Scaffold(
        backgroundColor: ThemeUtils.primaryColor,
        body: Stack(
          children: [
            Container(
              height: ScreenUtil.screenHeightDp * 0.95,
              width: ScreenUtil.screenWidthDp,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('lib/assets/images/login_background.png'),
                      fit: BoxFit.fill)),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.statusBarHeight + 30),
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    'lib/assets/images/logo.png',
                    width: ScreenUtil().setWidth(400),
                    fit: BoxFit.fill,
                  ),
                  _buildForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Login',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50), gapPadding: 0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50), gapPadding: 0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 60,
              width: ScreenUtil.screenWidthDp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ThemeUtils.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {
                  /*await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: 'luisgustavovieirasantos@gmail.com',
                      password: '123123');
                  await FacebookLogin().logIn(['public_profile', 'email']);*/
                  /*await CustomDio.authInstance
                      .get('https://viacep.com.br/ws/01001000/json/ds')
                      .then((response) => print(response.data));*/
                  /*final _fcm = FirebaseMessaging();
                  print(await _fcm.getToken());*/
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'ou',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeUtils.primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            FacebookButton(),
            TextButton(onPressed: () {}, child: Text('cadastre-se')),
          ],
        ),
      ),
    );
  }
}
