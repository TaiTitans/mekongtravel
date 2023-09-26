import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/dataitems_constants.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

import '../foods_item.dart';

class FoodsColumnList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 174),
      itemCount: HFOODS_DATA.length,
      itemBuilder: (_, index) {
        return GestureDetector(
            onTap: () {
              // Điều hướng đến FoodsItem khi người dùng nhấp vào mục
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FoodsItem(
                    // // Truyền dữ liệu tới màn hình FoodsItem nếu cần
                    // foodData: HFOODS_DATA[index],
                  ),
                ),
              );
            },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  HFOODS_DATA[index]["image"] ?? '',
                  width: 174,
                  height: 108,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                HFOODS_DATA[index]["name"] ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: ColorPalette.text,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: ColorPalette.primaryColor,
                    size: 16,
                  ),
                  Text(
                    HFOODS_DATA[index]["vnd"] ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorPalette.subColorText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
      },
    );
  }
}
