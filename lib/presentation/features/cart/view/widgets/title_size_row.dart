import 'package:flutter/widgets.dart';
import 'package:session/core/text_styles.dart';
import 'package:session/data/models/product_model.dart';

class TitleSizeRow extends StatelessWidget {
  const TitleSizeRow({super.key, required this.item});
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //
        Flexible(child: Text(item.title.toString(), overflow: TextOverflow.ellipsis, style: Styles.style12mainClrS)),
        //
        const SizedBox(width: 35), Text("L", style: Styles.style14greyL),
      ],
    );
  }
}
