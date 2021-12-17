import 'dart:convert';
import 'package:e_commerce/src/dto/add_evaluation.dto.dart';
import 'package:e_commerce/src/dto/add_product.dto.dart';
import 'package:e_commerce/src/dto/add_to_cart.dto.dart';
import 'package:e_commerce/src/dto/filter_products.dto.dart';
import 'package:e_commerce/src/model/cart.model.dart';
import 'package:e_commerce/src/model/category.model.dart';
import 'package:e_commerce/src/model/color.model.dart';
import 'package:e_commerce/src/model/data.model.dart';
import 'package:e_commerce/src/model/product.model.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:e_commerce/src/model/size.model.dart';
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
  static const String _orderCheckout = "Order/checkout";
  static const String _category = "Category";
  static const String _comapnyActiveProductsUrl = "Product/company/active";
  static const String _productEvaluations = "Evaluation/ProductEvaluation";
  static const String _evaluations = "Evaluation";
  static const String _evaluationsOnProduct = "Evaluation/UserEvaluation";
  static const String _filterProducts = "Product/FilterProducts";
  static const String _searchProducts = "Product/search";
  static const String _colors = "Color";
  static const String _sizes = "Size";
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

  Future<Data<bool>> checkout(int order) async {
    try {
      return await _apiService.putRequest<Data<bool>>(
          _orderCheckout, {"orderId": order}, (response) {
        return Data.succeed(data: true);
      });

      // return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
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
  Future<Data<List<Product>>> fliterProducts(FilterProductsDto dto) async {
    try {
      Data<List<Product>> data = await _apiService
          .postRequest<Data<List<Product>>>(
              _filterProducts, dto.serializer().toJson(), (response) {
        Data<List<Product>> data = Data.empty();
        List<Product> products = [];
        products = _initProductData(response);
        if (products.isNotEmpty) {
          return Data.succeed(data: products);
        }
        data.status = DataStatus.empty;
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

  ///
  /// * brief:
  ///
  ///     Get all available categories in the system.
  ///
  /// * return
  ///
  ///     Returns a `Data` object that contains either a list of categories, or an exception.
  ///
  Future<Data<List<Product>>> searchProducts(String key) async {
    try {
      Data<List<Product>> data = await _apiService
          .getRequest<Data<List<Product>>>(_searchProducts + "/$key",
              (response) {
        Data<List<Product>> data = Data.empty();
        List<Product> products = [];
        var productsData = jsonDecode(response.bodyString!) as List;
        for (var product in productsData) {
          products.add(Product().serilizer().fromJson(product));
        }
        if (products.isNotEmpty) {
          return Data.succeed(data: products);
        }
        data.status = DataStatus.empty;
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
    } catch (e) {
      return Data.faild(message: "message-error".tr);
    }
  }

  Future<Data<Cart>> addToCart(AddToCartDTO dto) async {
    try {
      Data<Cart> data = await _apiService.postRequest<Data<Cart>>(
          _addTocart, dto.serializer().toJson(), (response) {
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
      // ignore: unused_element
      {int? page,
      int? pageSize}) async {
    try {
      Data<List<Product>>? data =
          await _apiService.getRequest<Data<List<Product>>>(url, (response) {
        Data<List<Product>> data = Data.empty();

        // Get pagination info if exists.
        _initPaginationInfo(data, response);

        // Get pagination info if exists.
        data.data = _initProductData(response);
        return data;
      }, query: {"page": "1", "pageSize": pageSize ?? "40"});

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
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
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }

  Future<Data<Product>> postProduct(AddProductDto dto) async {
    try {
      Data<Product>? data = await _apiService.postRequest<Data<Product>>(
        _product,
        dto.serializer().toJson(),
        (response) {
          Data<Product> data = Data.empty();

          var productJson = jsonDecode(response.bodyString!);
          // Get pagination info if exists.
          data = Data.succeed(data: Product(id: productJson["productId"]));

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }

  ///
  /// #### brief
  /// Get users evaluations on a specific product.
  ///
  ///
  Future<Data<bool>> deleteProduct(int productId) async {
    try {
      Data<bool>? data = await _apiService.deleteRequest<Data<bool>>(
        _product + "/$productId",
        (response) {
          return Data.succeed(
              data: true,
              showSnackbar: true,
              message: "item-deleted-successfully"
                  .trParams({"item": "product $productId"}));
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
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
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
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
          data.data = Evaluation()
              .serilizer()
              .fromJson(jsonDecode(response.bodyString!));

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }

  ///
  /// #### brief
  /// Delet the evaluation specified by the given [id].
  ///
  ///
  Future<Data<bool>> deleteProductEvaluations(int id) async {
    try {
      Data<bool>? data = await _apiService.deleteRequest<Data<bool>>(
        _evaluations,
        (response) {
          return Data.succeed(data: true);
        },
      );
      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }

  ///
  /// #### brief
  /// Get users evaluations on a specific product.
  ///
  ///
  Future<Data<Evaluation>> getUserProductEvaluations(int productId) async {
    try {
      Data<Evaluation>? data = await _apiService.getRequest<Data<Evaluation>>(
        _evaluationsOnProduct + "/$productId",
        (response) {
          Data<Evaluation> data = Data.empty();

          // Get pagination info if exists.
          data.data = Evaluation()
              .serilizer()
              .fromJson(jsonDecode(response.bodyString!));

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }

  ///
  /// #### brief
  /// Get all available colors.
  ///
  ///
  Future<Data<List<ColorModel>>> getColors() async {
    try {
      Data<List<ColorModel>>? data =
          await _apiService.getRequest<Data<List<ColorModel>>>(
        _colors,
        (response) {
          Data<List<ColorModel>> data = Data.empty();

          // Get pagination info if exists.
          _initPaginationInfo(data, response);
          // Get pagination info if exists.
          data.data = _initColors(response);

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }

  ///
  /// #### brief
  /// Post color to backend.
  ///
  ///
  Future<Data<ColorModel>> postColor(ColorModel color) async {
    try {
      Data<ColorModel>? data = await _apiService.postRequest<Data<ColorModel>>(
        _colors,
        color.serilizer().toJson(),
        (response) {
          Data<ColorModel> data = Data.empty();

          data.data = _initColors(response);

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
    }
  }

  ///
  /// #### brief
  /// Get all available sizes.
  ///
  ///
  Future<Data<List<Size>>> getSizes() async {
    try {
      Data<List<Size>>? data = await _apiService.getRequest<Data<List<Size>>>(
        _sizes,
        (response) {
          Data<List<Size>> data = Data.empty();

          // Get pagination info if exists.
          _initPaginationInfo(data, response);
          // Get pagination info if exists.
          data.data = _initSizes(response);

          return data;
        },
      );

      return data;
    } on NetworkException catch (e) {
      return Data.faild(message: e.message);
    } on FormatException catch (e) {
      return Data.faild(message: e.message);
    } catch (e) {
      return Data.faild(message: "message-unknown-error".tr);
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

  /// Initalize valuations response.
  List<ColorModel> _initColors(Response response) {
    List<ColorModel> evaluations = [];
    var data = jsonDecode(response.bodyString!)["colors"] as List;
    for (var product in data) {
      evaluations.add(ColorModel().serilizer().fromJson(product));
    }
    return evaluations;
  }

  /// Initalize sizes response.
  List<Size> _initSizes(Response response) {
    List<Size> evaluations = [];
    var data = jsonDecode(response.bodyString!)["sizes"] as List;
    for (var product in data) {
      evaluations.add(Size().serilizer().fromJson(product));
    }
    return evaluations;
  }
}
