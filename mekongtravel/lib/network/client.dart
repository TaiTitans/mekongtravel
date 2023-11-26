import 'package:http/http.dart' as http;

class Client{
  Future<void> getDuLieu() async{
    var url = "http://localhost:3000/api/tinhthanh";
    var response = await http.get(url as Uri);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }
}