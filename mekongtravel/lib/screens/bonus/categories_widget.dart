import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> itemNames = [
      "Rừng",
      "Núi",
      "Biển",
      "Thành phố",
      "Địa danh",
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: 8), // Khoảng cách 8 cả hai bên
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xFF263238),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                itemNames[0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: ColorPalette.text,
                ),
              )
            ],
          ),
        ),
        for (int i = 1; i < itemNames.length; i++)
          Container(
            margin: EdgeInsets.only(right: 8), // Khoảng cách 8 cả hai bên
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: Color(0xFF263238),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  itemNames[i],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorPalette.text,
                  ),
                )
              ],
            ),
          ),
      ]),
    );
  }
}
