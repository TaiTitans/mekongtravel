import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/screens/sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:mekongtravel/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/config.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key, String? token});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignIn> {
  bool _isNotValidate = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        var regBody = {
          "email": emailController.text,
          "password": passwordController.text
        };
        var response = await http.post(
          Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );

        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status']) {
          var myToken = jsonResponse['token'];
          prefs.setString('token', myToken);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen(token: myToken)),
          );
        } else {
          setState(() {
            _isNotValidate = true;
          });
        }
      } catch (error) {
        // Xử lý khi có lỗi xảy ra trong quá trình gửi yêu cầu HTTP
        print("Có lỗi xảy ra: $error");
        setState(() {
          _isNotValidate = true;
        });
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg_signin_signup.jpg"),
            fit: BoxFit.cover, //full screen
            opacity: 0.7,
          )),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Mekong Travel',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: ColorPalette.text,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Ứng dụng du lịch',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: ColorPalette.secondText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/MekongTravelLogo.png',
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: 380,
                      decoration: BoxDecoration(
                        color: ColorPalette.text,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          errorText: _isNotValidate ? "Vui lòng kiểm tra lại thông tin đăng nhập" : null,
                          labelText: 'Email',
                          prefixIcon: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 15,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorPalette.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Input Email

                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: 380,
                      decoration: BoxDecoration(
                        color: ColorPalette.text,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText: _isNotValidate ? "Vui lòng kiểm tra lại thông tin đăng nhập" : null,
                          labelText: 'Mật khẩu',
                          prefixIcon: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 15,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorPalette.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(8), // Màu xanh
                            ),
                            child: Icon(
                              Icons.password, // Đổi thành biểu tượng mong muốn
                              color: Colors.white, // Màu của biểu tượng
                              size: 20, // Kích thước của biểu tượng
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Input Password

                    SizedBox(height: 20),

                    // Nút Xác nhận đăng ký

                    Container(
                      alignment: Alignment.center,
                      child:ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(ColorPalette.primaryColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(200, 50)),
                        ),
                        onPressed: () {
                          setState(() {
                            _isNotValidate = false; // Đặt lại trạng thái lỗi về false
                          });

                          loginUser();
                        },
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                setState(() {
                                  _isNotValidate = false; // Đặt lại trạng thái lỗi về false
                                });

                                return SignUp();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Chưa có tài khoản? Đăng ký',
                          style: TextStyle(
                            color: Colors.white, // Customize the text color
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ))
      ],
    ));
  }
}
