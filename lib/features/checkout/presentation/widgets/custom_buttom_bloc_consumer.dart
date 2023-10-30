import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/core/utils/api_keys.dart';
import 'package:flutter_paymob/core/widgets/custom_btn.dart';
import 'package:flutter_paymob/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paymob/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:flutter_paymob/features/checkout/presentation/views/thank_you_view.dart';

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
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: "100",
              currency: "USD",
              customerId: ApiKeys.customerId,
            );
            BlocProvider.of<PaymentCubit>(context)
                .malePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
          text: "Continue",
        );
      },
    );
  }
}
