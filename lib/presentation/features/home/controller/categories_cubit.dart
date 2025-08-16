import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session/core/remote/api_constants.dart';
import 'package:session/core/remote/api_service.dart';
import 'package:session/presentation/features/home/controller/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final ApiService apiService = ApiService();

  CategoriesCubit() : super(CategoriesInitial());

  void getAllCategories() async {
    emit(CategoriesLoading());
    final response = await apiService.get(path: ApiConstants.categories);

    // debugPrint(response.data.runtimeType.toString());
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data as List<dynamic>;
      emit(CategoriesLoaded(categories: dataList.map((e) => e.toString()).toList()));
    }
  }
}
