
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market/features/product/repository/product_repository_impl.dart';

final singleProductProvider = StreamProvider.family((ref, String id) {
  return ref.watch(productRepositoryProvider).getProductChanges(productId: id);
});

final productOffersProvider = FutureProvider.family((ref, List<String> ids) {
  print('ids in provider $ids');
  return ref.read(productRepositoryProvider).getProductOffers(offerIds: ids);
});
