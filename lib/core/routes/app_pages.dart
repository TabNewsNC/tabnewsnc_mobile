import 'package:get/get.dart';
import 'package:tabnewsnc/core/bindings/comment_page_binding.dart';
import 'package:tabnewsnc/core/bindings/favorite_page_binding.dart';
import 'package:tabnewsnc/core/bindings/home_page_binding.dart';
import 'package:tabnewsnc/core/bindings/news_page_binding.dart';
import 'package:tabnewsnc/core/bindings/root_page_binding.dart';
import 'package:tabnewsnc/core/routes/app_routes.dart';
import 'package:tabnewsnc/modules/comment/presentation/comment_page.dart';
import 'package:tabnewsnc/modules/news/presentation/news_page.dart';
import 'package:tabnewsnc/modules/root/root_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage<void>(
      title: 'TabNews',
      name: AppRoutes.initial,
      page: RootPage.new,
      bindings: const [
        RootPageBinding(),
        HomePageBinding(),
        FavoritePageBinding(),
      ],
    ),
    GetPage<void>(
      title: 'News',
      name: AppRoutes.news,
      page: NewsPage.new,
      binding: NewsPageBinding(),
    ),
    GetPage<void>(
      title: 'Comment',
      name: AppRoutes.comment,
      page: CommentPage.new,
      binding: CommentPageBinding(),
    ),
  ];
}
