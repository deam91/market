import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/view/home_view.dart';
import 'package:market/features/product/view/product_view.dart';
import 'package:market/features/product/view/supply_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: HomeView.routeName,
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: ProductView.routeName,
          page: ProductRoute.page,
        ),
        AutoRoute(
          path: SupplyView.routeName,
          page: SupplyRoute.page,
        ),
      ];
}
