import 'package:dio/dio.dart';
import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/model/quotes_model.dart';

class QuoteService {
  Future<QuotesModel?> fetchQuotes() async {
    try {
      // var response = await Dio().get(quotesEndpoint);

      // if (response.statusCode == 200) {
      //   return QuotesModel();
      // }

      return null;
    } catch (e) {
      print(e);
    }
  }
}
