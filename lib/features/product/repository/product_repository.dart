import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';

abstract class ProductRepository {
  Stream<Product?> getProductChanges({required String productId});
  Future<List<Offer>> getProductOffers({required List<String> offerIds});
}
