import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:readmore/readmore.dart';

class ItemLocation extends StatelessWidget {
  const ItemLocation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 375, // Bỏ chiều rộng cố định
                  height: 361, // Căn giữa ảnh
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/images/popular/1.jpg', // Đường dẫn đến ảnh của bạn
                      fit: BoxFit.cover, // Hiển thị ảnh mà không bị bóp méo
                    ),
                  ),
                ),
                Positioned(
                  top: 10, // Điều chỉnh vị trí theo y
                  left: 15, // Điều chỉnh vị trí theo x
                  child: InkWell(
                    onTap: () {
                      // Xử lý khi nhấn vào nút IconButton
                      Navigator.of(context).pop(); // Trở về LocationsPage
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0x4DFFFFFF),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorPalette.text,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 10,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      'Lặn biển Phú Quốc',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: ColorPalette.text,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 10,
                  child: Container(
                    // color: Colors.black.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      children: [
                        // Text(
                        //   '5',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 18,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        // SizedBox(width: 4),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              // Add your other widgets here in the expanded part of the column
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyColumnWithIconAndText(
                    iconData: Icons.star,
                    text1: 'Sao',
                    text2: '5',
                  ),
                  MyColumnWithIconAndText(
                    iconData: Icons.location_on,
                    text1: 'Tỉnh',
                    text2: 'Kiên Giang',
                  ),
                  MyColumnWithIconAndText(
                    iconData: Icons.confirmation_number,
                    text1: 'Vé',
                    text2: 'Có',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 1,
                width: 311, // Chiều rộng của khối // Chiều cao 1 pixel
                color: Color(0xFF263238) // Màu đỏ
                ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(
                    left: 20), // Thay đổi khoảng cách bên trái theo nhu cầu
                child: Text(
                  'Thông tin',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(22, 0, 32, 0),
              child: ReadMoreText(
                'Tại đây, du khách có thể chiêm ngưỡng những rạn san hô đầy màu sắc, những đàn cá bơi lội tung tăng và nhiều loài sinh vật biển quý hiếm khác. Lặn biển ở Phú Quốc là một trải nghiệm thú vị và đáng nhớ.',
                trimLines: 4,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFFD6D2D2),
                  fontSize: 16,
                  // fontWeight: FontWeight.w100,
                  height: 1.5,
                ),
                colorClickableText: ColorPalette.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Xem thêm',
                trimExpandedText: ' Thu gọn',
                moreStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyColumnWithIconAndText extends StatelessWidget {
  final IconData iconData;
  final String text1;
  final String text2;

  MyColumnWithIconAndText({
    required this.iconData,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(8), // Sử dụng hình tròn cho borderRadius
            color: Color(0xFF263238), // Màu nền của Container
          ),
          padding: EdgeInsets.all(
              8.0), // Khoảng cách từ biểu tượng đến viền Container
          child: Icon(
            iconData,
            size: 30.0,
            color: Colors.white, // Màu của biểu tượng
          ),
        ),
        SizedBox(height: 8.0),
        Text(text1,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
              color: Color(0xFFD6D2D2),
            )),
        SizedBox(
          height: 4,
        ),
        Text(text2,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
            )),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
