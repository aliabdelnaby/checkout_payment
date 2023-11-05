import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/core/widgets/custom_btn.dart';
import 'package:flutter_paymob/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:flutter_paymob/features/checkout/data/models/amount_model/details.dart';
import 'package:flutter_paymob/features/checkout/data/models/item_list_model/item.dart';
import 'package:flutter_paymob/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:flutter_paymob/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:flutter_paymob/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //   amount: "100",
            //   currency: "USD",
            //   customerId: ApiKeys.customerId,
            // );
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
            var amount = AmountModel(
              total: "100",
              currency: 'USD',
              details: Details(
                shipping: "0",
                shippingDiscount: 0,
                subtotal: '100',
              ),
            );

            List<OrderItemModel> orders = [
              OrderItemModel(
                currency: 'USD',
                name: 'Apple',
                price: "4",
                quantity: 10,
              ),
              OrderItemModel(
                currency: 'USD',
                name: 'Pineapple',
                price: "5",
                quantity: 12,
              ),
            ];
            var itemList = ItemListModel(
              orders: orders,
            );
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId:
                    "ATFDCxm2XR5zWGRNmrlSTnSJrgqxkVNUKqxKFs86Ed93iFv6Wqw8ENJjZEJqf2NoRoG0waJMUHA5mv6K",
                secretKey:
                    "EM2MrnrD97oqIiLtIBDlV7XuxuD3yBKKC4t7poWtLBpju7-ojTGs4lWxNn56_0ZH1mGtwCsQgb56t7py",
                transactions: [
                  {
                    "amount": amount.toJson(),
                    "description": "The payment transaction description.",
                    "item_list": itemList.toJson(),
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  log("onSuccess: $params");
                  Navigator.pop(context);
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                  Navigator.pop(context);
                },
              ),
            ));
          },
          isLoading: state is PaymentLoading ? true : false,
          text: "Continue",
        );
      },
    );
  }
}
