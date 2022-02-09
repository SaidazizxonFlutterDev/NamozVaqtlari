import 'package:exam_second/core/components/exporting.dart';
import 'package:exam_second/core/datas/data.dart';
import 'package:exam_second/services/time_service.dart';

class TaqvimPage extends StatefulWidget {
  var timeZone;
  TaqvimPage({Key? key, required this.timeZone}) : super(key: key);

  @override
  _TaqvimPageState createState() => _TaqvimPageState();
}

class _TaqvimPageState extends State<TaqvimPage> {
  List hours = [], minutes = [];

  int realTime = 5;

  @override
  Widget build(BuildContext context) {
    convertToList();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: ConstColors.primary,
        title: Text(
          "Namoz Vaqtlari",
          style: TextStyle(color: ConstColors.textColor),
        ),
      ),
      body: FutureBuilder(
          future: Service.getData(widget.timeZone),
          builder: (context, AsyncSnapshot<Map> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: ConstColors.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Datas.data[realTime] + " - ${Service.datas[realTime]}",
                              style: TextStyle(
                                color: ConstColors.textColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.09,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _myFunc(
                              name1: "Bomdod",
                              name2: "Quyosh",
                              data1: "tong_saharlik",
                              data2: "quyosh",
                              snap: snapshot),
                          _myFunc(
                              name1: "Peshin",
                              name2: "Asr",
                              data1: "peshin",
                              data2: "asr",
                              snap: snapshot),
                          _myFunc(
                              name1: "Shom",
                              name2: "Hufton",
                              data1: "shom_iftor",
                              data2: "hufton",
                              snap: snapshot),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }

  Widget _myFunc({
    required String name1,
    required String name2,
    required String data1,
    required String data2,
    required AsyncSnapshot<Map> snap,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: MyEdgeInsets.symmetric(
            context: context, horizontal: 0.02, vertical: 0.007),
        child: Row(
          children: [
            Expanded(child: _myCard(name: name1, data: data1, snapshot: snap)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Expanded(child: _myCard(name: name2, data: data2, snapshot: snap)),
          ],
        ),
      ),
    );
  }

  Widget _myCard({
    required String name,
    required String data,
    required AsyncSnapshot<Map> snapshot,
  }) {
    return Card(
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$name",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "soat: ",
                style: TextStyle(fontSize: 13),
              ),
              Text(
                "${snapshot.data![data]}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  convertToList() async {
    hours.clear();
    minutes.clear();
    for (var i in Service.datas) {
      hours.add(i.split(":")[0]);
      minutes.add(i.split(":")[1]);
    }
    print(hours);
    print(minutes);
    checker();
  }

  checker() {
    for (int i = 0; i < hours.length; i++) {
      for (int j = 0; j < minutes.length; j++) {
        if (DateTime.now().hour >= int.parse(hours[i]) &&
            DateTime.now().minute >= int.parse(minutes[j])) {
          if (i == 5) {
            realTime = 0;
            setState(() {});
          } else {
            realTime = i + 1;
            setState(() {});
          }
        }
      }
    }
    print("REAL TIME:" + realTime.toString());
    setState(() {});
  }
}
