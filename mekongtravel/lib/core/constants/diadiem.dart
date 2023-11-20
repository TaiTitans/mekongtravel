// To parse this JSON data, do
//
//     final tinhThanh = tinhThanhFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final tinhThanh = tinhThanhFromJson(jsonString);


List<TinhThanh> tinhThanhFromJson(String str) => List<TinhThanh>.from(json.decode(str).map((x) => TinhThanh.fromJson(x)));

String tinhThanhToJson(List<TinhThanh> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TinhThanh {
    String tenTinhThanh;
    String maTinh;
    AmThuc amThuc;
    DiaDiem diaDiem;

    TinhThanh({
        required this.tenTinhThanh,
        required this.maTinh,
        required this.amThuc,
        required this.diaDiem,
    });

    factory TinhThanh.fromJson(Map<String, dynamic> json) => TinhThanh(
        tenTinhThanh: json["tenTinhThanh"],
        maTinh: json["maTinh"],
        amThuc: AmThuc.fromJson(json["amThuc"]),
        diaDiem: DiaDiem.fromJson(json["diaDiem"]),
    );

    Map<String, dynamic> toJson() => {
        "tenTinhThanh": tenTinhThanh,
        "maTinh": maTinh,
        "amThuc": amThuc.toJson(),
        "diaDiem": diaDiem.toJson(),
    };
}

class AmThuc {
    List<List<AmThucEach>> each;

    AmThuc({
        required this.each,
    });

    factory AmThuc.fromJson(Map<String, dynamic> json) => AmThuc(
        each: List<List<AmThucEach>>.from(json["\u0024each"].map((x) => List<AmThucEach>.from(x.map((x) => AmThucEach.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "\u0024each": List<dynamic>.from(each.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    };
}

class AmThucEach {
    String tenMonAn;
    String moTa;
    int soTien;
    String hinhAnh;

    AmThucEach({
        required this.tenMonAn,
        required this.moTa,
        required this.soTien,
        required this.hinhAnh,
    });

    factory AmThucEach.fromJson(Map<String, dynamic> json) => AmThucEach(
        tenMonAn: json["tenMonAn"],
        moTa: json["moTa"],
        soTien: json["soTien"],
        hinhAnh: json["hinhAnh"],
    );

    Map<String, dynamic> toJson() => {
        "tenMonAn": tenMonAn,
        "moTa": moTa,
        "soTien": soTien,
        "hinhAnh": hinhAnh,
    };
}

class DiaDiem {
    List<List<DiaDiemEach>> each;

    DiaDiem({
        required this.each,
    });

    factory DiaDiem.fromJson(Map<String, dynamic> json) => DiaDiem(
        each: List<List<DiaDiemEach>>.from(json["\u0024each"].map((x) => List<DiaDiemEach>.from(x.map((x) => DiaDiemEach.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "\u0024each": List<dynamic>.from(each.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    };
}

class DiaDiemEach {
    String tenDiaDiem;
    String moTa;
    int soSao;
    String hinhAnh;

    DiaDiemEach({
        required this.tenDiaDiem,
        required this.moTa,
        required this.soSao,
        required this.hinhAnh,
    });

    factory DiaDiemEach.fromJson(Map<String, dynamic> json) => DiaDiemEach(
        tenDiaDiem: json["tenDiaDiem"],
        moTa: json["moTa"],
        soSao: json["soSao"],
        hinhAnh: json["hinhAnh"],
    );

    Map<String, dynamic> toJson() => {
        "tenDiaDiem": tenDiaDiem,
        "moTa": moTa,
        "soSao": soSao,
        "hinhAnh": hinhAnh,
    };
}
