import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/product/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;

  @override
  Stream<Product?> getProductChanges({required String productId}) async* {
    try {
      yield* firestore
          .collection('products')
          .doc(productId)
          .snapshots()
          .map((event) {
        if (!event.exists) return null;
        return Product.fromJson(event.data()!, event.id);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    yield null;
  }

  @override
  Future<List<Offer>> getProductOffers({required List<String> offerIds}) async {
    print('offerIds $offerIds');
    try {
      final snapshot = await firestore
          .collection('offers')
          .where(FieldPath.documentId, whereIn: offerIds)
          .get();
      print('where offers result...');
      return snapshot.docs.map((event) {
        return Offer.fromJson(event.data(), event.id);
      }).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(firestore: FirebaseFirestore.instance);
});
