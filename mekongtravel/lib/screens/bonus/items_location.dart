
import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/diadiem.dart';
import 'package:readmore/readmore.dart';

import '../foods_page.dart';

class ItemLocation extends StatelessWidget {
  final DiaDiemEach diaDiem;
  final TinhThanh nameTinhThanh;
  const ItemLocation({ Key? key, required this.diaDiem, required this.nameTinhThanh});
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 375, // Bỏ chiều rộng cố định
                  height: 361, // Căn giữa ảnh
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.network(
                      diaDiem.hinhAnh, // Đường dẫn đến ảnh của bạn
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
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0x4DFFFFFF),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorPalette.text,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 10,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      diaDiem.tenDiaDiem,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: ColorPalette.text,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  right: 10,
                  child: Container(
                    // color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: const Row(
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
            const SizedBox(
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
                    text2: diaDiem.soSao.toString(),
                  ),
                  MyColumnWithIconAndText(
                    iconData: Icons.location_on,
                    text1: 'Tỉnh',
                    text2: nameTinhThanh.tenTinhThanh,
                  ),
                  const MyColumnWithIconAndText(
                    iconData: Icons.confirmation_number,
                    text1: 'Vé',
                    text2: 'Có',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 1,
                width: 330, // Chiều rộng của khối // Chiều cao 1 pixel
                color: const Color(0xFF263238) // Màu đỏ
                ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20), // Thay đổi khoảng cách bên trái theo nhu cầu
                child: const Text(
                  'Thông tin',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(22, 0, 32, 0),
              child: ReadMoreText(
              diaDiem.moTa,
                trimLines: 4,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color(0xFFD6D2D2),
                  fontSize: 16,
                  // fontWeight: FontWeight.w100,
                  height: 1.5,
                ),
                colorClickableText: ColorPalette.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Xem thêm',
                trimExpandedText: ' Thu gọn',
                moreStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Ink(
                    width: 160,
                    height: 44,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorPalette.primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          color: ColorPalette.primaryColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Bản đồ',
                          style: TextStyle(
                            color: ColorPalette.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FoodsPage(),
                  ),
                );
                  },
                  child: Ink(
                    width: 160,
                    height: 44,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorPalette.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant,
                          color: ColorPalette.elementsColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Ẩm thực',
                          style: TextStyle(
                            color: ColorPalette.elementsColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        )
        
      ),
    );
  }
}

class MyColumnWithIconAndText extends StatelessWidget {
  final IconData iconData;
  final String text1;
  final String text2;

  const MyColumnWithIconAndText({super.key, 
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
            color: const Color(0xFF263238), // Màu nền của Container
          ),
          padding: const EdgeInsets.all(
              8.0), // Khoảng cách từ biểu tượng đến viền Container
          child: Icon(
            iconData,
            size: 30.0,
            color: Colors.white, // Màu của biểu tượng
          ),
        ),
        const SizedBox(height: 8.0),
        Text(text1,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
              color: Color(0xFFD6D2D2),
            )),
        const SizedBox(
          height: 4,
        ),
        Text(text2,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
            )),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
