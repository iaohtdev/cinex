import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:cinex/core/model/cast_model.dart';

class CastWidget extends StatefulWidget {
  final List<CastModel> casts;

  const CastWidget({super.key, required this.casts});

  @override
  State<CastWidget> createState() => _CastWidgetState();
}

class _CastWidgetState extends State<CastWidget> {
  List<CastModel> get casts => widget.casts;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Wrap(
      children: List.generate(
        casts.length,
        (index) {
          return Container(
              margin: EdgeInsets.fromLTRB(12, 10, 12, 15),
              padding: EdgeInsets.only(bottom: 10),
              width: width / 2.6,
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 85,
                        width: 80,
                        child: ImageHelper.getNetworkImg(
                            imageUrl: casts[index].profilePath),
                      ),
                    ),
                    AppConstants.height4,
                    Text(
                      casts[index].name ?? '',
                      style: AppTextStyles.textStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      casts[index].character ?? '',
                      style: AppTextStyles.textStyleBold(
                          color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ));
        },
      ).toList(),
    );
  }
}
