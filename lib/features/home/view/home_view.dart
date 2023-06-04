import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market/core/theme/texts.dart';
import 'package:market/features/home/widget/background_gradient.dart';
import 'package:market/features/home/widget/home_buttons.dart';
import 'package:market/features/home/widget/offers_deals/offers_deals.dart';
import 'package:market/features/home/widget/previous_orders/previous_orders.dart';
import 'package:market/features/home/widget/scan_button.dart';
import 'package:market/features/home/widget/text_header.dart';
import 'package:market/features/home/widget/user_data.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  double bottomSpace(BuildContext context) {
    final safeArea = MediaQuery.of(context).padding;
    return safeArea.bottom;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundGradient(),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: const UserData().animate().fade(duration: 300.ms),
                ),
                Expanded(
                  child: SizedBox.expand(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(
                            bottom: kBottomNavigationBarHeight + 60,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextHeader(text: 'My Wallet Balance')
                                  .animate(delay: 100.ms)
                                  .fade(duration: 300.ms),
                              const Text(
                                'Rs. 2,500',
                                style: archivoBlack,
                              ).animate(delay: 200.ms).fade(duration: 300.ms),
                              const HomeButtons()
                                  .animate(delay: 300.ms)
                                  .fade(duration: 300.ms),
                              const PreviousOrders()
                                  .animate(delay: 400.ms)
                                  .fade(duration: 300.ms),
                              const SizedBox(
                                height: 20,
                              ),
                              const OffersAndDeals()
                                  .animate(delay: 500.ms)
                                  .fade(duration: 300.ms),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: bottomSpace(context),
            height: 92,
            left: 24,
            right: 24,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F4F6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              //
                            },
                            icon: SvgPicture.asset(
                              'assets/svg/settings.svg',
                            ),
                          ),
                          const SizedBox(width: 82),
                          IconButton(
                            onPressed: () {
                              //
                            },
                            icon: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/cart.svg',
                                ),
                                Text(
                                  'My Cart',
                                  style: interBlack.copyWith(fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const ScanButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
