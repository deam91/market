import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market/core/router/router.dart';
import 'package:market/core/theme/texts.dart';
import 'package:market/features/home/model/product.dart';
import 'package:market/features/home/widget/previous_orders/previous_orders.dart';
import 'package:market/features/home/widget/text_header.dart';
import 'package:market/features/product/providers/product_providers.dart';
import 'package:market/features/product/widget/counter.dart';
import 'package:market/features/product/widget/product_discount.dart';
import 'package:market/features/product/widget/product_panel.dart';
import 'package:market/features/product/widget/product_panel_link.dart';

@RoutePage()
class ProductView extends ConsumerWidget {
  const ProductView({required this.product, super.key});

  final Product product;

  static const routeName = '/product';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productStream = ref.watch(singleProductProvider(product.productId!));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffFFB75E), Color(0xffED8F03)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(radius: 42 / 2),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SearchBar(
                        constraints: const BoxConstraints.tightFor(height: 42),
                        leading: SvgPicture.asset('assets/svg/search.svg'),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.only(left: 10, bottom: 5, right: 5),
                        ),
                        trailing: [
                          Transform.translate(
                            offset: const Offset(0, 2),
                            child: IconButton(
                              padding: const EdgeInsets.all(3),
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/svg/qr_code_scan.svg',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: productStream.when(
              data: (product) {
                if (product == null) {
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    () => context.router.pop(),
                  );
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextHeader(text: 'Product'),
                        Text(product.name, style: archivoBlack),
                        const TextHeader(text: 'Deal Price'),
                        ProductDiscount(product: product),
                        ProductPanel(
                          type: ProductAttrType.details,
                          detailsList: product.details,
                          initiallyExpanded: true,
                        ),
                        const ProductPanel(
                          type: ProductAttrType.reviews,
                        ),
                        ProductPanelLink(
                          type: ProductAttrType.supply,
                          onTap: () {
                            context.router.push(
                              SupplyRoute(
                                supplies: product.supplies ?? [],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Select Quantity',
                                  style: interBlack.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  '(Maximum ${product.maxQuantityPerOrder} quantity per order)',
                                  style:
                                      archivoBlackSmall.copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                            Counter(max: product.maxQuantityPerOrder ?? 10),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  foregroundColor: const Color(0xffED8F03),
                                  side: const BorderSide(
                                    color: Color(0xffED8F03),
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Add to Cart',
                                  style: interBlack.copyWith(
                                    color: const Color(0xffED8F03),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                        child: Text(
                                          'Order is placed successfully',
                                          style: interBlackW400,
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  backgroundColor: const Color(0xffED8F03),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('Buy Now'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const PreviousOrders(
                          headerTitle: 'Recommended Products',
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
              error: (error, stack) {
                Future.delayed(
                  const Duration(milliseconds: 300),
                  () => context.router.pop(),
                );
                return const SizedBox.shrink();
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
