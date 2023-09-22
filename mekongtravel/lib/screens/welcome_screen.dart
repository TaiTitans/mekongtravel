import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/screens/home_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover, //full screen
          opacity: 0.7,
        )),
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mekong",
                      style: TextStyle(
                        color: ColorPalette.text,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        decoration: TextDecoration.none,
                        fontFamily: 'BeVietnamPro',
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Travel App',
                      style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400,
                        color: ColorPalette.text.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Khám phá miền Tây sông nước hùng vĩ với những chuyến đi thú vị.Với sự trợ giúp của Mekong Travel sẽ khiến chuyến đi của bạn trở nên dễ dàng và thú vị hơn.Vi vu thôi ...',
                      style: TextStyle(
                        color: ColorPalette.subColorText,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        //button lets go
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        },
                        child: Ink(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 150),
                          decoration: BoxDecoration(
                            color: ColorPalette.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Bắt đầu',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorPalette.text),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
