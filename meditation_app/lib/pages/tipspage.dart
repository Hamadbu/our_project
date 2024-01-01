import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class TipsPage extends StatelessWidget {
  TipsPage({super.key});

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
                  return Container(
                    // width: 1,
                    // height: 80,
                    child: Card(
                      child: ListTile(
                        title: Text(
                          value.tipsList[index].text.toString(),
                          style: TextStyle(
                              fontSize: 13.0), // Set the desired font size
                        ),
                        subtitle: Text(
                          value.tipsList[index].author.toString(),
                          style: TextStyle(
                              fontSize: 13.0), // Set the desired font size
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteTipDialog(context, index);
                          },
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
          title: Text("Delete Tip"),
          content: Text("Are you sure you want to delete this tip?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TipsProvider>().deleteTip(index);
                Navigator.of(context).pop(); // Close the dialog
                print(index);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
