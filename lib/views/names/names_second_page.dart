import 'package:exam_second/core/components/exporting.dart';

class NamesSecond extends StatefulWidget {
  var data;
  NamesSecond({Key? key, required this.data}) : super(key: key);

  @override
  State<NamesSecond> createState() => _NamesSecondState();
}

class _NamesSecondState extends State<NamesSecond> {
  double fontsize = 15.0;
  Map datas = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.primary,
        title: Text(
          datas['oqilishi'].toString(),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              if (fontsize == 20.0) {
                fontsize = MediaQuery.of(context).size.width * 0.05;
                setState(() {});
              } else if (fontsize == MediaQuery.of(context).size.width * 0.05) {
                fontsize = MediaQuery.of(context).size.width * 0.08;
                setState(() {});
              } else {
                fontsize = 20.0;
                setState(() {});
              }
            },
            icon: const Icon(
              Icons.font_download_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: MyEdgeInsets.all(context, 0.04),
                child: Text(
                  datas['arabcha'],
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.2),
                ),
              ),
            ],
          ),
          Text(
            datas['tarjimasi'].toString(),
            style: TextStyle(fontSize: fontsize),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
