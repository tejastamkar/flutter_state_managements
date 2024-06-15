import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_getx_app/controllers/assets_controller.dart';
import 'package:my_first_getx_app/models/api_response.dart';
import 'package:my_first_getx_app/services/http_service.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class AddAssetDialogController extends GetxController {
  AddAssetDialogController();

  RxList<String> assets = <String>[].obs;
  RxBool loading = true.obs;
  RxString selectedAsset = "".obs;
  RxDouble amount = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    _getAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    HTTPService httpService = Get.find();
    var responseData = await httpService.get("currencies");
    CurrenciesListAPIResponse currenciesListAPIResponse =
        CurrenciesListAPIResponse.fromJson(responseData);
    currenciesListAPIResponse.data?.forEach((coin) {
      assets.add(coin.name!);
    });
    selectedAsset.value = assets.first;
    loading.value = false;
  }
}

class AddAssetDialog extends StatelessWidget {
  final controller = Get.put(AddAssetDialogController());
  AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Material(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: _buildUi(context: context)),
        ),
      ),
    );
  }

  void onChangeDropDownMenu(String? value) {
    if (value == null) return;
    controller.selectedAsset.value = value;
  }

  void onPressAddAsset() {
    AssetsController assetsController = Get.find();
    assetsController.addTrackedAsset(
        controller.selectedAsset.value, controller.amount.value);
    Get.back(closeOverlays: true);
  }

  Widget _buildUi({required BuildContext context}) {
    if (controller.loading.isTrue) {
      return const Center(
        child:
            SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton(
              items: controller.assets.map((String assets) {
                return DropdownMenuItem<String>(
                  value: assets,
                  child: Text(assets),
                );
              }).toList(),
              value: controller.selectedAsset.value,
              onChanged: onChangeDropDownMenu),
          TextField(
            onChanged: (value) {
              if (value.isEmpty) return;
              controller.amount.value = double.parse(value);
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Amount',
            ),
          ),
          MaterialButton(
              textColor: context.colorScheme.onPrimary,
              color: context.colorScheme.primary,
              onPressed: onPressAddAsset,
              child: const Text("Add Assets"))
        ],
      ),
    );
  }
}
