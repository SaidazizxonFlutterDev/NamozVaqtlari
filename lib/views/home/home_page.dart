import 'package:exam_second/core/components/exporting.dart';
import 'package:exam_second/core/datas/data.dart';
import 'package:exam_second/services/time_service.dart';

class HomePage extends StatefulWidget {
  var timeZoneName;
  HomePage({Key? key, required this.timeZoneName}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List hour = [], minute = [];

  int real = 5;
  @override
  void initState() {
    super.initState();
    ServiceHiveSelectedZone.editBox(widget.timeZoneName);
    debugPrint(ServiceHiveSelectedZone.selectedZoneBox.values.toString());
  }

  @override
  Widget build(BuildContext context) {
    convertToList();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: ConstColors.primary,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ConstColors.primary,
                    ConstColors.secondaryLight,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Datas.data[real] + " - ${Service.datas[real]}",
                      style: TextStyle(
                        color: ConstColors.textColor,
                        fontSize: MediaQuery.of(context).size.width * 0.09,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: MyEdgeInsets.symmetric(context: context, vertical: 0.02),
              child: MyHomePageRow.body(context, widget.timeZoneName),
            ),
          ),
        ],
      ),
    );
  }

  convertToList() async {
    hour.clear();
    minute.clear();
    for (var i in Service.datas) {
      hour.add(i.split(":")[0]);
      minute.add(i.split(":")[1]);
    }
    print(hour);
    print(minute);
    checker();
  }

  checker() {
    for (int i = 0; i < hour.length; i++) {
      for (int j = 0; j < minute.length; j++) {
        if (DateTime.now().hour >= int.parse(hour[i]) &&
            DateTime.now().minute >= int.parse(minute[j])) {
          if (i == 5) {
            real = 0;
            setState(() {});
          } else {
            real = i + 1;
            setState(() {});
          }
        }
      }
    }
    print("REAL TIME:" + real.toString());
    setState(() {});
  }
}
