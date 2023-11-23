import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardNews extends StatelessWidget {
  const CardNews({
    super.key,
    required this.title,
    required this.date,
    required this.imgPath,
    required this.content,
  });

  final String title;
  final DateTime date;
  final String imgPath;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imgPath,
            fit: BoxFit.fitWidth,
          ),
          const Gap(8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Gap(6),
          Text(
            date.toString().substring(0, 10),
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          ),
          const Gap(6),
          Text(
            content,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
