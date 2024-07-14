import 'package:cinex/core/theme/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter/material.dart';

class CircularProgressWithPercentage extends StatelessWidget {
  final int score;
  final double? size;
  final double? textSize;
  final double? strokeWidth;

  const CircularProgressWithPercentage(
      {Key? key,
      required this.score,
      this.size,
      this.textSize,
      this.strokeWidth})
      : super(key: key);

  Color get colors {
    if (score >= 70) {
      return Colors.green;
    } else if (score >= 50 && score < 70) {
      return Colors.yellow.shade600;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = score / 100.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: SizedBox(
            width: size ?? 30,
            height: size ?? 30,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: strokeWidth ?? 4.5,
              valueColor: AlwaysStoppedAnimation<Color>(colors),
              backgroundColor: AppColor.darkWhite,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$score',
                style: AppTextStyles.textStyleBold(fontSize: textSize ?? 12)),
            Text('%',
                style: AppTextStyles.textStyleBold(
                  fontSize: textSize != null ? (textSize ?? 0) - 5 : 7,
                )),
          ],
        )
      ],
    );
  }
}
