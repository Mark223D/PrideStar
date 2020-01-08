//
//  ViewController.swift
//  PrideStar
//
//  Created by Mark Debbane on 1/8/20.
//  Copyright © 2020 Mark Debbane. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate, GADRewardBasedVideoAdDelegate {
    
    @IBOutlet weak var bannerLaunchBtn: UIButton!
    @IBOutlet weak var interstitialLaunchBtn: UIButton!
    @IBOutlet weak var rewardedLaunchBtn: UIButton!
    
    @IBOutlet weak var bannerContainerView: GADBannerView!
    @IBOutlet weak var closeBannerBtn: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var interstitial: GADInterstitial!
    
    let adManager: AdManager = AdManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAds()
        self.pointsLabel.text = "0"
    }
    
    func setupAds(){
        adManager.setupBannerAds(bannerContainerView, self)
        setupInterstitialAds()
        adManager.setupRewardedAds(self)
    }
    
    
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        self.pointsLabel.text = "\(reward.amount)"
        
    }
    func setupInterstitialAds(){
        // Mark: - INTERSTITIAL ADS
        
        
        interstitial = createAndLoadInterstitial()
        interstitial.delegate = self
    }
    
    @IBAction func closePressed(_ sender: Any) {
        closeBannerBtn.isHidden = true
        bannerContainerView.isHidden = true
    }
    
    @IBAction func bannerPressed(_ sender: Any) {
        closeBannerBtn.isHidden = false
        bannerContainerView.isHidden = false
        bannerContainerView.load(GADRequest())
        
    }
    
    
    @IBAction func interstitialPressed(_ sender: Any) {
        let request = GADRequest()
        interstitial.load(request)
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            let alert = UIAlertController(title: "Add Not Ready", message: "Ad is not ready to show yet. Try again later.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: adManager.interstitialUID)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }
    
    
    @IBAction func rewardedPressed(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        } else {
            let alert = UIAlertController(title: "Add Not Ready", message: "Ad is not ready to show yet. Try again later.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
      GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: adManager.rewardedUID)
    }
}

