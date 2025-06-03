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
        SwiftyStoreKit.completeTransactions(atomically: true) { _ in
            
        }
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
