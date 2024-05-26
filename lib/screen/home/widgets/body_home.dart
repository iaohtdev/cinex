import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_generator/gen/assets.gen.dart';
import 'package:image_generator/model/tool_model.dart';
import 'package:image_generator/routers/app_routes.dart';
import 'package:image_generator/screen/home/widgets/header_home.dart';
import 'package:image_generator/utils/components/app_constant.dart';
import 'package:image_generator/utils/enum/tool_type.dart';
import 'package:image_generator/utils/style/app_color.dart';
import 'package:image_generator/utils/style/app_textstyle.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BodyHome extends StatelessWidget {
  BodyHome({
    super.key,
  });
  ImageFilter get _imageFilter => ImageFilter.blur(sigmaX: 2, sigmaY: 2);

  final List<ToolModel> lstTool = [
    ToolModel(
        id: ToolsFunction.assitance.id,
        type: ToolsFunction.assitance.type,
        title: ToolsFunction.assitance.title,
        icon: Assets.icons.iconChat),
    ToolModel(
        id: ToolsFunction.textToImage.id,
        type: ToolsFunction.textToImage.type,
        title: ToolsFunction.textToImage.title,
        icon: Assets.icons.iconTextToImage),
    ToolModel(
        id: ToolsFunction.imageToImage.id,
        type: ToolsFunction.imageToImage.type,
        title: ToolsFunction.imageToImage.title,
        icon: Assets.icons.iconImageToImage),
    ToolModel(
        id: ToolsFunction.upscaling.id,
        type: ToolsFunction.upscaling.type,
        title: ToolsFunction.upscaling.title,
        icon: Assets.icons.iconUpScalling),
    ToolModel(
        id: ToolsFunction.multiPrompting.id,
        type: ToolsFunction.multiPrompting.type,
        title: ToolsFunction.multiPrompting.title,
        icon: Assets.icons.iconMultiPrompt),
  ];

  void onFunction(BuildContext context, int id) {
    if (id == ToolsFunction.textToImage.id) {
      Navigator.pushNamed(context, Routes.ttiHome);
    } else if (id == ToolsFunction.assitance.id) {
      Navigator.pushNamed(context, Routes.chatHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.background2.path),
              fit: BoxFit.fitHeight)),
      child: BackdropFilter(
          filter: _imageFilter,
          child: Stack(
            children: [
              SizedBox(
                height: height,
                width: width,
                child: SvgPicture.asset(
                  Assets.images.blurHome,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      HeaderHome(),
                    ],
                  ),
                ),
              ),
              SlidingUpPanel(
                  color: Colors.black,
                  maxHeight: height - 100,
                  minHeight: height / 1.8,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  panel: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        AppConstants.height8,
                        Container(
                          height: 6,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        AppConstants.height10,
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.iconExplode,
                              color: AppColor.purple,
                            ),
                            AppConstants.width10,
                            Text(
                              'AI TOOLS',
                              style: AppTextStyles.textStyle(
                                  color: AppColor.purple,
                                  fontSize: 18,
                                  fontFamily: 'Kode'),
                            )
                          ],
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.only(top: 15),
                            itemCount: lstTool.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemBuilder: (BuildContext context, int index) {
                              final item = lstTool[index];
                              return InkWell(
                                onTap: () => onFunction(context, item.id ?? 1),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColor.darkWhite,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (item.type ?? 'image').toUpperCase(),
                                        style: AppTextStyles.textStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      AppConstants.height5,
                                      Expanded(
                                        child: Text(
                                          item.title ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: AppTextStyles.textStyle(
                                            height: 2,
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: AppTextStyles.fontBold,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: AppColor.darkWhite,
                                            ),
                                            child: SvgPicture.asset(
                                              item.icon ??
                                                  Assets.icons.iconImageToImage,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            Assets.icons.iconArrowRight,
                                            color: AppColor.purple,
                                          )
                                        ],
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
                  ))
            ],
          )),
    );
  }
}
