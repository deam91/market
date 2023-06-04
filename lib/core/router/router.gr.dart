// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductView(
          product: args.product,
          key: args.key,
        ),
      );
    },
    SupplyRoute.name: (routeData) {
      final args = routeData.argsAs<SupplyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SupplyView(
          supplies: args.supplies,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductView]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    required Product product,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            product: product,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const PageInfo<ProductRouteArgs> page =
      PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    required this.product,
    this.key,
  });

  final Product product;

  final Key? key;

  @override
  String toString() {
    return 'ProductRouteArgs{product: $product, key: $key}';
  }
}

/// generated route for
/// [SupplyView]
class SupplyRoute extends PageRouteInfo<SupplyRouteArgs> {
  SupplyRoute({
    required List<SupplyDetail> supplies,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SupplyRoute.name,
          args: SupplyRouteArgs(
            supplies: supplies,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SupplyRoute';

  static const PageInfo<SupplyRouteArgs> page = PageInfo<SupplyRouteArgs>(name);
}

class SupplyRouteArgs {
  const SupplyRouteArgs({
    required this.supplies,
    this.key,
  });

  final List<SupplyDetail> supplies;

  final Key? key;

  @override
  String toString() {
    return 'SupplyRouteArgs{supplies: $supplies, key: $key}';
  }
}
