import 'dart:convert';

import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _loadImagePaths(context),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<String>> imagePathsSnapshot,
        ) {
          if (imagePathsSnapshot.connectionState == ConnectionState.done &&
              imagePathsSnapshot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: _buildContent(imagePathsSnapshot.data),
                ),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  //* SLIVERGRID

  SliverGrid _buildContent(List<String> imagePaths) {
    return SliverGrid(
      //Color: Colors.white,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildImageWidget(imagePaths[index]);
        },
        childCount: imagePaths.length,
      ),
    );
  }

//cara ambil gambar dalam folder assets/images
  Future<List<String>> _loadImagePaths(BuildContext context) async {
    final String manifestContentJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContentJson);

    return manifestMap.keys
        .where((String key) => key.contains('assets/images/'))
        .toList();
  }

//
  Widget _buildImageWidget(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
