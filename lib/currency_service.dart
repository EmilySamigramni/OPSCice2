import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'currency_service.g.dart';

@RestApi(baseUrl: "https://currency.getgeoapi.com/api/v1/")
abstract class CurrencyService {
  factory CurrencyService(Dio dio, {String baseUrl}) = _CurrencyService;

  @GET("/exchange-rates")
  Future<CurrencyResponse> getExchangeRates(
    @Query("api_key") String apiKey,
    @Query("from") String fromCurrency,
    @Query("to") String toCurrency,
    @Query("amount") double amount,
  );
}

@JsonSerializable()
class CurrencyResponse {
  final Map<String, dynamic> rates;
  final String from;
  final String to;
  final double amount;

  CurrencyResponse({
    required this.rates,
    required this.from,
    required this.to,
    required this.amount,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}
