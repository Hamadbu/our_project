import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class AuthorTipsPage extends StatefulWidget {
  AuthorTipsPage({super.key});

  @override
  State<AuthorTipsPage> createState() => _AuthorTipsPageState();
}

class _AuthorTipsPageState extends State<AuthorTipsPage> {
  TextEditingController searchController = TextEditingController();

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
        bottom: TabBar(
          tabs: [
            Tab(text: 'All Tips'),
            Tab(text: 'My Tips'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTipDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(labelText: 'Search by Author'),
              onChanged: (value) {
                // Trigger filtering logic when the user types in the TextField
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: context.read<TipsProvider>().personalTipList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Consumer<TipsProvider>(
                  builder: (context, value, child) {
                    // Filter the tips based on the entered author name
                    final filteredTips = value.personalTipsList.where((tip) =>
                        tip.author!
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()));

                    return ListView.builder(
                      itemCount: filteredTips.length,
                      itemBuilder: (context, index) {
                        final tip = filteredTips.elementAt(index);
                        final thumbsUp = tip.upvotes!.length ?? 0;
                        final thumbsDown = tip.downvotes!.length ?? 0;

                        dynamic totalThumbs = thumbsUp - thumbsDown;
                        return Container(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tip.text.toString(),
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                      Text(
                                        tip.author.toString(),
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
                                            .deleteTip(tip.id!);
                                      });
                                    },
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          context
                                              .read<TipsProvider>()
                                              .upVoteTip(tip.id!);
                                        });
                                      },
                                      icon: Icon(Icons.thumb_up)),
                                  Text(totalThumbs.toString()),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          context
                                              .read<TipsProvider>()
                                              .downVoteTip(tip.id!);
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
          ),
        ],
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
}
