
class TimeModel {
    TimeModel({
        this.month,
        this.day,
        this.times,
        this.region,
        this.date,
        this.weekday,
    });

    int? month;
    int? day;
    Times? times;
    String? region;
    DateTime? date;
    String? weekday;

    factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        month: json["month"],
        day: json["day"],
        times: Times.fromJson(json["times"]),
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"] == null ? null : json["weekday"],
    );
}

class Times {
    Times({
        this.tongSaharlik,
        this.quyosh,
        this.peshin,
        this.asr,
        this.shomIftor,
        this.hufton,
    });

    String? tongSaharlik;
    String? quyosh;
    String? peshin;
    String? asr;
    String? shomIftor;
    String? hufton;

    factory Times.fromJson(Map<String, dynamic> json) => Times(
        tongSaharlik: json["tong_saharlik"],
        quyosh: json["quyosh"],
        peshin: json["peshin"],
        asr: json["asr"],
        shomIftor: json["shom_iftor"],
        hufton: json["hufton"],
    );
}
