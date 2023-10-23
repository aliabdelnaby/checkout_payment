import 'package:flutter/material.dart';
import 'package:flutter_paymob/core/widgets/custom_btn.dart';
import 'package:flutter_paymob/features/checkout/presentation/views/payment_details.dart';
import 'package:flutter_paymob/features/checkout/presentation/widgets/total_price.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset("assets/images/basket_image.png")),
          const SizedBox(height: 25),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$42.97',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Shipping',
            value: '\$8',
          ),
          const Divider(
            thickness: 2,
            color: Color(0xFFC6C6C6),
            height: 34,
          ),
          const TotalPrice(
            titleLarge: "Total",
            value: '\$50.97',
          ),
          const SizedBox(height: 16),
          CustomButton(
              text: 'Complete Payment',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PaymentDetailsView();
                }));
              }),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
