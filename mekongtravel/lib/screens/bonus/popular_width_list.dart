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
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
getData() async {
  diadiems = await RemoteService().getDiaDiem();
  if(diadiems != null && diadiems!.length >= 5){
    setState(() {
      isLoaded = true;
    });
  }
}


  @override
  Widget build(BuildContext context) {
      List<String> tenDiaDiemList = [
      "Lặn biển Phú Quốc",
      "Chợ nổi Cái Răng",
      "Ao Bà Om",
      "Núi Sam",
      "Bến Ninh Kiều"
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

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemLocation(diaDiem: diadiems![index]),
                  ),
                );
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


