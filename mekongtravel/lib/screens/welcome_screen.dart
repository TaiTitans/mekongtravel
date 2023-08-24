import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/screens/home_page.dart';

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
                      textAlign: TextAlign.justify,
                      "Khám phá miền Tây sông nước hùng vĩ với những chuyến đi thú vị.Với sự trợ giúp của Mekong Travel sẽ khiến chuyến đi của bạn trở nên dễ dàng và thú vị hơn.Vi vu thôi ...",
                      style: TextStyle(
                        color: ColorPalette.secondText.withOpacity(0.7),
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      //button lets go
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: Ink(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorPalette.text,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 20,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
