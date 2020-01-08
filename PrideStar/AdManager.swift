//
//  AdManager.swift
//  PrideStar
//
//  Created by Mark Debbane on 1/8/20.
//  Copyright © 2020 Mark Debbane. All rights reserved.
//

import Foundation
import GoogleMobileAds

class AdManager {
    let bannerUID = "ca-app-pub-3940256099942544/2934735716"
    let interstitialUID = "ca-app-pub-3940256099942544/4411468910"
    let rewardedUID = "ca-app-pub-3940256099942544/1712485313"
    
    

    func setupBannerAds(_ bannerContainerView: GADBannerView, _ vc: GADBannerViewDelegate){
        // Mark: - BANNER ADS
        bannerContainerView.adUnitID = bannerUID
        bannerContainerView.rootViewController = vc as? UIViewController
        bannerContainerView.delegate = vc
        
    }
    
  
    func setupRewardedAds(_ vc: GADRewardBasedVideoAdDelegate){
        
        // Mark: - REWARDED ADS
        GADRewardBasedVideoAd.sharedInstance().delegate = vc
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),
                                                    withAdUnitID: rewardedUID)
        
        
    }
    

    
}
