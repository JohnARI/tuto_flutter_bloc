import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/shared/constants.dart';

import '../blocs/post_bloc.dart';
import 'post_method.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    postBloc = PostBloc();
    scrollController = ScrollController();
    postBloc.add(PostInitialFetchEvent());
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        postBloc.add(PostLoadMoreEvent());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    postBloc.close();
    super.dispose();
  }

  late ScrollController scrollController;
  late PostBloc postBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (PostState previous, PostState current) {
          return current is PostActionState;
        },
        buildWhen: (PostState previous, PostState current) {
          return current is! PostActionState;
        },
        listener: (BuildContext context, PostState state) {
          if (state is PostCreateSuccessState) {
            const SnackBar snackBar = SnackBar(
              content: Text('Post ajouté avec succès.'),
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is PostNavigateThemeActionState) {
            // Use GoRouter
            GoRouter.of(context).pushNamed(AppRouteConstants.themeRouteName);
          }
        },
        builder: (BuildContext context, PostState state) {
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Posts Page'),
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case PostFetchingSuccessfulState:
              final PostFetchingSuccessfulState successState =
                  state as PostFetchingSuccessfulState;
              if (successState.posts.isEmpty) {
                return const Center(child: Text('Aucun poste trouvé.'));
              }
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Posts Page'),
                ),
                floatingActionButton:
                    PostMethod.buildFloatingActionButtons(context, postBloc),
                body: PostMethod.buildPostCard(successState, scrollController),
              );

            default:
              return const SizedBox();
          }
        });
  }
}
