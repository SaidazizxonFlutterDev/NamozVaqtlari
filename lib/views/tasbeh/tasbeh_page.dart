import 'package:exam_second/core/components/exporting.dart';

class TasbehPage extends StatefulWidget {
  const TasbehPage({Key? key}) : super(key: key);

  @override
  _TasbehPageState createState() => _TasbehPageState();
}

class _TasbehPageState extends State<TasbehPage> {
  // var _controller;
  int _counter = 0;
  int _isTrue = 33;
  int _all = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Column(
        children: [
          Container(
            color: Colors.green.shade700,
            height: MediaQuery.of(context).size.width * 0.5,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Jami: $_all",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      color: ConstColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CircularPercentIndicator(
                    radius: 70.0,
                    backgroundWidth: 5,
                    lineWidth: 5.0,
                    percent: convertToPercent(),
                    center: Text(
                      "$_counter/$_isTrue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                        color: ConstColors.textColor,
                      ),
                    ),
                    backgroundColor: ConstColors.primary,
                    progressColor: Colors.lightGreen.shade300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                if (_isTrue == 33) {
                  _counter++;
                  _all++;
                  setState(() {});
                  if (_counter == 34) {
                    _counter = 1;
                    setState(() {});
                  }
                } else {
                  _counter++;
                  _all++;
                  setState(() {});
                  if (_counter == 100) {
                    _counter = 1;
                    setState(() {});
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.green.shade700,
                    child: CircleAvatar(
                      radius: 76,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 72,
                        backgroundColor: Colors.green.shade700,
                        child: Text(
                          _counter.toString(),
                          style: TextStyle(
                            color: ConstColors.textColor,
                            fontSize: MediaQuery.of(context).size.width * 0.17,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.shade700,
      title: const Text("Tasbeh"),
      elevation: 1,
      actions: [
        InkWell(
          onTap: () {
            if (_isTrue == 33) {
              _isTrue = 99;
              setState(() {});
            } else {
              _isTrue = 33;
              if (_counter > 34) {
                _counter = 0;
              }
              setState(() {});
            }
          },
          child: Container(
            margin: MyEdgeInsets.all(context, 0.01),
            height: MediaQuery.of(context).size.width * 0.08,
            width: MediaQuery.of(context).size.width * 0.08,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(_isTrue.toString()),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _counter = 0;
            _all = 0;
            setState(() {});
          },
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }

  convertToPercent() {
    return _counter / _isTrue;
  }
}
