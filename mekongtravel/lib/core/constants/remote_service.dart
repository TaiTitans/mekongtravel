import 'dart:convert' as convert;
import 'dart:convert';

import 'package:mekongtravel/core/constants/diadiem.dart';
import 'package:http/http.dart' as http;
import 'package:mekongtravel/core/model/response_model.dart';
import 'config.dart';
class RemoteService {
String getTenTinhThanhFromDiaDiem(DiaDiemEach diaDiem, List<TinhThanh> tinhThanhList) {
  // Tạo một Map ánh xạ tenDiaDiem với tenTinhThanh
  Map<String, String> diaDiemMap = {};

  // Lặp qua danh sách TinhThanh để tạo ánh xạ
  tinhThanhList.forEach((tinhThanh) {
    tinhThanh.diaDiem.each.forEach((eachList) {
      eachList.forEach((item) {
        // Ánh xạ tenDiaDiem với tenTinhThanh
        diaDiemMap[item.tenDiaDiem] = tinhThanh.tenTinhThanh;
      });
    });
  });

  // Trả về tenTinhThanh tương ứng với tenDiaDiem từ Map
  return diaDiemMap[diaDiem.tenDiaDiem] ?? ''; // Trả về giá trị mặc định nếu không tìm thấy
}



Future<List<TinhThanh>> getTinhThanhList() async {
  var client = http.Client();
  var uri = Uri.parse('https://res.cloudinary.com/duwzchnsp/raw/upload/v1700995016/c6yspvpegi76jdns7ybv.json'); // Replace with your API endpoint

  try {
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      List<TinhThanh> tinhThanhList = tinhThanhFromJson(json);

      return tinhThanhList;
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }

  return []; // Handle other error cases if needed
}
  Future<List<InfoDetailModel>?> getDiaDiem() async {
    var client = http.Client();
    var uri = Uri.parse('https://res.cloudinary.com/duwzchnsp/raw/upload/v1700995016/c6yspvpegi76jdns7ybv.json'); // Thay đổi đường dẫn API endpoint tương ứng

    try {
      var customHeaders = {
        'content-type': 'application/json;charset=utf-8'
        // other headers
      };
      var response = await client.get(uri, headers: customHeaders);

      if (response.statusCode == 200) {
        var json = convert.jsonDecode(utf8.decode(response.bodyBytes));
      //  var json = response.body;
        // List<TinhThanh> tinhThanhList = tinhThanhFromJson(json);
        List<TinhThanh> tinhThanhList =  [];

        List<ResponseModel> list = [];
        for(Map<String, dynamic> item in json){
          list.add(ResponseModel.fromJsonDynamic(item));
        }

       // Trích xuất danh sách DiaDiemEach từ danh sách TinhThanh
        List<InfoDetailModel> diaDiemList = [];

        for(var item in list){
          var lisTemp = item.addressModel?.eachResponseModel?.data ?? [];
          if(lisTemp != null && lisTemp.length > 0){
            for(var model in lisTemp){
              var obj = InfoDetailModel(
                hinhAnh: model?.hinhAnh ?? "",
                moTa: model.moTa ?? "",
                soSao: model.soSao ?? 0,
                tenDiaDiem: model.tenDiaDiem ?? "",
                tenMonAn: model.tenMonAn ?? "",
                soTien: model.soTien ?? 0,
                maTinh: item.maTinh ?? "",
                tenTinhThanh: item.tenTinhThanh ?? "",
              );
              diaDiemList.add(obj);
            }
          }
        }
        return diaDiemList;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }

    // Xử lý trường hợp lỗi hoặc không có dữ liệu
    return null;
  }
Future<List<InfoDetailModel>?> getAmThuc() async {
  var client = http.Client();
  var uri = Uri.parse('https://res.cloudinary.com/duwzchnsp/raw/upload/v1700995016/c6yspvpegi76jdns7ybv.json'); // Thay đổi đường dẫn API endpoint tương ứng

  try {
    var customHeaders = {
      'content-type': 'application/json;charset=utf-8'
      // other headers
    };
    var response = await client.get(uri, headers: customHeaders);

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(utf8.decode(response.bodyBytes));
      //  var json = response.body;
      // List<TinhThanh> tinhThanhList = tinhThanhFromJson(json);
      List<TinhThanh> tinhThanhList =  [];

      List<ResponseModel> list = [];
      for(Map<String, dynamic> item in json){
        list.add(ResponseModel.fromJsonDynamic(item));
      }

      // Trích xuất danh sách DiaDiemEach từ danh sách TinhThanh
      List<InfoDetailModel> amThucList = [];

      for(var item in list){
        var lisTemp = item.cuisineModel?.eachResponseModel?.data ?? [];
        if(lisTemp != null && lisTemp.length > 0){
          for(var model in lisTemp){
            var obj = InfoDetailModel(
              hinhAnh: model?.hinhAnh ?? "",
              moTa: model.moTa ?? "",
              soSao: model.soSao ?? 0,
              tenDiaDiem: model.tenDiaDiem ?? "",
              tenMonAn: model.tenMonAn ?? "",
              soTien: model.soTien ?? 0,
              maTinh: item.maTinh ?? "",
              tenTinhThanh: item.tenTinhThanh ?? "",
            );
            amThucList.add(obj);
          }
        }
      }
      return amThucList;
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }

  // Xử lý trường hợp lỗi hoặc không có dữ liệu
  return null;
}
}

