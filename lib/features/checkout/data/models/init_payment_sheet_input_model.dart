class InitPaymentSheetInpuModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  InitPaymentSheetInpuModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKeySecret,
  });
}
