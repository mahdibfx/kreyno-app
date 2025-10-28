import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/dtos/withdraw_dto.dart';
import 'package:kreyno/enums/wallet_history_category.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/transaction_data.dart';
import 'package:kreyno/models/wallet.dart';
import 'package:kreyno/models/wallet_history.dart';
import 'package:kreyno/services/api/api_wallet_service.dart';
import 'package:kreyno/services/api/dio_service.dart';

class WalletService {
  final _apiWalletService = ApiWalletService(locator<DioService>().dio);

  Future<Either<String, Wallet>> getWallet() {
    return _apiWalletService.getWallet().toEither();
  }

  Future<Either<String, TransactionData>> getWalletHistory({
    DateTime? from,
    DateTime? to,
  }) {
    // TODO: Remove this mock data
    // return _apiWalletService.getWalletHistory(from: from, to: to).toEither();
    return Future.value(
      Right(
        TransactionData(
          transactionsByMonth: {
            'Octobre 2025': [
              WalletHistory(
                id: 1,
                category: WalletHistoryCategory.earn,
                amount: 5.0,
                detail: 'Vente place #2039',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 2, hours: 1),
                ),
              ),
              WalletHistory(
                id: 2,
                category: WalletHistoryCategory.earn,
                amount: 12.5,
                detail: 'Vente place #2040',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 1, hours: 3),
                ),
              ),
              WalletHistory(
                id: 3,
                category: WalletHistoryCategory.withdraw,
                amount: 10.0,
                detail: 'Retrait Stripe',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 1, hours: 2, minutes: 15),
                ),
              ),
              WalletHistory(
                id: 4,
                category: WalletHistoryCategory.earn,
                amount: 6.3,
                detail: 'Vente place #2041',
                createdAt: DateTime.now().subtract(const Duration(hours: 8)),
              ),
            ],
            'Septembre 2025': [
              WalletHistory(
                id: 5,
                category: WalletHistoryCategory.earn,
                amount: 12.0,
                detail: 'Vente place #2002',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 33, hours: 7),
                ),
              ),
              WalletHistory(
                id: 6,
                category: WalletHistoryCategory.withdraw,
                amount: 3.0,
                detail: 'Retrait Stripe',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 30, hours: 2, minutes: 20),
                ),
              ),
              WalletHistory(
                id: 7,
                category: WalletHistoryCategory.earn,
                amount: 7.6,
                detail: 'Vente place #2007',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 25, hours: 12, minutes: 45),
                ),
              ),
              WalletHistory(
                id: 8,
                category: WalletHistoryCategory.earn,
                amount: 15.20,
                detail: 'Vente place #2010',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 22, hours: 8, minutes: 10),
                ),
              ),
              WalletHistory(
                id: 9,
                category: WalletHistoryCategory.withdraw,
                amount: 8.8,
                detail: 'Retrait Stripe',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 19, hours: 4),
                ),
              ),
            ],
            'Août 2025': [
              WalletHistory(
                id: 10,
                category: WalletHistoryCategory.earn,
                amount: 11.0,
                detail: 'Vente place #1901',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 63, hours: 2),
                ),
              ),
              WalletHistory(
                id: 11,
                category: WalletHistoryCategory.earn,
                amount: 9.50,
                detail: 'Vente place #1910',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 59, hours: 6),
                ),
              ),
              WalletHistory(
                id: 12,
                category: WalletHistoryCategory.withdraw,
                amount: 6.5,
                detail: 'Retrait Stripe',
                createdAt: DateTime.now().subtract(
                  const Duration(days: 55, hours: 3, minutes: 50),
                ),
              ),
            ],
          },
        ),
      ),
    );
  }

  Future<Either<String, Wallet>> withdraw(WithdrawDto dto) {
    return _apiWalletService.withdraw(dto).toEither();
  }
}
