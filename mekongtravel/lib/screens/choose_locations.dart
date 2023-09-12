import 'package:flutter/material.dart';
import 'package:mekongtravel/core/constants/color_constants.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:mekongtravel/core/constants/app_colors.dart';

Map<String, List> _elements = {
  'Đồng Bằng Sông Cửu Long': [
    'Cần Thơ',
    'Tiền Giang',
    'Long An',
    'Vĩnh Long',
    'Đồng Tháp',
    'An Giang',
    'Bến Tre',
    'Hậu Giang',
    'Kiêng Giang',
    'Sóc Trăng',
    'Trà Vinh',
    'Cà Mau',
    'Bạc Liêu',
  ],
};

class ChooseLocations extends StatelessWidget {
  const ChooseLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chọn địa điểm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BeVietnamPro',
        scaffoldBackgroundColor: ColorPalette.backgroundColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF263238), // Thay đổi màu
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorPalette.text,
                ),
                onPressed: () {
                  Navigator.pop(context); // Trở về locations_page()
                },
              ),
              SizedBox(width: 16), // Khoảng cách giữa nút và dòng title
              Text(
                'Chọn địa điểm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        body: GroupListView(
          sectionsCount: _elements.keys.toList().length,
          countOfItemInSection: (int section) {
            return _elements.values.toList()[section].length;
          },
          itemBuilder: _itemBuilder,
          groupHeaderBuilder: (BuildContext context, int section) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.location_pin,
                      size: 20,
                    ),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 0.5,
                  ),
                  Text(
                    _elements.keys.toList()[section],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorPalette.primaryColor),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, IndexPath index) {
    String user = _elements.values.toList()[index.section][index.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 8,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
          leading: CircleAvatar(
            child: Text(
              _getInitials(user),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            backgroundColor: _getAvatarColor(user),
          ),
          title: Text(
            _elements.values.toList()[index.section][index.index],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  String _getInitials(String user) {
    var buffer = StringBuffer();
    var split = user.split(" ");
    for (var s in split) buffer.write(s[0]);

    return buffer.toString().substring(0, split.length);
  }

  Color _getAvatarColor(String user) {
    return AppColors
        .avatarColors[user.hashCode % AppColors.avatarColors.length];
  }
}
