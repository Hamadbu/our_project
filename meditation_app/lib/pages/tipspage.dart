import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatefulWidget {
  TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<AuthProvider>()
                  .logOut()
                  .whenComplete(() => context.goNamed('signin'));
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTipDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: context.read<TipsProvider>().getTipsList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Consumer<TipsProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.tipsList.length,
                itemBuilder: (context, index) {
                  final thumbsUp = value.tipsList[index].upvotes!.length ?? 0;
                  final thumbsDown =
                      value.tipsList[index].downvotes!.length ?? 0;

                  dynamic totalThumbs = thumbsUp - thumbsDown;
                  return Container(
                    // width: 1,
                    // height: 80,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.tipsList[index].text.toString(),
                                  style: TextStyle(fontSize: 13.0),
                                ),
                                Text(
                                  value.tipsList[index].author.toString(),
                                  style: TextStyle(fontSize: 13.0),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  context
                                      .read<TipsProvider>()
                                      .deleteTip(value.tipsList[index].id!);
                                });
                              },
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    context
                                        .read<TipsProvider>()
                                        .upVoteTip(value.tipsList[index].id!);
                                  });
                                },
                                icon: Icon(Icons.thumb_up)),
                            Text(totalThumbs.toString()),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    context
                                        .read<TipsProvider>()
                                        .downVoteTip(value.tipsList[index].id!);
                                  });
                                },
                                icon: Icon(Icons.thumb_down))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showAddTipDialog(BuildContext context) {
    TextEditingController tipController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Tip"),
          content: TextField(
            controller: tipController,
            decoration: InputDecoration(labelText: 'Enter your tip'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your logic to save the tip
                String tipText = tipController.text;
                if (tipText.isNotEmpty) {
                  context.read<TipsProvider>().createNewTips(tipText);
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteTipDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Tip"),
          content: const Text("Are you sure you want to delete this tip?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
