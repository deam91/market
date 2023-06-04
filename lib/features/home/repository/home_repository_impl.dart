import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;

  @override
  Stream<QuerySnapshot<Offer>?> getOffersAndDeals() {
    return firestore.collection('offers').limit(10).withConverter(
      fromFirestore: (snapshot, options) {
        return Offer.fromJson(snapshot.data()!, snapshot.id);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).snapshots();
  }

  @override
  Stream<QuerySnapshot<Product>> getPreviousOrders() {
    return firestore.collection('products').limit(10).withConverter(
      fromFirestore: (snapshot, options) {
        return Product.fromJson(snapshot.data()!, snapshot.id);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).snapshots();
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(firestore: FirebaseFirestore.instance);
});
