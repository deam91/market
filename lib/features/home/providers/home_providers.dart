import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market/features/home/repository/home_repository_impl.dart';

final offersStream = StreamProvider((ref) {
  return ref.read(homeRepositoryProvider).getOffersAndDeals();
});

final ordersStream = StreamProvider((ref) {
  return ref.read(homeRepositoryProvider).getPreviousOrders();
});
