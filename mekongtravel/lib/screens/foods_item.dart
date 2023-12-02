import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:readmore/readmore.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:mekongtravel/core/constants/diadiem.dart';
import 'package:intl/intl.dart';

class FoodsItem extends StatelessWidget {
  final AmThucEach amThuc;
  final TinhThanh nameTinhThanh;
  const FoodsItem({Key? key, required this.amThuc, required this.nameTinhThanh});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      child: Image.network(
                        amThuc.hinhAnh, // Đường dẫn đến ảnh của bạn
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
                          color: ColorPalette.text,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: ColorPalette.colorText,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 24,
                  //   left: 10,
                  //   child: Container(
                  //     color: Colors.black.withOpacity(0.5),
                  //     child: Text(
                  //       'Lẩu mắm Cần Thơ',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 22,
                  //         color: ColorPalette.text,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 24,
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
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn trái cho cột con
                    children: [
                      Text(
                        amThuc.tenMonAn,
                        style: TextStyle(
                          color: ColorPalette.text,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      SimpleStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: 4,
                        size: 16,
                        spacing: 4,
                      ),
                      SizedBox(height: 8,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa cho hàng con
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: ColorPalette.primaryColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            nameTinhThanh.tenTinhThanh,
                            style: TextStyle(
                              color: ColorPalette.text,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),

                      Padding(padding: EdgeInsets.only(right: 20),
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            // Căn giữa cho hàng con
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.amberAccent,
                                size: 17,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '${NumberFormat.currency(locale: 'vi').format(amThuc.soTien)}',
                                style: TextStyle(
                                  color: ColorPalette.text,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              )

                            ],
                          )

                      ),

                    ],
                  ),

                ),

              ),



              SizedBox(
                height: 30,
              ),
              Container(
                  height: 1,
                  width: 330, // Chiều rộng của khối // Chiều cao 1 pixel
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
                  amThuc.moTa,
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
              SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  //button lets go
                  onTap: ()=> showModalBottomSheet(
                    // enableDrag: false,
                    // isDismissible: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                    ),
                    context: context,
                    builder: (context) => buildSheet(),
                  ),
                  child: Ink(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 150),
                    decoration: BoxDecoration(
                      color: ColorPalette.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Chi tiết',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.text),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),

      ),
    );
  }

  void setState(Null Function() param0) {}
}
Widget buildSheet() => Container(
padding: EdgeInsets.all(16),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Thành phần',style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorPalette.primaryColor,
      ),),
      SizedBox(height: 8,),
      Text('Nước lèo: Được nấu từ mắm cá linh, các loại rau củ như cà tím, đu đủ, bông súng,... và các loại hải sản như tôm, cua, cá,...\nBún: Thường sử dụng bún tươi, bún tàu hoặc bún mắm.\nRau sống: Các loại rau thơm như húng quế, rau răm, ngò rí,...\nGia vị: Ớt, chanh, đường,...',
        style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),),
      SizedBox(height: 8,),
      Text('Quán ăn nổi tiếng',style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorPalette.primaryColor,
      ),),
      SizedBox(height: 8,),
      Text('Lẩu Mắm Dạ Lý: 89 3 Tháng 2, Ninh Kiều, Cần Thơ\nLẩu Mắm Mười Hai: 112/10 Trần Hưng Đạo, Ninh Kiều, Cần Thơ\nLẩu Mắm Hai Bảy: 20/1 Trần Hưng Đạo, Ninh Kiều, Cần Thơ',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    ],
  ),
);
// class MyColumnWithIconAndText extends StatelessWidget {
//   final IconData iconData;
//   final String text1;
//   final String text2;
//
//   MyColumnWithIconAndText({
//     required this.iconData,
//     required this.text1,
//     required this.text2,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius:
//             BorderRadius.circular(8), // Sử dụng hình tròn cho borderRadius
//             color: Color(0xFF263238), // Màu nền của Container
//           ),
//           padding: EdgeInsets.all(
//               8.0), // Khoảng cách từ biểu tượng đến viền Container
//           child: Icon(
//             iconData,
//             size: 30.0,
//             color: Colors.white, // Màu của biểu tượng
//           ),
//         ),
//         SizedBox(height: 8.0),
//         Text(text1,
//             style: TextStyle(
//               fontWeight: FontWeight.w300,
//               fontSize: 13,
//               color: Color(0xFFD6D2D2),
//             )),
//         SizedBox(
//           height: 4,
//         ),
//         Text(text2,
//             style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 14,
//               color: Colors.white,
//             )),
//         SizedBox(
//           height: 4,
//         ),
//       ],
//     );
//   }
// }
