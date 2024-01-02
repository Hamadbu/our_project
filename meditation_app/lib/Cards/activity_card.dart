import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/lists/activities.dart';

class ActivitiesCard extends StatelessWidget {
  ActivitiesCard({super.key, required this.activity});
  String activity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (activity == "Tips") {
          context.pushNamed("tips");
        }
        if (activity == "Meditation") {
          context.pushNamed("exercise");
        }
        if (activity == "Music") {
          context.pushNamed('music');
        }
      },
      child: Center(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            color: const Color.fromARGB(255, 33, 194, 243),
            child: Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    activity,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// class CategoriesCard extends StatelessWidget {
//   CategoriesCard({super.key, required this.categories, required this.number});

//   String categories;
//   int number;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if (categories == "Movies") {
//           context.push("/moviespage");
//         } else if (categories == "Math") {
//           context.push("/mathpage");
//         } else if (categories == "Physics") {
//           context.push("/physicspage");
//         }
//       },
//       child: Container(
//         width: 260,
//         height: 70,
//         margin: const EdgeInsets.all(15.0),
//         padding: const EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color.fromARGB(255, 173, 180, 185)),
//           borderRadius: BorderRadius.all(
//               Radius.circular(1)), // Add the radius value (adjust as needed)
//           color: Color.fromARGB(255, 228, 240, 247),
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Category $number : $categories",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
