import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/product/repository/product_repository.dart';

class ProductRepositoryFake extends ProductRepository {
  @override
  Stream<Product?> getProductChanges({required String productId}) {
    // TODO: implement getProductChanges
    throw UnimplementedError();
  }

  @override
  Future<List<Offer>> getProductOffers({required List<String> offerIds}) {
    // TODO: implement getProductOffers
    throw UnimplementedError();
  }
}
