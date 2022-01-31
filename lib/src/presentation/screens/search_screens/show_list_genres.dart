import 'package:flutter/material.dart';

import '../../../config/filter_search.dart';
import '../../../data/model/status_checkbox.dart';
import '../../widgets/custom_checkbox.dart';

class DrawerSearchScreen extends StatefulWidget {
  const DrawerSearchScreen({
    Key? key,
    this.searchAdvanced,
    this.showDrawer,
    this.isShowDrawer,
  }) : super(key: key);

  final Function? searchAdvanced;
  final Function? showDrawer;
  final bool? isShowDrawer;

  @override
  _DrawerSearchScreenState createState() => _DrawerSearchScreenState();
}

class _DrawerSearchScreenState extends State<DrawerSearchScreen> {
  final _controllerAuthor = TextEditingController();
  final listGenres = FilterSearch.listGenresApp;
  final _listAddGenres = <int?>[];
  final _listRemoveGenres = <int?>[];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            widget.showDrawer!();
          },
          child: SizedBox(
            height: 70,
            child: Center(
              child: Text(
                widget.isShowDrawer!
                    ? 'Ẩn tìm kiếm nâng cao'
                    : 'Tìm kiếm nâng cao',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.green,
          thickness: 2,
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          child: Text(
            'Tác giả:',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          textInputAction: TextInputAction.search,
          autocorrect: false,
          controller: _controllerAuthor,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20),
            hintText: 'Nhập tên tác giả.',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
          ),
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Thể loại:',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              children: List.generate(listGenres.length, (index) {
                final item = listGenres.keys.elementAt(index);
                final status = _getStatusCheckBox(listGenres[item]);
                return ListTile(
                  leading: CustomCheckbox(
                    selectedColor: status.color,
                    onClick: () => eventClickCheckBox(listGenres[item]),
                    iconStatus: status.icon,
                  ),
                  title: Text(
                    item,
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OutlineButton(
                onPressed: () {
                  setState(() {
                    _listAddGenres.clear();
                    _listRemoveGenres.clear();
                    _controllerAuthor.clear();
                  });
                },
                textColor: Colors.redAccent,
                highlightedBorderColor: theme.buttonColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: theme.buttonColor,
                      width: 4,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Text(
                  'Xoá tất cả',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OutlineButton(
                onPressed: () {
                  widget.searchAdvanced!(
                    _controllerAuthor.text,
                    _listRemoveGenres.join(','),
                    _listAddGenres.join(','),
                  );
                  widget.showDrawer!();
                },
                textColor: theme.buttonColor,
                highlightedBorderColor: theme.buttonColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: theme.buttonColor,
                        width: 4,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30.0)),
                child: const Text(
                  'Tìm kiếm',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  StatusCheckBox _getStatusCheckBox(int? valueGenres) {
    if (_listAddGenres.contains(valueGenres)) {
      return StatusCheckBox(
        icon: Icons.check,
        color: Theme.of(context).buttonColor,
      );
    }
    if (_listRemoveGenres.contains(valueGenres)) {
      return const StatusCheckBox(
        icon: Icons.clear,
        color: Colors.redAccent,
      );
    }
    return const StatusCheckBox(icon: null, color: null);
  }

  void eventClickCheckBox(int? valueGenres) {
    if (_listAddGenres.contains(valueGenres)) {
      setState(() {
        _listAddGenres.removeWhere((element) => element == valueGenres);
        _listRemoveGenres.add(valueGenres);
      });
    } else if (_listRemoveGenres.contains(valueGenres)) {
      setState(() {
        _listRemoveGenres.removeWhere((element) => element == valueGenres);
      });
    } else {
      setState(() {
        _listAddGenres.add(valueGenres);
      });
    }
  }
}
