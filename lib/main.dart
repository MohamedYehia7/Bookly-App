import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/views/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/components/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'core/functions/setup_service_locator.dart';
import 'core/functions/single_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setupServiceLocator();
  Bloc.observer = SingleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
