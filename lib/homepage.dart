import 'package:flutter/material.dart';
import 'detailpage.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, String>> travelData;
  const Homepage({super.key, required this.travelData});

  void _openDetail(BuildContext context, Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(item: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('katalog wisata'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.view_agenda_sharp), text: 'List View'),
              Tab(icon: Icon(Icons.grid_view_rounded), text: 'Grid View'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(context),
            buildGridView(context),
          ],
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: travelData.length,
      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            onTap: () => _openDetail(context, item),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: item['nama']!,
                child: Image.network(
                  item['gambar']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(item['nama']!),
            subtitle: Text(item['lokasi']!),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: travelData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _openDetail(context, item),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(item['gambar']!, fit: BoxFit.cover),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black87, Colors.transparent],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item['nama']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item['lokasi']!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}