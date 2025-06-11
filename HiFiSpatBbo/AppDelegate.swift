//
//  AppDelegate.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/27.
//

import UIKit
import SwiftyStoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        generationLight()
       
        return true
    }

  

}



class SjuiTAbar:UITabBarController{
    private(set) var previousSelectedIndex: Int = 0
        
    override var selectedIndex: Int {
        didSet {
            previousSelectedIndex = oldValue
        }
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            if let newIndex = viewControllers?.firstIndex(of: selectedViewController!) {
                previousSelectedIndex = oldValue != nil ? viewControllers!.firstIndex(of: oldValue!)! : 0
               
            }
        }
    }
}


extension AppDelegate{
    
    
    func generationLight()  {
        var dfd = StagePreset.init(name: "Se", reverbLevel: 23, delayTime: 23, eqProfile: (23,23,23), lightingPattern: LightingStyle.clubPulse)
        SwiftyStoreKit.completeTransactions(atomically: true) { _ in
            dfd.delayTime = 45
        }
    }
}
