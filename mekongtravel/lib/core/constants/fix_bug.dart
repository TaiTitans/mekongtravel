import 'dart:convert';

import 'package:mekongtravel/core/constants/diadiem.dart';

List<TinhThanh> tinhThanhFromJson(String str) {
  final parsed = json.decode(str).cast<Map<String, dynamic>>();
  return parsed.map<TinhThanh>((json) => TinhThanh.fromJson(json)).toList();
}
