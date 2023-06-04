import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/repository/home_repository.dart';

class HomeRepositoryFake extends HomeRepository {
  @override
  Stream<QuerySnapshot<Offer>?> getOffersAndDeals() {
    // TODO: implement getOffersAndDeals
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<Product>?> getPreviousOrders() {
    // TODO: implement getPreviousOrders
    throw UnimplementedError();
  }

}
