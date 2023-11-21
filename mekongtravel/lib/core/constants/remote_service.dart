import 'package:mekongtravel/core/constants/diadiem.dart';
import 'package:http/http.dart' as http;
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
  var uri = Uri.parse('https://res.cloudinary.com/duwzchnsp/raw/upload/v1700505355/samples/rb0hkgen2j59oof7lo1t.json'); // Replace with your API endpoint

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
  Future<List<DiaDiemEach>?> getDiaDiem() async {
    var client = http.Client();
    var uri = Uri.parse('https://res.cloudinary.com/duwzchnsp/raw/upload/v1700505355/samples/rb0hkgen2j59oof7lo1t.json'); // Thay đổi đường dẫn API endpoint tương ứng

    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        List<TinhThanh> tinhThanhList = tinhThanhFromJson(json);
        
        // Trích xuất danh sách DiaDiemEach từ danh sách TinhThanh
        List<DiaDiemEach> diaDiemList = [];
        tinhThanhList.forEach((tinhThanh) {
          tinhThanh.diaDiem.each.forEach((eachList) {
            diaDiemList.addAll(eachList);
          });
        });
        
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
}
