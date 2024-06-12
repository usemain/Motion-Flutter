import 'package:flutter/material.dart';

import '../screens/dashboard/home/index.dart';
import '../screens/dashboard/more/index.dart';
import '../screens/dashboard/notice/index.dart';
import '../screens/dashboard/my/index.dart';

// 底部导航栏
final List<Widget> tabBarPages = [
  const HomePage(),
  const MorePage(),
  const NoticePage(),
  const MyPage(),
];

List<BottomNavigationBarItem> buildTabBarItems() {
  return [
    buildBottomNavigationBarItem(Icons.grain, '首页'),
    buildBottomNavigationBarItem(Icons.search, '搜索'),
    buildBottomNavigationBarItem(Icons.insights, '统计'),
    buildBottomNavigationBarItem(Icons.person, '我的'),
  ];
}

BottomNavigationBarItem buildBottomNavigationBarItem(
    IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Container(
      margin: const EdgeInsets.only(bottom: 1),
      child: Icon(icon),
    ),
    activeIcon: Container(
      margin: const EdgeInsets.only(bottom: 1),
      child: Icon(icon),
    ),
    label: label,
  );
}

// 主题
const List<Map> items = [
  {'title': '浅色', 'type': 'Light'},
  {'title': '深色', 'type': 'Dark'},
];

// 个人中心菜单栏
const List<Map> myMenus = [
  {'title': '主题', 'icon': Icons.palette_outlined},
];

// 周
const weekMap = ['一', '二', '三', '四', '五', '六', '日'];

