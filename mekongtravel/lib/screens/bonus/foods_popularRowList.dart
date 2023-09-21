import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';

class FoodsPLocationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> itemNames = [
      "Cần Thơ",
      "An Giang",
      "Hậu Giang",
      "Bạc Liêu",
      "Vĩnh Long",
      "Đồng Tháp",
      "Bến Tre",
      "Tây Ninh",
      "Long An",
      "Cà Mau",
      "Sóc Trăng",
      "Trà Vinh",
      "Kiên Giang"
    ];

    List<String> imagePaths = [
      "assets/images/foods/canthofoods.jpg",
      "assets/images/foods/angiangfoods.jpg",
      "assets/images/foods/haugiangfoods.jpg",
      "assets/images/foods/baclieufoods.jpg",
      "assets/images/foods/vinhlongfoods.jpg",
      "assets/images/foods/dongthapfoods.jpg",
      "assets/images/foods/bentrefoods.png",
      "assets/images/foods/tayninhfoods.png",
      "assets/images/foods/longanfoods.jpg",
      "assets/images/foods/camaufoods.jpg",
      "assets/images/foods/soctrangfoods.png",
      "assets/images/foods/travinhfoods.jpg",
      "assets/images/foods/kiengiangfoods.jpg",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(itemNames.length, (index) {
          return Container(
            margin: EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        imagePaths[index],
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Khoảng cách giữa hình ảnh và văn bản
                  Text(
                    itemNames[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorPalette.text,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
