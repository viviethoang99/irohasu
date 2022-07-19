part of '../horizontal_screen.dart';

class GrabbingWidget extends StatelessWidget {
  const GrabbingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.format_list_numbered_rounded,
                color: theme.primaryColor,
              ),
              Icon(
                Icons.question_answer_rounded,
                color: theme.primaryColor,
              ),
              Icon(
                Icons.tune_rounded,
                color: theme.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
