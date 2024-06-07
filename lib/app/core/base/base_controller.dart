
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../network/exceptions/api_exception.dart';
import '../../network/exceptions/app_exception.dart';
import '../../network/exceptions/json_format_exception.dart';
import '../../network/exceptions/network_exception.dart';
import '../../network/exceptions/not_found_exception.dart';
import '../../network/exceptions/service_unavailable_exception.dart';
import '../../network/exceptions/timeout_exception.dart';
import '../../network/exceptions/unauthorize_exception.dart';
import '../model/page_state.dart';

abstract class BaseController extends GetxController{
  final Logger logger = Logger();

  final _messageController = ''.obs;
  String get message => _messageController.value;
  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;
  String get errorMessage => _errorMessageController.value;
  showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;
  String get successMessage => _messageController.value;
  showSuccessMessage(String msg) => _successMessageController(msg);

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();


  // ignore: long-parameter-list
  dynamic callDataService<T>(
      Future<T> future, {
        Function(Exception exception)? onError,
        Function(T response)? onSuccess,
        Function? onStart,
        Function? onComplete,
      }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message ?? 'Timeout exception');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }

}