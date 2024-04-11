import 'package:flutter/material.dart';
import 'package:flutter_example_dark_light/theme_contoller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        final activeColor = controller.activeColor;
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              scaffoldBackgroundColor: activeColor.scaffoldColor,
              // 다크, 라이트 테마 시 디폴트로 사용할 텍스트 색상을 정의해 두고 사용하시면 됩니다.
              // 만일 다른 색상이 들어간 텍스트에는 직접 ThemeController에서 색상을 읽어와서 TextStyle에 적용하시면 되세요.
              textTheme: const TextTheme(
                bodyMedium:
                    TextStyle(), // The default text style for [Material].
              ).apply(
                displayColor: activeColor.textColor,
                bodyColor: activeColor.textColor,
              )
              // 다른 공통된 테마 데이터를 여기에 추가할 수 있습니다.
              ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      return Scaffold(
        // 프로젝트 진행 시 페이지 별로 앱바의 디자인이 조금씩 다를 경우가 있어서
        // AppBar에서 다이렉트로 컬러를 지정해 주는걸 추천드립니다.
        // 만약 모든페이지에서 앱바의 디자인이 동일하다면 GetMaterialApp 의 theme에서 정의하는게 편해요.
        appBar: AppBar(
          title: const Text('Flutter Manual Theme'),
          backgroundColor: controller.activeColor.appBarColor,
          titleTextStyle:
              TextStyle(color: controller.activeColor.appBarTextColor),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Switch(
                value: controller.isDark,
                onChanged: (v) {
                  controller.toggleTheme();
                },
              ),
              const Text(
                'Light / Dark',
              ),
            ],
          ),
        ),
      );
    });
  }
}
