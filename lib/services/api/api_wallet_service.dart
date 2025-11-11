import 'package:dio/dio.dart';
import 'package:kreyno/dtos/withdraw_dto.dart';
import 'package:kreyno/models/api_response.dart';
import 'package:kreyno/models/transaction_data.dart';
import 'package:kreyno/models/wallet.dart';
import 'package:kreyno/services/api/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_wallet_service.g.dart';

@RestApi()
abstract class ApiWalletService {
  factory ApiWalletService(Dio dio) = _ApiWalletService;

  @GET(ApiEndpoints.wallet)
  Future<ApiResponse<Wallet>> getWallet();

  @GET(ApiEndpoints.walletHistory)
  Future<ApiResponse<TransactionData>> getWalletHistory(
    @Query('from') DateTime? from,
    @Query('to') DateTime? to,
  );

  @POST(ApiEndpoints.walletWithdraw)
  Future<ApiResponse<Wallet>> withdraw(@Body() WithdrawDto dto);
}
