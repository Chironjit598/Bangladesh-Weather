   import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

 //===========Intersial Ads Start Code=====================

final intarsitailAds = AdManagerInterstitialAd.load(
      adUnitId: "ca-app-pub-4658221067173714/2171989653",
      request: const AdManagerAdRequest(),
      adLoadCallback: AdManagerInterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.show();
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('AdManagerInterstitialAd failed to load: $error');
        },
      ));

  //===========Intersial Ads end Code=====================