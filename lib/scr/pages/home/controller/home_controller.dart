import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lac_buffet/scr/models/category_model.dart';
import 'package:lac_buffet/scr/models/item_model.dart';
import 'package:lac_buffet/scr/pages/home/repository/home_repository.dart';
import 'package:lac_buffet/scr/pages/home/result/home_result.dart';
import 'package:lac_buffet/scr/services/utils_services.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    getAllProducts();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        if (allCategories.isEmpty) return;

        selectCategory(allCategories.first);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> getAllProducts() async {
    setLoading(true);

    Map<String, dynamic> body = {
      'page': 0,
      'title': null,
      'categoryId': '5mjkt5ERRo',
      'itemsPerPage': 6
    };

    HomeResult<ItemModel> result = await homeRepository.getAllProducts(body);

    setLoading(false);

    result.when(
      success: (data) {
        print(data);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
