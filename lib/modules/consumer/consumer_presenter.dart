import 'package:app_mecanica/data/consumer/consumer_data.dart';
import 'package:app_mecanica/injection/dependency_injection.dart';

abstract class ConsumerListViewContract {
  void onLoadConsumersComplete(List<Consumer> items);
  void onLoadConsumersError();
}

class ConsumerListPresenter {
  ConsumerListViewContract _view;
  ConsumerRepository _repository;

  ConsumerListPresenter(this._view) {
    _repository = new Injector().consumerRepository;
  }

  void loadConsumers() {
    assert(_view != null);

    _repository
        .fetch()
        .then((consumers) => _view.onLoadConsumersComplete(consumers))
        .catchError((onError) => _view.onLoadConsumersError());
  }
}
