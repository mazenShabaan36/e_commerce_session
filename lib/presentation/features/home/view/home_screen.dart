import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:session/core/app_assets.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/data/models/product_model.dart';

import 'package:session/presentation/features/home/widgets/categories_list.dart';

import 'package:session/presentation/features/home/widgets/offers_card.dart';
import 'package:session/presentation/features/home/widgets/welcoming_row.dart';
import 'package:session/presentation/features/product_list/controller/product_list_controller.dart';
import 'package:session/presentation/features/product_list/widgets/product_item_card.dart';
import 'package:session/presentation/widgets/app_textfield.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController field = TextEditingController();
  final ProductListController productListController = ProductListController();
  bool isLoading = true;
  bool isValid = false;
  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final results = await productListController.getProducts();

    setState(() {
      products = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            const WelcomingRow(),
            //
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              //
              child: AppTextField(
                controller: field,
                hint: AppStrings.whatAreYouLookingFor,
                onChange: (value) {
                  setState(() {});
                },
                prefixIcon: InkWell(child: Transform.scale(scale: 0.5, child: SvgPicture.asset(AppAssets.search))),
              ),
            ),
            //
            const OffersCard(),
            //
            const CategoriesList(),

            isLoading
                ? Center(child: CircularProgressIndicator())
                : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  //
                  children: products.map((e) => ProductItemCard(product: e)).toList(),
                ),
          ],
        ),
      ),
    );
  }
}
