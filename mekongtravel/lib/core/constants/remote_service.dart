import 'package:mekongtravel/core/constants/diadiem.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class RemoteService {
  Future<List<DiaDiemEach>?> getDiaDiem() async {
    var client = http.Client();
    var uri = Uri.parse(popular_width); // Thay đổi đường dẫn API endpoint tương ứng

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
