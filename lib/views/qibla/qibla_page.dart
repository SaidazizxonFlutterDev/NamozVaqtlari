import 'package:exam_second/core/components/exporting.dart';

class QiblaPage extends StatefulWidget {
  const QiblaPage({Key? key}) : super(key: key);

  @override
  _QiblaPageState createState() => _QiblaPageState();
}

class _QiblaPageState extends State<QiblaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qibla Page"),
      ),
    );
  }
}
