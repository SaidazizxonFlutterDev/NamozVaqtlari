import 'package:exam_second/core/components/exporting.dart';

class SelectZonePage extends StatefulWidget {
  const SelectZonePage({Key? key}) : super(key: key);

  @override
  _SelectZonePageState createState() => _SelectZonePageState();
}

class _SelectZonePageState extends State<SelectZonePage> {
  String _dropDownMenuValue = AllRegions.regions[0];

  @override
  Widget build(BuildContext context) {
    updateHive();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInDown(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: MyEdgeInsets.only(
                          context: context, top: 0.15, bottom: 0.03),
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.asset(
                        ConstIcons.location,
                        color: ConstColors.lightPrimary,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Namoz vaqtlarini hisoblash uchun mintaqani aniqlash lozim",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: MyEdgeInsets.symmetric(
                      context: context, horizontal: 0.04, vertical: 0.02),
                  child: Column(
                    children: [
                      DropdownButton(
                          isExpanded: true,
                          value: _dropDownMenuValue,
                          items: AllRegions.regions
                              .map((items) => DropdownMenuItem(
                                    child: Text(items),
                                    value: items,
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _dropDownMenuValue = newValue.toString();
                              ServiceHiveSelectedZone.editBox(
                                  _dropDownMenuValue);
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FadeInUp(
            child: Padding(
              padding: MyEdgeInsets.all(context, 0.07),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/home' ,arguments: _dropDownMenuValue);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false, arguments: _dropDownMenuValue);
                },
                child: const Text("Mintaqani aniqlash"),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  updateHive() {
    debugPrint(_dropDownMenuValue);
    ServiceHiveSelectedZone.editBox(_dropDownMenuValue);
    debugPrint(ServiceHiveSelectedZone.selectedZoneBox.values.toString());
  }
}
