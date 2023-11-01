import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
