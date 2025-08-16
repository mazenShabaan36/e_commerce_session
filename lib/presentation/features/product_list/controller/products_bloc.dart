import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:session/core/remote/api_constants.dart';
import 'package:session/core/remote/api_service.dart';
import 'package:session/data/models/product_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiService apiService = ApiService();
  ProductsBloc() : super(ProductsInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductsLoading());
      final result = await getProducts();
      emit(ProductsLoaded(productsList: result));
    });
    on<FetchProductsWithCategory>((event, emit) async {
      emit(ProductsLoading());
    });
  }

  Future<List<Product>> getProducts() async {
    try {
      final response = await apiService.get(path: ApiConstants.products);
      final List<dynamic> dataList = response.data as List;
      // debugPrint(response.data.runtimeType.toString());
      if (response.statusCode == 200) {
        return dataList.map((e) => Product.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow; // == throw(e)
    }
  }
}
