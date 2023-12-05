import 'package:flutter/material.dart';

import '../../../../base/text.dart';
import '../../../../config/constants/constant.dart';
import 'widget/general_page.dart';
import 'widget/info_screen.dart';
import 'widget/setting_chapter.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const IrohaText.bold('Cài đặt'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(8).copyWith(top: 15),
              color: theme.cardColor,
              child: ListTile(
                onTap: null, // TO DO
                title: IrohaText.bold(
                  'Khách lạ',
                  fontSize: FontSizes.s20,
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/default_image.jpeg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: theme.cardColor,
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
                    title: IrohaText.regular(
                      'Cài đặt chung',
                      fontSize: FontSizes.s16,
                    ),
                    leading: Icon(
                      Icons.tune,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        SettingChapter.routeName,
                      );
                    },
                    title: IrohaText.regular(
                      'Thiết lập đọc truyện',
                      fontSize: FontSizes.s16,
                    ),
                    leading: Icon(
                      Icons.description,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                  const _BuildDivider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(InfoScreen.routeName);
                    },
                    title: IrohaText.regular(
                      'Thông tin',
                      fontSize: FontSizes.s16,
                    ),
                    leading: Icon(
                      Icons.info,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
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
  const _BuildDivider();

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
