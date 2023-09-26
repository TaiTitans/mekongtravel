import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
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
                fontSize: 27,
                fontWeight: FontWeight.w500,
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
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 14),
                            child:   ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              child: Image.asset('assets/images/user.png',
                                fit: BoxFit.cover,
                                width: 44,
                                height: 44,
                              ),
                            ),

                          ),
                          SizedBox(width: 24,),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text('User Name', style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: ColorPalette.text,
                                letterSpacing: 0.2
                            ),)
                            ,
                            SizedBox(height: 6,),

                            Text('emailexample@gmail.com', style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: ColorPalette.subColorText,
                                letterSpacing: 0.2
                            ),)
                            ,
                          ],),

                          SizedBox(width: 16,),

                          Container(
                            child: Icon(Icons.arrow_forward_ios,
                              color: ColorPalette.primaryColor,
                              size: 24,
                            ),
                          )

                        ]
                      ),

                ),
              SizedBox(height: 12,),
                Container(
                  height: 76,
                  width: 380,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: ColorPalette.text,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                              Icon(Icons.notifications,
                              size: 22,
                              color: Color(0xFF31507F),),
                            SizedBox(width: 4,),
                            Text('Thông báo',style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: Color(0xFF31507F)
                            ),),
                            SizedBox(width: 4,),
                            Container(
                              child: SwitchExample(),
                            )
                          ],
                        ),


                      ),
                )

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 130),
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