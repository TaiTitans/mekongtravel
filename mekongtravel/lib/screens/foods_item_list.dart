import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mekongtravel/core/constants/remote_service.dart';
import 'package:mekongtravel/core/model/response_model.dart';

import '../core/constants/color_constants.dart';
import '../core/constants/diadiem.dart';
import 'foods_item.dart';

class FoodsItemList extends StatefulWidget {
  @required String val;
  FoodsItemList({Key? key, required this.val}) : super(key: key);
  @override
  State<FoodsItemList> createState() => _FoodsItemListState();
}

class _FoodsItemListState extends State<FoodsItemList>{

  Future<List<InfoDetailModel>?> getListByNameProvince() async {
    List<InfoDetailModel>? amthucs = await RemoteService().getAmThuc();
    if (amthucs != null) {
      var list = amthucs!.where((item) => (item.tenTinhThanh ?? "").contains(widget.val) ).toList();
      return list;
    } else {
      print('Error fetching amthucs');
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
                'Danh sách ẩm thực',
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
                      return FoodItemCard(item: snapshot.data![index]);
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

class FoodItemCard extends StatelessWidget{

  @required InfoDetailModel item;

  FoodItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        TinhThanh tinhThanh = TinhThanh(tenTinhThanh: item.tenTinhThanh ?? "",
            maTinh: item.maTinh ?? "", amThuc: AmThuc(each: []), diaDiem: DiaDiem(each: []));

        AmThucEach amThucEach  = AmThucEach(tenMonAn: item.tenMonAn ?? "", moTa: item.moTa ?? "", soTien:item.soTien != null ? int.parse(item.soTien.toString()) : 0, hinhAnh: item.hinhAnh ?? "");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodsItem(
              amThuc: amThucEach,
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
                            Expanded(child: Text('${item.tenMonAn != null ? (item.tenMonAn ?? "") : ""}', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: ColorPalette.backgroundColor
                            ),)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(child: Text('Giá tiền: ', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13
                            ),), ),
                            Container(child: Text('${NumberFormat.currency(locale: 'vi').format(item.soTien) ?? 0} ', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13
                            ),)),
                            Container(child: Icon(
                              Icons.money,
                              color: Colors.deepOrangeAccent,
                              size: 16,
                            ))

                          ],
                        ),
                        const SizedBox(height:10),
                        Row(
                          children: [
                            Icon(
                              Icons.touch_app,
                              color: ColorPalette.primaryColor,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Nhấn để xem chi tiết",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
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