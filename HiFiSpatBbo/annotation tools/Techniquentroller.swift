//
//  Techniquentroller.swift
//  HiFiSpatBbo
//
//  Created by  on 2025/8/26.
//

import UIKit
import WebKit
import SVProgressHUD
import SwiftyStoreKit

class Techniquentroller: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
   
  
    private var trailClosed:WKWebView?
   
    var gpsCoord:TimeInterval = Date().timeIntervalSince1970
    
    private  var gradePercent = false
    private var altitudeLoss:String
    
    init(waypointMark:String,gpsCoord:Bool) {
        altitudeLoss = waypointMark
        
        gradePercent = gpsCoord
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        trailClosed?.configuration.userContentController.add(self, name: "rechargePay")
        trailClosed?.configuration.userContentController.add(self, name: "Close")
        trailClosed?.configuration.userContentController.add(self, name: "pageLoaded")
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        trailClosed?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
   
    private func mapGrid()  {
        let gradePercent = UIImage(named: "actively")
        
        let altitudeLoss = UIImageView(image:gradePercent )
        altitudeLoss.frame = self.view.frame
        altitudeLoss.contentMode = .scaleAspectFill
        view.addSubview(altitudeLoss)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mapGrid()
        
       
        
       
        
        if gradePercent == true {
            let  elevationGain = UIButton.init()
            elevationGain.setBackgroundImage(UIImage(named: "collab"), for: .normal)
            elevationGain.isUserInteractionEnabled = false
            view.addSubview(elevationGain)
            
            
            elevationGain.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
               
                elevationGain.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                
                elevationGain.widthAnchor.constraint(equalToConstant: 290),
                elevationGain.heightAnchor.constraint(equalToConstant: 52),
               
                elevationGain.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 72)
            ])
        }
        
        
        
         
        let mileMarker = WKWebViewConfiguration()
        mileMarker.allowsAirPlayForMediaPlayback = false
        mileMarker.allowsInlineMediaPlayback = true
        mileMarker.preferences.javaScriptCanOpenWindowsAutomatically = true
        mileMarker.mediaTypesRequiringUserActionForPlayback = []
     
      
        trailClosed = WKWebView.init(frame: UIScreen.main.bounds, configuration: mileMarker)
        trailClosed?.isHidden = true
        trailClosed?.translatesAutoresizingMaskIntoConstraints = false
        trailClosed?.scrollView.alwaysBounceVertical = false
        
        trailClosed?.scrollView.contentInsetAdjustmentBehavior = .never
        trailClosed?.navigationDelegate = self
        
        trailClosed?.uiDelegate = self
        trailClosed?.allowsBackForwardNavigationGestures = true
   
        if let trickTrapper = URL.init(string: altitudeLoss) {
            trailClosed?.load(NSURLRequest.init(url:trickTrapper) as URLRequest)
            gpsCoord = Date().timeIntervalSince1970*1000
        }
        self.view.addSubview(trailClosed!)
        
        SVProgressHUD.show()
       
    }
    
    
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       
        decisionHandler(.allow)
        
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let resupplyPlan = navigationAction.request.url {
                    UIApplication.shared.open(resupplyPlan,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        trailClosed?.isHidden = false
        
        
        SVProgressHUD.dismiss()
        if gradePercent == true {
            
            SVProgressHUD.showSuccess(withStatus: "Login successful")
           
        }

        let trailBudget = "/opi/v1/loopedalt"
         let wearableWeight: [String: Any] = [
            "loopedalo":"\(Int(Date().timeIntervalSince1970*1000 - self.gpsCoord))"
         ]
      
        Spacepore.bagging.Guidedrails( trailBudget, trekking: wearableWeight)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let consumable = message.body as? Dictionary<String,Any> {
           let baseWeight = consumable["batchNo"] as? String ?? ""
           let packWeight = consumable["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            SVProgressHUD.show()
            
            SwiftyStoreKit.purchaseProduct(baseWeight, atomically: true) { psResult in
                SVProgressHUD.dismiss()
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    let gearShakedown = psPurch.transaction.downloads
                    
                    
                    if !gearShakedown.isEmpty {
                        
                        SwiftyStoreKit.start(gearShakedown)
                    }
                    
                  
                   
                   
                
                    guard let trekkingTip = SwiftyStoreKit.localReceiptData,
                          let carabinerClip = psPurch.transaction.transactionIdentifier,
                          carabinerClip.count > 5
                    else {
                        SVProgressHUD.showInfo(withStatus: "No have receipt or ID is error")
                        
                        return
                      }
                    
                    guard let ropeCoil = try? JSONSerialization.data(withJSONObject: ["orderCode":packWeight], options: [.prettyPrinted]),
                          let eyeMask = String(data: ropeCoil, encoding: .utf8) else{
                        SVProgressHUD.showInfo(withStatus: "orderCode  trans error")
                        
                      
                        return
                    }

                    Spacepore.bagging.Guidedrails(whatPath: true,"/opi/v1/riffp", trekking: [
                        "riffp":trekkingTip.base64EncodedString(),//payload
                        "rifft":carabinerClip,//transactionId
                        "riffc":eyeMask//callbackResult
                    ]) { result in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch result{
                        case .success(_):
                         
                            SVProgressHUD.showSuccess(withStatus: "The purchase was successful!")
                            
                        case .failure(let error):
                          
                            SVProgressHUD.dismiss()
                        }
                    }
                    
                    if psPurch.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(psPurch.transaction)
                       
                    }
                   
                    
                    
                }else if case .error(let error) = psResult {
                    
                    self.view.isUserInteractionEnabled = true
                    
                    if error.code != .paymentCancelled {
                       
                        SVProgressHUD.showInfo(withStatus: error.localizedDescription)
                        return
                    }
                    
                 
                }
            }
            
        }else if message.name == "Close" {

            UserDefaults.standard.set(nil, forKey: "leaderboardrank")// 清除本地token
           
            let pillowStuff = UINavigationController.init(rootViewController: loopingController.init())
            pillowStuff.navigationBar.isHidden = true
            
            var sleepPad:UIWindow?
            if let giggleGardener = (UIApplication.shared.connectedScenes
                .first { $0.activationState == .foregroundActive } as? UIWindowScene)?
                .windows
                .first(where: \.isKeyWindow)  {
                sleepPad = giggleGardener
                
            }
            
            sleepPad?.rootViewController = pillowStuff
        }
        
        if message.name == "pageLoaded" {
            trailClosed?.isHidden = false
            SVProgressHUD.dismiss()
            
        }
    }
    
}
