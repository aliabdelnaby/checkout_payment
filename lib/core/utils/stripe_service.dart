import 'package:dio/dio.dart';
import 'package:flutter_paymob/core/utils/api_keys.dart';
import 'package:flutter_paymob/core/utils/api_service.dart';
import 'package:flutter_paymob/features/checkout/data/models/ephmeral_key_model/ephmeral_key_model.dart';
import 'package:flutter_paymob/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:flutter_paymob/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paymob/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInpuModel initPaymentSheetInpuModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInpuModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInpuModel.ephemeralKeySecret,
        customerId: initPaymentSheetInpuModel.customerId,
        merchantDisplayName: 'Ali',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    var initPaymentSheetInpuModel = InitPaymentSheetInpuModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInpuModel: initPaymentSheetInpuModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {
          "customer": customerId,
        },
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/ephemeral_keys",
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': "2023-10-16",
        });
    var ehpemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ehpemeralKey;
  }
}

//! Finish stripe payment //!
