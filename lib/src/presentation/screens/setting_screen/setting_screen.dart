import 'package:flutter/material.dart';
import '../setting_screen/widget/general_page.dart';
import '../setting_screen/widget/setting_chapter.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 20,
        brightness: Brightness.light,
        backgroundColor: theme.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Cài đặt',
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 8,
                left: 8,
                right: 8,
              ),
              color: theme.buttonColor,
              child: const ListTile(
                onTap: null, // TO DO
                title: Text(
                  'Khách lạ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/default_image.jpeg'),
                ),
                trailing: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 6.0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(GeneralSetting.routeName);
                    },
                    title: Text(
                      'Cài đặt chung',
                      style: theme.textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.tune),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  // const _BuildDivider(),
                  // ListTile(
                  //   onTap: () {
                  //     // TODO
                  //     print('Test app');
                  //   },
                  //   title: Text(
                  //     'Thư viện',
                  //     style: theme.textTheme.bodyText1,
                  //   ),
                  //   leading: const Icon(Icons.local_library),
                  //   trailing: const Icon(Icons.keyboard_arrow_right),
                  // ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        SettingChapter.routeName,
                      );
                    },
                    title: Text(
                      'Thiết lập đọc truyện',
                      style: theme.textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.description),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  // const _BuildDivider(),
                  // ListTile(
                  //   onTap: null, // TO DO
                  //   title: Text(
                  //     'Tải xuống',
                  //     style: theme.textTheme.bodyText1,
                  //   ),
                  //   leading: const Icon(Icons.file_download),
                  //   trailing: const Icon(Icons.keyboard_arrow_right),
                  // ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: null, // TO DO
                    title: Text(
                      'Thông tin',
                      style: theme.textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.info),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BuildDivider extends StatelessWidget {
  const _BuildDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
