import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      color: Color(0xffFFCC80),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 24,
          bottom: 24,
          start: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                'Qoutes',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Sometimes the dreamers finally wake up',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.black.withOpacity(0.7),
                  size: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Text(
                    'Feb 17, 2024',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditView(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit_note_outlined,
                      color: Colors.black.withOpacity(0.7),
                      size: 32,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
