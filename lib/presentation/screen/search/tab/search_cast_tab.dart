import 'package:cinex/core/model/models.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter/material.dart';

class SearchCastTab extends StatelessWidget {
  const SearchCastTab({super.key, required this.casts});
  final List<CastModel> casts;
  @override
  Widget build(BuildContext context) {
    return casts.length == 0
        ? Container(
            child: Center(
              child: Text(
                'Không có kết quả',
                style: AppTextStyles.textStyle(),
              ),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.only(top: 20, left: 16, right: 16),
            itemCount: casts.length,
            itemBuilder: (context, index) {
              final item = casts[index];

              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                          height: 100,
                          width: 100,
                          child: ImageHelper.getNetworkImg(
                            imageUrl: item.profilePath,
                          )),
                    ),
                    AppConstants.width10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name ?? '',
                            style: AppTextStyles.textStyleBold(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppConstants.height4,
                          Text(
                            item.knownForDepartment ?? '',
                            style: AppTextStyles.textStyle(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
  }
}
