import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sport_news_app/helper/supabase_helper.dart';
import 'package:sport_news_app/page/details.dart';
import 'package:sport_news_app/ui/card_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _future = SupabaseHelper().fetchFromTable('db_news_sport');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final data = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const Gap(20),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final titleNews = data[index]['judul_berita'];
                final dateNews = DateTime.parse(data[index]['tgl_berita']);
                final contentNews = data[index]['isi_berita'];
                final imageNews = "assets/${data[index]['gbr_berita']}";
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        title: titleNews,
                        content: contentNews,
                        image: imageNews,
                      ),
                    ),
                  ),
                  child: CardNews(
                    title: titleNews,
                    date: dateNews,
                    imgPath: imageNews,
                    content: contentNews,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
