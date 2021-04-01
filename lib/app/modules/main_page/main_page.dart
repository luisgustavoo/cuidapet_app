import 'package:cuidapet_app/app/shared/auth_store.dart';
import 'package:cuidapet_app/app/shared/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/screenutil.dart';


class MainPage extends StatelessWidget {
  MainPage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authStore = Modular.get<AuthStore>();
      final isLogged = await authStore.isLogged();
      if (isLogged) {
        await Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
      } else {
        await Modular.to.pushNamedAndRemoveUntil('/login', (_) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ThemeUtils.init(context);

    return Scaffold(
        body: Center(child: Image.asset('lib/assets/images/logo.png')));
  }
}
