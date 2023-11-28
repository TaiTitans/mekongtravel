import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/dataitems_constants.dart';
import 'package:mekongtravel/core/constants/remote_service.dart';
import 'package:mekongtravel/screens/bonus/items_location.dart';
import '../../core/constants/diadiem.dart';
import '../../core/model/response_model.dart';
class PopularHList extends StatefulWidget {
  const PopularHList({super.key});

  @override
  State<PopularHList> createState() => _PopularHListState();
}
  class _PopularHListState extends State<PopularHList>{
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
  "Bến Ninh Kiều",
    "Bãi Sao",
  "Chùa Dơi",
  "Làng hoa Sa Đéc",
  "Núi Sam",
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
    return Center(
      child: FutureBuilder<List<DiaDiemEach>?>(
        future: futureBuilder,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
                child:Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true, // Để ngăn nó cố định và không cuộn theo
                      physics:
                      NeverScrollableScrollPhysics(), // Để ngăn cuộn của GridView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 14,
                        childAspectRatio: 311 / 100,
                      ),
                      itemCount: HPOPULAR_DATA.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
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
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    HPOPULAR_DATA[index]["image"] ?? '',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.black.withOpacity(0.5),
                                      padding:
                                      EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            HPOPULAR_DATA[index]["name"] ?? '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: ColorPalette.text,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            HPOPULAR_DATA[index]["distance"] ?? '',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: ColorPalette.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.black.withOpacity(0.7),
                                      padding:
                                      EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            HPOPULAR_DATA[index]["star"] ?? '',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
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


