import 'package:exam_second/routes/on_generate_route.dart';
import 'package:exam_second/core/components/exporting.dart';

void main() async{
  await Hive.initFlutter();
  await ServiceHiveSelectedZone.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namoz vaqtlari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
