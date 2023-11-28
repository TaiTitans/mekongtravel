import 'package:json_annotation/json_annotation.dart';

class ResponseModel {
  @JsonKey(name: 'amThuc')
  CuisineOrAddressModel? cuisineModel;
  @JsonKey(name: 'diaDiem')
  CuisineOrAddressModel? addressModel;
  @JsonKey(name: 'maTinh')
  String? maTinh;
  @JsonKey(name: 'tenTinhThanh')
  String? tenTinhThanh;
  ResponseModel(
      {this.addressModel, this.cuisineModel, this.maTinh, this.tenTinhThanh});

  ResponseModel.fromJsonDynamic(Map<String, dynamic> json){
      tenTinhThanh = json['tenTinhThanh'] as String;
      maTinh =  json['maTinh'] as String;
      addressModel = json['diaDiem'] != null ? CuisineOrAddressModel.fromJsonDynamic(json['diaDiem']) : null;
      cuisineModel = json['amThuc'] != null ? CuisineOrAddressModel.fromJsonDynamic(json['amThuc']) : null;
  }
}

class CuisineOrAddressModel {
  @JsonKey(name: '\$each')
  EachResponseModel? eachResponseModel;

  CuisineOrAddressModel({this.eachResponseModel});

  CuisineOrAddressModel.fromJsonDynamic(Map<String, dynamic> json){
   eachResponseModel = json['\$each'] != null ? EachResponseModel.fromJsonDynamic(json['\$each']) : null;
  }

}

@JsonSerializable(explicitToJson: true)
class EachResponseModel{
  List<InfoDetailModel>? data;

  EachResponseModel({this.data});

  factory EachResponseModel.fromJsonDynamic(List<dynamic> json){
    List<InfoDetailModel>? dataLs =  [];
    if(json != null){
      for(var item in json){
        for(var model in item){
          var obj = InfoDetailModel.fromJson(model);
          dataLs.add(obj);
        }
      }

       // json.forEach((item) {
       //   var obj = InfoDetailModel.fromJson(item);
       //   dataLs.add(obj);
       // });
    }
    return EachResponseModel(data: dataLs);
  }
}

class InfoDetailModel {
  @JsonKey(name: 'hinhAnh')
  String? hinhAnh;
  @JsonKey(name: 'moTa')
  String? moTa;
  @JsonKey(name: 'soTien')
  num? soTien;
  @JsonKey(name: 'tenMonAn')
  String? tenMonAn;
  @JsonKey(name: 'soSao')
  num? soSao;
  @JsonKey(name: 'tenDiaDiem')
  String?  tenDiaDiem;
  String? tenTinhThanh;
  String? maTinh;
  InfoDetailModel({this.moTa, this.soTien, this.tenMonAn, this.hinhAnh, this.soSao, this.tenDiaDiem, this.tenTinhThanh, this.maTinh});

   InfoDetailModel.fromJson(Map<String, dynamic> json){
    moTa = json['moTa'] as String?;
    soTien = json['soTien'] as num?;
    tenMonAn = json['tenMonAn'] as String?;
    hinhAnh = json['hinhAnh'] as String?;
    soSao = json['soSao'] as num?;
    tenDiaDiem = json['tenDiaDiem'] as String?;
  }

}
