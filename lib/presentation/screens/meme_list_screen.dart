import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../providers/meme_provider.dart';
import '../widgets/meme_card.dart';
/*
**************************************************
*        📱 Mobile App Developer - Tanvir         *
*------------------------------------------------ *
*  🚀 Native & Hybrid App Development Expert      *
*  💼 Tech Stack: Flutter | Jetpack | Firebase    *
*  📧 Email: dev.tanvirchy269@gmail.com           *
*  🌐 GitHub: https://github.com/tanvir-chy-ahmed *
*  📍 Location: Bangladesh                        *
*                                                 *
*  Need an app? Let’s build something great!      *
**************************************************
*/
class MemeListScreen extends StatefulWidget {
  const MemeListScreen({Key? key}) : super(key: key);

  @override
  State<MemeListScreen> createState() => _MemeListScreenState();
}

class _MemeListScreenState extends State<MemeListScreen> {
  @override
  void initState() {
    super.initState();
    // Load memes when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MemeProvider>().loadMemes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meme Gallery'),
        actions: [
          // Refresh button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<MemeProvider>().loadMemes(),
          ),
        ],
      ),
      body: Consumer<MemeProvider>(
        builder: (context, provider, child) {
          switch (provider.state) {
            case LoadingState.initial:
            case LoadingState.loading:
              return _buildLoadingView();
            case LoadingState.loaded:
              return _buildMemeGrid(provider);
            case LoadingState.error:
              return _buildErrorView(provider.errorMessage);
          }
        },
      ),
    );
  }

  // Loading shimmer effect placeholder
  Widget _buildLoadingView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200 + (index % 3) * 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }

  // Meme grid view with masonry layout
  Widget _buildMemeGrid(MemeProvider provider) {
    if (provider.memes.isEmpty) {
      return const Center(
        child: Text('No memes available'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: RefreshIndicator(
        onRefresh: () => provider.loadMemes(),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: provider.memes.length,
          itemBuilder: (context, index) {
            final meme = provider.memes[index];
            return MemeCard(meme: meme);
          },
        ),
      ),
    );
  }

  // Error view
  Widget _buildErrorView(String errorMessage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              'Something went wrong!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.read<MemeProvider>().loadMemes(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
} 