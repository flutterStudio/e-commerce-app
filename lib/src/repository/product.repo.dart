import 'dart:convert';
import 'package:e_commerce/src/dto/add_evaluation.dto.dart';
import 'package:e_commerce/src/model/cart.model.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:e_commerce/src/service/api.service.dart';
import 'package:e_commerce/src/utils/exceptions.utils.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get.dart';

class ProductRepo {
  final ApiService _apiService;

  static const String _activeProductsUrl = "Product/activeProduct";
  static const String _product = "Product";
  static const String _addTocart = "Order/addToCart";
  static const String _removeFromTocart = "Order/RemoveFromCart";
  static const String _cartOrders = "Order/InCart";
  static const String _category = "Category";
  static const String _comapnyActiveProductsUrl = "Product/company/all";
  static const String _productEvaluations = "Evaluation/ProductEvaluation";
  static const String _evaluations = "Evaluation";

  ProductRepo({required ApiService apiService}) : _apiService = apiService;

  Future<Data<List<Product>>> getCompanyProducts(
      {int? page, int? pageSize}) async {
    Data<List<Product>> data = await _getProducts(_comapnyActiveProductsUrl);
    return data;
  }

  Future<Data<List<Product>>> getActiveProducts(
      {int? page, int? pageSize}) async {
    Data<List<Product>> data = await _getProducts(_activeProductsUrl);
    return data;
  }

  ///
  /// * brief:
  ///
  ///     Get all available categories in the system.
  ///
  /// * return
  ///
  ///     Returns a `Data` object that contains either a list of categories, or an exception.
  ///
  Future<Data<List<Category>>> getCategories() async {
    try {
      Data<List<Category>> data = await _apiService
          .getRequest<Data<List<Category>>>(_category, (response) {
        Data<List<Category>> data = Data.empty();
        List<Category> categories = [];
        categories = _initCategoriesData(response);
        if (categories.isNotEmpty) {
          return Data.succeed(data: categories);
        }
        return data;
      });

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  Future<Data<Cart>> getMyCart() async {
    try {
      Data<Cart> data =
          await _apiService.getRequest<Data<Cart>>(_cartOrders, (response) {
        Data<Cart> data = Data.empty();

        Cart cart =
            Cart().serilizer().fromJson(jsonDecode(response.bodyString!));
        data = Data.succeed(data: cart);
        return data;
      });

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    }
  }

  Future<Data<Cart>> addToCart(int productId, int count) async {
    try {
      Data<Cart> data = await _apiService.postRequest<Data<Cart>>(
          _addTocart, {"productId": productId, "quantity": count}, (response) {
        Data<Cart> data = Data.empty();

        Cart cart =
            Cart().serilizer().fromJson(jsonDecode(response.bodyString!));
        data = Data.succeed(data: cart);
        return data;
      });
      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  Future<Data<bool>> deleteProductfromcart(
    int productOrderId,
  ) async {
    try {
      Data<bool> data = await _apiService.deleteRequest<Data<bool>>(
          _removeFromTocart + "/" + "$productOrderId", (response) {
        Data<bool> data = Data.empty();

        data = Data.succeed(data: true);
        return data;
      });

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  Future<Data<List<Product>>> _getProducts(String url,
      {int? page, int? pageSize}) async {
    try {
      Data<List<Product>>? data = await _apiService
          .getRequest<Data<List<Product>>>(url, (response) {
        Data<List<Product>> data = Data.empty();

        // Get pagination info if exists.
        _initPaginationInfo(data, response);

        // Get pagination info if exists.
        data.data = _initProductData(response);
        return data;
      },
              query: {"page": page, "pageSize": pageSize}
                ..removeWhere((key, value) => value == null));

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    }
  }

  Future<Data<Product>> getProduct(
    int id,
  ) async {
    try {
      Data<Product>? data = await _apiService.getRequest<Data<Product>>(
        _product + "/$id",
        (response) {
          Data<Product> data = Data.empty();
          Product product =
              Product().serilizer().fromJson(jsonDecode(response.bodyString!));
          data = Data.succeed(data: product);
          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    }
  }

  Future<Data<Product>> postProduct(String url, Product product) async {
    try {
      Data<Product>? data = await _apiService.postRequest<Data<Product>>(
        url,
        product.serilizer().toJson(),
        (response) {
          Data<Product> data = Data.empty();

          // Get pagination info if exists.
          _initPaginationInfo(data, response);

          // Get pagination info if exists.
          data.data = _initProductData(response);

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    }
  }

  ///
  /// #### brief
  /// Get users evaluations on a specific product.
  ///
  ///
  Future<Data<List<Evaluation>>> getProductEvaluations(int productId) async {
    try {
      Data<List<Evaluation>>? data =
          await _apiService.getRequest<Data<List<Evaluation>>>(
        _productEvaluations + "/$productId",
        (response) {
          Data<List<Evaluation>> data = Data.empty();

          // Get pagination info if exists.
          _initPaginationInfo(data, response);

          // Get pagination info if exists.
          data.data = _initEvaluationsData(response);

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    }
  }

  ///
  /// #### brief
  /// Get users evaluations on a specific product.
  ///
  ///
  Future<Data<Evaluation>> addProductEvaluations(AddEvaluationDto dto) async {
    try {
      Data<Evaluation>? data = await _apiService.postRequest<Data<Evaluation>>(
        _evaluations,
        dto.serializer().toJson(),
        (response) {
          Data<Evaluation> data = Data.empty();

          // Get pagination info if exists.
          _initPaginationInfo(data, response);

          // Get pagination info if exists.
          data.data = _initEvaluationsData(response);

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    }
  }

  /// Initalize pagination response.
  void _initPaginationInfo(Data data, Response response) {
    var paginationInfo = jsonDecode(response.bodyString!)["paginationInfo"];
    data.totalPages = paginationInfo["totalPages"];
    data.totalResults = paginationInfo["totalItems"];
    data.page = paginationInfo["pageNo"];
  }

  /// Initalize products response.
  List<Product> _initProductData(Response response) {
    List<Product> products = [];
    var productsData = jsonDecode(response.bodyString!)["products"] as List;
    for (var product in productsData) {
      products.add(Product().serilizer().fromJson(product));
    }
    return products;
  }

  /// Initalize categories response.
  List<Category> _initCategoriesData(Response response) {
    List<Category> categories = [];
    var data = jsonDecode(response.bodyString!)["categories"] as List;
    for (var product in data) {
      categories.add(Category().serilizer().fromJson(product));
    }
    return categories;
  }

  /// Initalize valuations response.
  List<Evaluation> _initEvaluationsData(Response response) {
    List<Evaluation> evaluations = [];
    var data = jsonDecode(response.bodyString!)["evaluations"] as List;
    for (var product in data) {
      evaluations.add(Evaluation().serilizer().fromJson(product));
    }
    return evaluations;
  }
}
