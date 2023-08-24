import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';

class PopularHList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> itemNames = [
      "Lặn biển",
      "Chợ nổi",
      "Cắm trại",
      "Leo núi",
      "Tham quan",
    ];

    List<String> distance = [
      "200 km away",
      "3 km away",
      "90 km away",
      "80 km away",
      "1.5 km away",
    ];

    List<String> imagePaths = [
      "assets/images/popular/1.jpg",
      "assets/images/popular/2.jpg",
      "assets/images/popular/3.jpg",
      "assets/images/popular/4.jpg",
      "assets/images/popular/5.jpg",
    ];

    return ListView(
      children: [
        Column(
          children: List.generate(itemNames.length, (index) {
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePaths[index],
                        width: 311,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          itemNames[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorPalette.text,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          distance[index],
                          style: TextStyle(
                            fontSize: 10,
                            color: ColorPalette.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
