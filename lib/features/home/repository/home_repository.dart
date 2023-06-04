import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/features/home/model/offer.dart';
import 'package:market/features/home/model/product.dart';

abstract class HomeRepository {
  Stream<QuerySnapshot<Product>?> getPreviousOrders();
  Stream<QuerySnapshot<Offer>?> getOffersAndDeals();
}
