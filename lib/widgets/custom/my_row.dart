import 'package:exam_second/core/components/exporting.dart';

class MyHomePageRow {
  static body(BuildContext context, timezone) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/quron');
              },
              child: myCircleAvatar(context, ConstIcons.quran, "Qur'on"),
            ),
            myCircleAvatar(context, ConstIcons.masjid, "Masjid"),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/qibla');
              },
              child: myCircleAvatar(context, ConstIcons.compass, "Qibla"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myCircleAvatar(context, ConstIcons.radio, "Radio"),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/taqvim', arguments: timezone);
              },
              child: myCircleAvatar(context, ConstIcons.taqvim, "Taqvim"),
            ),
            myCircleAvatar(context, ConstIcons.tv, "Tv"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/names');
              },
              child: myCircleAvatar(context, ConstIcons.names, "Alloh"),
            ),
            myCircleAvatar(context, ConstIcons.duo, "Duolar"),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/tasbeh');
              },
              child: myCircleAvatar(context, ConstIcons.tasbeh, "Tasbeh"),
            ),
          ],
        ),
      ],
    );
  }

  static myCircleAvatar(BuildContext context, String icon, String text) {
    return CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            margin: MyEdgeInsets.only(context: context, top: 0.02),
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
            child: Image.asset(icon),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.04),
          ),
        ],
      ),
    );
  }
}
