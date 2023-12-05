import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/filter_search.dart';
import '../../../../shared/shared.dart';
import '../../../manga.dart';

typedef _Tag = FilterSearch;

class DrawerSearchScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<SearchAdvancedCubit>(
      create: (_) => SearchAdvancedCubit(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () => showDrawer!(),
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  isShowDrawer! ? 'Ẩn tìm kiếm nâng cao' : 'Tìm kiếm nâng cao',
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
            color: Colors.grey,
            thickness: 2,
            height: 5,
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
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextField(
            textInputAction: TextInputAction.search,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Nhập tên tác giả.',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
            ),
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Thể loại:',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _Tag.listGenres.length,
              itemBuilder: (context, index) {
                final name = _Tag.listGenres.keys.elementAt(index);
                final id = _Tag.listGenres.values.elementAt(index);
                final type =
                    context.watch<SearchAdvancedCubit>().getStatusGenres(id);
                return InkWell(
                  onTap: () {
                    context.read<SearchAdvancedCubit>().onTapGenres(type, id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        CheckboxGenres(type: type),
                        const SizedBox(width: 10),
                        Text(
                          name,
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
