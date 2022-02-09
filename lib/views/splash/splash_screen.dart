import 'package:exam_second/core/components/exporting.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: const SelectZonePage(),
        duration: 3000,
        imageSize: (MediaQuery.of(context).size.height * 0.2).toInt(),
        imageSrc: ConstIcons.prayer,

        text: "Namoz Vaqtlari",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.07,
          color: ConstColors.textColor,
        ),
        backgroundColor: ConstColors.lightPrimary,
      ),
    );
  }
}
