import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/button.dart';
import '../../../../../base/spacing.dart';
import '../../../../../base/text.dart';
import '../../../../../config/config.dart';
import '../../../../features.dart';

class GeneralSetting extends StatelessWidget {
  const GeneralSetting({super.key});

  static const routeName = '/setting/generaSetting';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        title: IrohaText.bold(
          'Cài đặt chung',
          fontSize: FontSizes.s20,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            BlocSelector<AppearanceCubit, AppearanceState, ThemeMode>(
              selector: (state) => state.themeMode,
              builder: (context, state) {
                return ListTile(
                  onTap: () => _showDialogChangeTheme(context),
                  title: IrohaText.regular(
                    'Màu nền',
                    fontSize: FontSizes.s16,
                  ),
                  subtitle: IrohaText.bold(
                    state.themeModeLabelText(),
                    fontSize: FontSizes.s16,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogChangeTheme(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<AppearanceCubit>(),
          child: const AlertDialog(
            content: ThemeModeSetting(),
          ),
        );
      },
    );
  }
}

class ThemeModeSetting extends StatelessWidget {
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IrohaText.bold(
          'Theme',
          fontSize: FontSizes.s20,
        ),
        const VSpace(10),
        const _ItemWidget(theme: ThemeMode.light),
        const _ItemWidget(theme: ThemeMode.dark),
        const _ItemWidget(theme: ThemeMode.system),
      ],
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.theme,
  });

  final ThemeMode theme;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppearanceCubit, AppearanceState, ThemeMode>(
      selector: (state) => state.themeMode,
      builder: (context, currentThemeMode) {
        return SizedBox(
          height: 35,
          child: IrohaButton(
            text: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IrohaText.medium(
                theme.themeModeLabelText(),
                color: theme == currentThemeMode ? Colors.green : null,
                fontSize: FontSizes.s16,
              ),
            ),
            rightIcon: theme == currentThemeMode
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : null,
            onTap: () {
              if (currentThemeMode != theme) {
                context.read<AppearanceCubit>().setThemeMode(theme);
                Navigator.of(context).pop();
              }
            },
          ),
        );
      },
    );
  }
}

extension ThemeModeX on ThemeMode {
  String themeModeLabelText() {
    switch (this) {
      case (ThemeMode.light):
        return 'Sáng';
      case (ThemeMode.dark):
        return 'Tối';
      case (ThemeMode.system):
        return 'Theo hệ thống';
      default:
        return 'Sáng';
    }
  }
}
