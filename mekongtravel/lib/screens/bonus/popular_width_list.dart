import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/remote_service.dart';
import 'package:mekongtravel/screens/bonus/items_location.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/diadiem.dart';


class PopularWList extends StatefulWidget {
  const PopularWList({super.key});

  @override
  State<PopularWList> createState() => _PopularWListState();
}

class _PopularWListState extends State<PopularWList> {
  List<DiaDiemEach>? diadiems;
  List<TinhThanh>? tinhThanhList;
  List<DiaDiemEach>? filteredDiadiems;
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
     getFilteredDiadiems();
  }
   void getFilteredDiadiems() async {
    // Lấy danh sách địa điểm
    List<DiaDiemEach>? diadiems = await RemoteService().getDiaDiem();
  
    // Danh sách các địa điểm bạn muốn hiển thị
    List<String> tenDiaDiemList = [
      "Cồn Sơn Hậu Giang",
      "Chùa Hang",
      "Hòn Đá Bạc",
      "Nhà công tử Bạc Liêu",
      "Vườn cây Bưởi Mỏ Cày"
    ];

    // Lọc danh sách địa điểm dựa trên tenDiaDiemList
  tinhThanhList = await RemoteService().getTinhThanhList(); 

  if (diadiems != null) {
    setState(() {
      filteredDiadiems = diadiems.where((diadiem) {
        return tenDiaDiemList.contains(diadiem.tenDiaDiem);
      }).toList();
      isLoaded = true;

      // In giá trị filteredDiadiems ra console log
      print('Filtered Diadiems: $filteredDiadiems');

      // In giá trị tinhThanhList ra console log
      print('Tinh Thanh List: $tinhThanhList');
    });
  }
  }


  @override
  Widget build(BuildContext context) {
      List<String> tenTTList = [
      "Kiên Giang",
      "Cần Thơ",
      "Trà Vinh",
      "An Giang",
      "Cần Thơ"
    ];
    List<String> itemNames = [
      "Lặn biển",
      "Chợ nổi",
      "Căm trại",
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
if (!isLoaded) {
    return CircularProgressIndicator();
  } else {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(itemNames.length, (index) {
          return Container(
            margin: EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () async {
                // Create an instance of DiaDiem


  
  if (filteredDiadiems != null &&
    tinhThanhList != null &&
    filteredDiadiems!.length > index &&
    tinhThanhList!.length > index) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ItemLocation(
        diaDiem: filteredDiadiems![index],
        NameTinhThanh: tinhThanhList![index],
      ),
    ),
  );
} else {
  // Xử lý trường hợp không có đủ phần tử trong danh sách
}
  // Handle the case where diadiems or tinhThanhList is null or doesn't have data at the specified index
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8), // Đặt BorderRadius ở đây
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          8), // Đặt BorderRadius cho ảnh cắt
                      child: Image.asset(
                        imagePaths[index],
                        width: 124,
                        height: 178,
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
            ),
          );
        }),
      ),
    );
  }
  }
}


