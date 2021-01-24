import 'package:flutter/material.dart';
import 'package:irohasu/src/screens/setting_screen/widget/chapter_page.dart';
import 'package:irohasu/src/screens/setting_screen/widget/general_page.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/setting';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey.shade200,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Cài đặt',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.all(8),
              color: Theme.of(context).buttonColor,
              child: ListTile(
                onTap: () {
                  // TODO
                  print('Test app');
                },
                title: const Text('Khách lạ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                leading: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/default_image.jpeg'),
                ),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(GeneralSetting.routeName);
                    },
                    title: Text(
                      'Cài đặt chung',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.tune),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      // TODO
                      print('Test app');
                    },
                    title: Text(
                      'Thư viện',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.local_library),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      // TODO
                      print('Test app');
                    },
                    title: Text(
                      'Thông tin truyện',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.description),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      // TODO
                      print('Test app');
                    },
                    title: Text(
                      'Tải xuống',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.file_download),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ChapterPageSetting.routeName);
                    },
                    title: Text(
                      'Trang truyện',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: const Icon(Icons.import_contacts),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      // TODO
                      print('Test app');
                    },
                    title: Text(
                      'Thông tin',
                      style: Theme.of(context).textTheme.bodyText1,
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
  const _BuildDivider({
    Key key,
  }) : super(key: key);

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
