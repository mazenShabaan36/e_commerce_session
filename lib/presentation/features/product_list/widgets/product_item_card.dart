import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/data/models/product_model.dart';
import 'package:session/presentation/features/product_list/view/product_details_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/text_styles.dart';
import 'package:session/data/models/product_model.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 240,
      decoration: BoxDecoration(color: AppColors.colorWhite, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.colorWhite, borderRadius: BorderRadius.circular(15)),
            width: double.maxFinite,
            height: 150,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15), bottom: Radius.circular(35)),
                    //
                    child: CachedNetworkImage(
                      imageUrl: product.image.toString(),

                      //
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.colorWhiteLight.withOpacity(0.8),
                    //
                    child: SvgPicture.asset(AppAssets.heartOff),
                  ),
                ),

                //
                Positioned(
                  bottom: -25,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorWhiteLight,
                    radius: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        //
                        boxShadow: [BoxShadow(color: AppColors.colorBlack.withAlpha(120), blurRadius: 10, spreadRadius: 0.2)],
                        shape: BoxShape.circle,
                      ),
                      child: Padding(padding: const EdgeInsets.all(4.0), child: SvgPicture.asset(AppAssets.bag, color: AppColors.colorWhite)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            //
            child: Text(product.title.toString(), overflow: TextOverflow.ellipsis, style: Styles.style12mainClrS),
          ),
          const SizedBox(height: 5),
          Text('\$ ${product.price}', style: Styles.style14mainClrL),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
