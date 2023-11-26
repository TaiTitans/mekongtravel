import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/remote_service.dart';
import 'package:mekongtravel/core/model/response_model.dart';

import '../core/constants/color_constants.dart';
import '../core/constants/diadiem.dart';
import 'bonus/items_location.dart';

class LocationItemList extends StatefulWidget {
  @required String val;
  LocationItemList({Key? key, required this.val}) : super(key: key);
  @override
  State<LocationItemList> createState() => _LocationItemListState();
}

class _LocationItemListState extends State<LocationItemList>{

  Future<List<InfoDetailModel>?> getListByNameProvince() async {
    List<InfoDetailModel>? diadiems = await RemoteService().getDiaDiem();
    if (diadiems != null) {
      var list = diadiems!.where((item) => (item.tenTinhThanh ?? "").contains(widget.val) ).toList();
      return list;
    } else {
      print('Error fetching diadiems');
      return null;
    }
  }
  Future<List<InfoDetailModel>?>? future;

  @override
  void initState(){
    super.initState();
    future = getListByNameProvince();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF263238),
          title: Row(
            children:[// Khoảng cách giữa nút và dòng title
              Text(
                'Danh sách địa điểm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<InfoDetailModel>?>(
          future: future,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Padding(
               padding: const EdgeInsets.only(
                 top: 10
               ),
                child: ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index){
                      return LocationItemCard(item: snapshot.data![index]);
                    }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }


}

class LocationItemCard extends StatelessWidget{

  @required InfoDetailModel item;

  LocationItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        TinhThanh tinhThanh = TinhThanh(tenTinhThanh: item.tenTinhThanh ?? "",
            maTinh: item.maTinh ?? "", amThuc: AmThuc(each: []), diaDiem: DiaDiem(each: []));

        DiaDiemEach diaDiemEach  = DiaDiemEach(tenDiaDiem: item.tenDiaDiem ?? "", moTa: item.moTa ?? "", soSao:item.soSao != null ? int.parse(item.soSao.toString()) : 0, hinhAnh: item.hinhAnh ?? "");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemLocation(
              diaDiem: diaDiemEach,
              nameTinhThanh: tinhThanh,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.25,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Đặt BorderRadius cho hình ảnh
                      child: Image.network(
                        item.hinhAnh ?? "",
                        fit: BoxFit.cover,
                      ),
                  ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Column(
                      children: [
                       Row(
                         children: [
                           Expanded(child: Text('${item.tenDiaDiem != null ? (item.tenDiaDiem ?? "") : ""}', style: TextStyle(
                             fontWeight: FontWeight.w600,
                             fontSize: 15,
                             color: ColorPalette.backgroundColor
                           ),)),
                         ],
                       ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(child: Text('Đánh giá: ', style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13
                            ),), ),
                            Container(child: Text('${item.soSao ?? 0} ', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13
                            ),)),
                            Container(child: Icon(
                              Icons.star,
                              color: Colors.deepOrangeAccent,
                              size: 16,
                            ))

                          ],
                        ),
                        // Expanded(child: Text('Tên địa điểm + ${item.tenDiaDiem ?? ""}')),
                        // const SizedBox(height: 10),
                        // Expanded(child: Text('Số sao: + ${item.soSao ?? 0}'))
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ),
      ),
    );
  }

}