import 'package:exam_second/core/components/exporting.dart';

class ServiceHiveSelectedZone {
  static late Box<String> selectedZoneBox;

  static openBox() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    selectedZoneBox = await Hive.openBox('selectedzone');
    selectedZoneBox.clear();
  }

  static editBox(String value) {
    selectedZoneBox.clear();
    selectedZoneBox.add(value);
  }
}
