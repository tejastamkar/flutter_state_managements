import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_getx_app/controllers/assets_controller.dart';
import 'package:my_first_getx_app/models/tracked_asset.dart';
import 'package:my_first_getx_app/screens/details_page.dart';
import 'package:my_first_getx_app/utils/utils.dart';
import 'package:my_first_getx_app/widget/add_asset_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void onPressAddIcon() {
  Get.dialog(AddAssetDialog());
}

class _MyHomePageState extends State<MyHomePage> {
  AssetsController assetsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: 40,
              width: 40,
              imageUrl: "https://i.pravatar.cc/150?img=1",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
        actions: const [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onPressAddIcon,
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [_portfolioValue(context), _trackedAssetsList(context)],
          ),
        ),
      ),
    );
  }

  Widget _portfolioValue(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.03,
      ),
      child: Center(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              const TextSpan(
                text: "\$",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text:
                    "${assetsController.getPortfolioValue().toStringAsFixed(2)}\n",
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: "Portfolio value",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _trackedAssetsList(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.03,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            child: const Text(
              "Portfolio",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.65,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              itemCount: assetsController.trackedAssets.length,
              itemBuilder: (context, index) {
                TrackedAsset trackedAsset =
                    assetsController.trackedAssets[index];
                return ListTile(
                  leading: Image.network(
                    getCryptoImageURL(trackedAsset.name!),
                  ),
                  title: Text(
                    trackedAsset.name!,
                  ),
                  subtitle: Text(
                      "USD: ${assetsController.getAssetPrice(trackedAsset.name!).toStringAsFixed(2)}"),
                  trailing: Text(
                    trackedAsset.amount.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.to(() {
                      return DetailsPage(
                        trackedAsset: trackedAsset,
                        coin: assetsController.getCoinData(trackedAsset.name!)!,
                      );
                    }, transition: Transition.fade);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
