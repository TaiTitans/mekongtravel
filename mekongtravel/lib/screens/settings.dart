import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/config.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:core';
import 'package:http/http.dart' as http;
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _handleLogout() async {
    try {
      // Gửi yêu cầu đến endpoint `/logout` trên server
      var response = await http.post(
        Uri.parse(logout),
        // Các thông tin yêu cầu (nếu cần)
      );

      // Xử lý phản hồi từ server
      if (response.statusCode == 200) {
      print("Đăng xuất thành công!");
      Navigator.pushReplacementNamed(context, '/login');
      } else {
        print("Đăng xuất thất bại!");
      }
    } catch (error) {
      // Xử lý khi có lỗi xảy ra trong quá trình gửi yêu cầu
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF263238), // Thay đổi màu
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Row(
          children: [
            SizedBox(width: 12), // Khoảng cách giữa nút và dòng title
            Text(
              'Cài đặt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 76,
                  width: 380,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorPalette.text),
                  ),
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 14),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/images/user.png',
                          fit: BoxFit.cover,
                          width: 44,
                          height: 44,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.text,
                              letterSpacing: 0.2),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: ColorPalette.subColorText,
                              letterSpacing: 0.2),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorPalette.primaryColor,
                        size: 24,
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 76,
                  width: 380,
                  decoration: BoxDecoration(
                    color: ColorPalette.text,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 22,
                              color: Color(0xFF31507F),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Thông báo',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: Color(0xFF31507F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              child: SwitchExample(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 76,
                  width: 380,
                  decoration: BoxDecoration(
                    color: ColorPalette.text,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          children: [
                            Icon(
                              Icons.language,
                              size: 22,
                              color: Color(0xFF31507F),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Ngôn ngữ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: Color(0xFF31507F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Text(
                                'VIE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Color(0xFF31507F),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                                child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 22,
                            )),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 76,
                  width: 380,
                  decoration: BoxDecoration(
                    color: ColorPalette.text,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          children: [
                            Icon(
                              Icons.dark_mode,
                              size: 22,
                              color: Color(0xFF31507F),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Dark Mode',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: Color(0xFF31507F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              child: Transform.scale(
                                scale: 0.6,
                                child: RollingSwitch.icon(
                                  onChanged: (bool state) {
                                    print('turned ${(state) ? 'on' : 'off'}');
                                  },
                                  rollingInfoLeft: const RollingIconInfo(
                                    icon: Icons.dark_mode,
                                    text: Text(
                                      'Dark',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorPalette.text),
                                    ),
                                    backgroundColor: Colors.black,
                                  ),
                                  rollingInfoRight: const RollingIconInfo(
                                    icon: Icons.light_mode,
                                    backgroundColor: Colors.orange,
                                    text: Text(
                                      'Day',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 76,
                  width: 380,
                  decoration: BoxDecoration(
                    color: ColorPalette.text,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              size: 22,
                              color: Color(0xFF31507F),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Trợ giúp',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: Color(0xFF31507F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 22,
                            )),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
            InkWell(
              onTap: () {
                _handleLogout(); // Gọi hàm xử lý đăng xuất khi nhấn nút Đăng xuất
              },
            child:  Container(
              height: 76,
              width: 380,
              decoration: BoxDecoration(
                color: ColorPalette.text,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          size: 22,
                          color: Color(0xFF31507F),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Đăng xuất',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                            color: Color(0xFF31507F),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),

                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: Text(
                    'Phiên bản ' + 'v1.0.0',
                    style: TextStyle(
                      color: ColorPalette.text,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light0 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Switch(
            value: light0,
            onChanged: (bool value) {
              setState(() {
                light0 = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
