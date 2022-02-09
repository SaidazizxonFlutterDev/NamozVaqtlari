import 'package:dio/dio.dart';

class Service {
  static List datas = [];
  static Future<Map> getData([timezone]) async {
    int a = DateTime.now().day;
    print(a.toString());
    Response response = await Dio().get(
        'https://namozvaqti.herokuapp.com/api/monthly?region=$timezone&month=2');
    // print(response.data[0]);
    datas.clear();
    for (var i in response.data[a + 1]['times'].values) {
      print(i);
      datas.add(i);
    }
    return response.data[a + 1]['times'];
  }
}
