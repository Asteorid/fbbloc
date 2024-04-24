import 'package:fbbloc/json_page/bloc/post_event.dart';
import 'package:fbbloc/json_page/bloc/post_state.dart';
import 'package:fbbloc/services/post_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService apiService;

  PostBloc({required this.apiService}) : super(PostInitial()) {
    on<FetchPost>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await apiService.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError("Error fetching post: $e"));
      }
    });
  }
}
