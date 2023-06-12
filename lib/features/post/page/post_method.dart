import 'package:flutter/material.dart';
import 'package:tuto_flutter_bloc/shared/constants.dart';

import '../../../widgets/floating_action_button.dart';
import '../blocs/post_bloc.dart';

class PostMethod {
  static Column buildFloatingActionButtons(
      BuildContext context, PostBloc postBloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        CustomFloatingActionButton(
            heroTag: 'add',
            floatingActionButtonIcon: const Icon(Icons.add),
            floatingActionButtonOnPressed: () {
              final TextEditingController titleController =
                  TextEditingController();
              final TextEditingController bodyController =
                  TextEditingController();

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Ajouter un post'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            hintText: 'Titre',
                          ),
                        ),
                        TextField(
                          controller: bodyController,
                          decoration: const InputDecoration(
                            hintText: 'Contenu',
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          postBloc.add(
                            PostAddEvent(
                              postAddEventId:
                                  DateTime.now().millisecondsSinceEpoch,
                              title: titleController.text,
                              body: bodyController.text,
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ajouter'),
                      ),
                    ],
                  );
                },
              );
            }),
        const SizedBox(height: 10),
        CustomFloatingActionButton(
          heroTag: 'theme',
          floatingActionButtonIcon: const Icon(Icons.navigate_next),
          floatingActionButtonOnPressed: () =>
              postBloc.add(PostNavigateThemeEvent(
            postNavigateThemeEventId: DateTime.now().millisecondsSinceEpoch,
          )),
        ),
      ],
    );
  }

  static ListView buildPostCard(PostFetchingSuccessfulState successState,
      ScrollController scrollController) {
    return ListView.builder(
      controller: scrollController,
      itemCount: successState.posts.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == successState.posts.length) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(StyleConstant.horizontalPadding),
          margin: const EdgeInsets.all(StyleConstant.horizontalPadding),
          child: DefaultTextStyle(
            style: TextStyle(color: Theme.of(context).primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(successState.posts[index].id.toString()),
                Text(successState.posts[index].body),
              ],
            ),
          ),
        );
      },
    );
  }
}
