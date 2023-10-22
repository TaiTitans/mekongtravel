import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/screens/sign_in.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: Container(
                      //     width: 42,
                      //     height: 42,
                      //     padding: EdgeInsets.all(8),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         color: ColorPalette.text),
                      //     child: Icon(
                      //       Icons.arrow_back_ios_new,
                      //       color: ColorPalette.primaryColor,
                      //       size: 20,
                      //     ),
                      //   ),
                      // ),
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
                          'Đăng ký tài khoản',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Input Username
                      Container(
                        height: 60,
                        width: 380,
                        decoration: BoxDecoration(
                          color: ColorPalette.text,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Tên người dùng',
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
                                Icons.person, // Đổi thành biểu tượng mong muốn
                                color: Colors.white, // Màu của biểu tượng
                                size: 20, // Kích thước của biểu tượng
                              ),
                            ),
                          ),
                        ),
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
                          decoration: InputDecoration(
                            labelText: 'Email',
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
                                Icons.email, // Đổi thành biểu tượng mong muốn
                                color: Colors.white, // Màu của biểu tượng
                                size: 20, // Kích thước của biểu tượng
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
                                Icons
                                    .password, // Đổi thành biểu tượng mong muốn
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
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorPalette
                                    .primaryColor), // Đổi màu nền tại đây
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    26), // Đặt giá trị cho `borderRadius` tại đây
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(Size(200,
                                50)), // Điều chỉnh kích thước của nút ở đây
                          ),
                          onPressed: () {},
                          child: Text('Đăng ký'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          },
                          child: Text(
                            'Đã có tài khoản? Đăng nhập',
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
          ),
        )
      ],
    ));
  }
}
