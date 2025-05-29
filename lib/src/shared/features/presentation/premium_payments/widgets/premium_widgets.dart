part of '../page/premium_page.dart';

class _SucessCircleWidget extends StatelessWidget {
  const _SucessCircleWidget();

  @override
  Widget build(BuildContext context) {
    const CustomDialogType type = CustomDialogType.success;

    return Stack(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: type.color(context).withOpacity(0.2),
            )
                .animate(
                  onComplete: (controller) => controller.repeat(reverse: true),
                  autoPlay: true,
                )
                .scaleXY(
                  begin: 0.95,
                  end: 1.1,
                  duration: GetNumUtils(2.5).seconds,
                  curve: Curves.easeInOut,
                ),
            CircleAvatar(
              radius: 60,
              backgroundColor: type.color(context),
              child: Icon(
                type.icon,
                size: 60,
                color: type.iconColor(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
