import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:mekongtravel/core/constants/dataitems_constants.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:mekongtravel/core/constants/remote_service.dart';
import '../../core/constants/diadiem.dart';
import '../../core/model/response_model.dart';
import '../foods_item.dart';

class FoodsColumnList extends StatefulWidget {
  const FoodsColumnList({super.key});

  @override
  State<FoodsColumnList> createState() => _FoodsColumnListState();
}

class _FoodsColumnListState extends State<FoodsColumnList> {
  List<AmThucEach>? popularCuisineList;
  List<TinhThanh>? tinhThanhList;
  List<AmThucEach>? filteredAmthucs;
  var isLoaded = false;
  late Future<List<AmThucEach>?> futureBuilder;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureBuilder = getFilteredAmthucs();
  }

  Future<List<AmThucEach>?> getFilteredAmthucs() async {
    List<InfoDetailModel>? amthucs = await RemoteService().getAmThuc();
    // List<String> tenAmThucList = [
    //   "Lẩu mắm",
    //   "Hàu nướng mỡ hành",
    //   "Bánh pía",
    //   "Lẩu bông điên điển",
    //   "Xôi bắp",
    //   "Cua đá rang muối",
    // ];

    if (amthucs != null) {
      isLoaded = true;
      // var list = amthucs!.where((amthuc) {
      //   return tenAmThucList.contains(amthuc.tenMonAn);
      // }).toList();
      filteredAmthucs = [];
      for (var item in amthucs) {
        filteredAmthucs?.add(AmThucEach(
          tenMonAn: item.tenMonAn ?? "",
          moTa: item.moTa ?? "",
          soTien: item.soTien != null ? int.parse(item.soTien.toString()) : 0,
          hinhAnh: item.hinhAnh ?? "",
          tenTinhThanh: item.tenTinhThanh ?? "",
          maTinhThanh: item.maTinh ?? "",
        ));
      }

     // popularCuisineList = filteredAmthucs?.ma;

      var setListProvince = Set<String?>();
      if(filteredAmthucs != null && ( filteredAmthucs?.length ?? 0 )> 0){
        setListProvince = filteredAmthucs!.where((e) => setListProvince.add(e.maTinhThanh ?? "")).map((e) => e.maTinhThanh).toSet();
      }

      List<AmThucEach> list = [];

      if( setListProvince != null && setListProvince.isNotEmpty){
        for(var e in setListProvince.toList()){
          var item = filteredAmthucs?.firstWhere((obj) => obj.maTinhThanh == e);
          list.add(item!);
        }
      }

      print('Filtered Amthucs: $filteredAmthucs');
      return list.skip(0).take(list.length > 6 ? 6 : list.length).toList();
    } else {
      print('Error fetching amthucs');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<AmThucEach>?>(
        future: futureBuilder,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 174),
              itemCount: (snapshot.data ?? []).length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () async {
                      if (snapshot.data != null && snapshot.data!.length > index) {
                        TinhThanh tinhThanh = TinhThanh(
                            tenTinhThanh:
                            snapshot.data?[index].tenTinhThanh ?? "",
                            maTinh: snapshot.data?[index].maTinhThanh ?? "",
                            amThuc: AmThuc(each: []),
                            diaDiem: DiaDiem(each: []));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodsItem(
                              amThuc: snapshot.data![index],
                              nameTinhThanh: tinhThanh,
                            ),
                          ),
                        );
                      } else {
                        // Xử lý trường hợp không có đủ phần tử trong danh sách
                      }
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              snapshot.data![index].hinhAnh?? '',
                              width: 174,
                              height: 108,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${snapshot.data![index].tenMonAn ?? ''}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ColorPalette.text,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.attach_money,
                                color: ColorPalette.primaryColor,
                                size: 16,
                              ),
                              Text(
                                "${NumberFormat.currency(locale: 'vi').format(snapshot.data![index].soTien ?? 0)}",
                                style: const TextStyle(
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
          if (!snapshot.hasData) {
            return const  Text('List empty');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
