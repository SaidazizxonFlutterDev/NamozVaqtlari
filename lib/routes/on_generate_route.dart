import 'package:exam_second/core/components/exporting.dart';
import 'package:exam_second/views/qibla/qibla_page.dart';
import 'package:exam_second/views/quron/quron_page.dart';
import 'package:exam_second/views/taqvim/taqvim_page.dart';

class RouteGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case '/home':
        return MaterialPageRoute(
          builder: (context) => HomePage(timeZoneName: args),
        );

      case '/tasbeh':
        return MaterialPageRoute(
          builder: (context) => const TasbehPage(),
        );

      case '/names':
        return MaterialPageRoute(
          builder: (context) => const NamesPage(),
        );
      case '/namesSecond':
        return MaterialPageRoute(
          builder: (context) => NamesSecond(data: args),
        );

      case '/quron':
        return MaterialPageRoute(
          builder: (context) => const QuronPage(),
        );

      case '/qibla':
        return MaterialPageRoute(
          builder: (context) => const QiblaPage(),
        );

      case '/taqvim':
        return MaterialPageRoute(
          builder: (context) => TaqvimPage(timeZone: args),
        );
    }
  }
}
