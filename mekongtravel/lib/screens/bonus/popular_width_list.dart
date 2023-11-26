
import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/remote_service.dart';
import 'package:mekongtravel/screens/bonus/items_location.dart';
import '../../core/constants/diadiem.dart';
import '../../core/model/response_model.dart';


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
  late Future<List<DiaDiemEach>?> futureBuilder;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureBuilder = getFilteredDiadiems();
  }
  Future<List<DiaDiemEach>?> getFilteredDiadiems() async {
    // Lấy danh sách địa điểm
    List<InfoDetailModel>? diadiems = await RemoteService().getDiaDiem();
    List<String> tenDiaDiemList = [
      "Lặn biển Phú Quốc",
      "Chợ nổi Cái Răng",
      "Ao Bà Om",
      "Núi Sam",
      "Bến Ninh Kiều"
    ];

    if (diadiems != null) {
      isLoaded = true;
      var list = diadiems!.where((diadiem) {
        return tenDiaDiemList.contains(diadiem.tenDiaDiem);
      }).toList();
      filteredDiadiems = [];
      for(var item in list){
        filteredDiadiems?.add(DiaDiemEach(tenDiaDiem: item.tenDiaDiem ?? "",
            moTa: item.moTa ?? "",
            soSao: item.soSao != null ? int.parse(item.soSao.toString()) : 0,
            hinhAnh: item.hinhAnh ?? "",
            tenTinhThanh: item.tenTinhThanh ?? "",
            maTinhThanh: item.maTinh ?? ""
            ));
      }
      print('Filtered Diadiems: $filteredDiadiems');
      return filteredDiadiems;
    } else {
      print('Error fetching diadiems');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {

    List<String> itemNames = [
      "Chợ nổi",
      "Tham quan",
      "Căm trại",
      "Leo núi",
      "Lặn biển",
    ];

    List<String> distance = [
      "200 km away",
      "3 km away",
      "90 km away",
      "80 km away",
      "1.5 km away",
    ];

    List<String> imagePaths = [
      "assets/images/popular/2.jpg",
      "assets/images/popular/5.jpg",
      "assets/images/popular/3.jpg",
      "assets/images/popular/4.jpg",
      "assets/images/popular/1.jpg",
    ];
    return Center(
      child: FutureBuilder<List<DiaDiemEach>?>(
        future: futureBuilder,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(itemNames.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () async {
                        // Create an instance of DiaDiem

                        if (filteredDiadiems != null && filteredDiadiems!.length > index) {
                          TinhThanh tinhThanh = TinhThanh(tenTinhThanh: filteredDiadiems?[index].tenTinhThanh ?? "",
                              maTinh: filteredDiadiems?[index].maTinhThanh ?? "", amThuc: AmThuc(each: []), diaDiem: DiaDiem(each: []));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemLocation(
                                diaDiem: filteredDiadiems![index],
                                nameTinhThanh: tinhThanh,
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorPalette.text,
                                  ),
                                ),
                                Text(
                                  distance[index],
                                  style: const TextStyle(
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
          if(!snapshot.hasData){
            return Text('List empty');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}


