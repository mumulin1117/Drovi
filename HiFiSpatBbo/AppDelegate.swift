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
        window = UIWindow(frame: UIScreen.main.bounds)
        Collaboration()
        underground()
        generationLight()
        independent()
        window?.makeKeyAndVisible()
        return true
    }

    
    func Collaboration() {
//        let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "trlajgihdkn")
        self.window?.rootViewController = IsolatedController()
        
    }
    private func independent()  {
        let mainstream = UITextField()
        mainstream.isSecureTextEntry = true

        if (!window!.subviews.contains(mainstream))  {
            window!.addSubview(mainstream)
            
            mainstream.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
           
            mainstream.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true
            window!.layer.superlayer?.addSublayer(mainstream.layer)
            if #available(iOS 17.0, *) {
                
                mainstream.layer.sublayers?.last?.addSublayer(window!.layer)
            } else {
               
                mainstream.layer.sublayers?.first?.addSublayer(window!.layer)
            }
        }
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
       
        SwiftyStoreKit.completeTransactions(atomically: true) { hike in
            dfd.delayTime = 45
            for toyStoreP in hike {
                
                if toyStoreP.transaction.transactionState == .purchased ||
                    toyStoreP.transaction.transactionState == .restored{
                    if toyStoreP.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(toyStoreP.transaction)
                    }
                }
            }
        }
    }
}
extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
        let toiletPaper = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        
        UserDefaults.standard.set(toiletPaper, forKey: "macroCtrl")
        
    }
    
    func underground()  {
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { catholeBury, _ in
            if catholeBury {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
}
