import 'package:flutter/material.dart';
import 'package:flutter_codigo_whatsapp_clone/pages/chat_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 2.5,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Text(
              "CHAT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "STATUS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "CALLS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text("camera"),
          ),
          ChatPage(),
          Center(
            child: Text("status"),
          ),
          Center(
            child: Text("call"),
          ),
        ],
      ),
    );
  }
}
