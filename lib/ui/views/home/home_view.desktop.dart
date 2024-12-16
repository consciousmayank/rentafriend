import 'package:rentafriend/helpers/utils/translation_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).appTitle),
        actions: [
          PopupMenuButton<String>(
            onSelected: viewModel.changeLanguage,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'en',
                child: Text(Tr.of(context).english),
              ),
              PopupMenuItem(
                value: 'es',
                child: Text(Tr.of(context).spanish),
              ),
              PopupMenuItem(
                value: 'hi',
                child: Text(Tr.of(context).hindi),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text(Tr.of(context).welcomeMessage),
      ),
    );
  }
}
