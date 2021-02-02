//
//
//
//import 'package:messanger/models/userall.model.dart';
//import 'package:poct/utils/RouteTransition/userall.model.dart';
//import 'package:rxdart/rxdart.dart';
//
//import '../resources/repository.dart';
//
//class GetUserBloc {
//  final _repository = Repository();
//  final _blogFetcher = PublishSubject<List<RequestAllUser>>();
//
//  Observable<List<RequestAllUser>> get getUser => _blogFetcher.stream;
//
//  fetchUser(request) async {
//    print("inside bloc"+request.toString());
//    List<RequestAllUser> itemModel = await _repository.GetAllUser(request);
//    _blogFetcher.sink.add(itemModel);
//  }
//
//  dispose() {
//    _blogFetcher.close();
//  }
//}
//
//final getUserbloc = GetUserBloc();