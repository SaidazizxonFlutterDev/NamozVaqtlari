import 'package:exam_second/core/components/exporting.dart';

class NamesPage extends StatelessWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: ConstColors.primary),
        backgroundColor: ConstColors.primary,
        title: Text(
          "Asmoul husno",
          style: TextStyle(
            color: ConstColors.textColor,
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            String name = ismlar[index]['oqilishi'];
            String meaning = ismlar[index]['tarjimasi'];
            String arabicName = ismlar[index]['arabcha'];
            return ListTile(
              leading: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                alignment: Alignment.center,
                child: Text("${index + 1}."),
              ),
              title: Text(name),
              subtitle: Text(
                meaning,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                arabicName,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/namesSecond', arguments: ismlar[index]);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: ismlar.length),
    );
  }
}
