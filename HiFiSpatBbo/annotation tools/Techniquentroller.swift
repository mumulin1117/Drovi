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
   
  
    private var ambienceview:WKWebView?
   
    var flanger:TimeInterval = Date().timeIntervalSince1970
    
    private  var transient = false
    private var algorithm:String
    
    init(arranger:String,micStand:Bool) {
        algorithm = arranger
        
        transient = micStand
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        ambienceview?.configuration.userContentController.add(self, name: "rechargePay")
        ambienceview?.configuration.userContentController.add(self, name: "Close")
        ambienceview?.configuration.userContentController.add(self, name: "pageLoaded")
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        ambienceview?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
   
    private func articulation()  {
        let latency = UIImage(named: "actively")
        
        let dubbing = UIImageView(image:latency )
        dubbing.frame = self.view.frame
        dubbing.contentMode = .scaleAspectFill
        view.addSubview(dubbing)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        articulation()
        
       
        
       
        
        if transient == true {
            let  sequencer = UIButton.init()
            sequencer.setBackgroundImage(UIImage(named: "collab"), for: .normal)
            sequencer.isUserInteractionEnabled = false
            view.addSubview(sequencer)
            
            
            sequencer.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
               
                sequencer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                
                sequencer.widthAnchor.constraint(equalToConstant: 290),
                sequencer.heightAnchor.constraint(equalToConstant: 52),
               
                sequencer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 72)
            ])
        }
        
        
        
         
        let latency = WKWebViewConfiguration()
        latency.allowsAirPlayForMediaPlayback = false
        latency.allowsInlineMediaPlayback = true
        latency.preferences.javaScriptCanOpenWindowsAutomatically = true
        latency.mediaTypesRequiringUserActionForPlayback = []
     
      
        ambienceview = WKWebView.init(frame: UIScreen.main.bounds, configuration: latency)
        ambienceview?.isHidden = true
        ambienceview?.translatesAutoresizingMaskIntoConstraints = false
        ambienceview?.scrollView.alwaysBounceVertical = false
        
        ambienceview?.scrollView.contentInsetAdjustmentBehavior = .never
        ambienceview?.navigationDelegate = self
        
        ambienceview?.uiDelegate = self
        ambienceview?.allowsBackForwardNavigationGestures = true
   
        if let distortion = URL.init(string: algorithm) {
            ambienceview?.load(NSURLRequest.init(url:distortion) as URLRequest)
            flanger = Date().timeIntervalSince1970*1000
        }
        self.view.addSubview(ambienceview!)
        
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
        ambienceview?.isHidden = false
        
        
        SVProgressHUD.dismiss()
        if transient == true {
            
            SVProgressHUD.showSuccess(withStatus: "Login successful")
           
        }

        let energy = "/opi/v1/loopedalt"
         let moderation: [String: Any] = [
            "loopedalo":"\(Int(Date().timeIntervalSince1970*1000 - self.flanger))"
         ]
      
        Spacepore.binaural.mainstream( energy, copyright: moderation)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let optIn = message.body as? Dictionary<String,Any> {
           let insight = optIn["batchNo"] as? String ?? ""
           let smartCompose = optIn["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            SVProgressHUD.show()
            
            SwiftyStoreKit.purchaseProduct(insight, atomically: true) { psResult in
                SVProgressHUD.dismiss()
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    let amplifier = psPurch.transaction.downloads
                    
                    
                    if !amplifier.isEmpty {
                        
                        SwiftyStoreKit.start(amplifier)
                    }
                    
                  
                   
                   
                
                    guard let cymbal = SwiftyStoreKit.localReceiptData,
                          let hiHat = psPurch.transaction.transactionIdentifier,
                          hiHat.count > 5
                    else {
                        SVProgressHUD.showInfo(withStatus: "No have receipt or ID is error")
                        
                        return
                      }
                    
                    guard let articulation = try? JSONSerialization.data(withJSONObject: ["orderCode":smartCompose], options: [.prettyPrinted]),
                          let scratch = String(data: articulation, encoding: .utf8) else{
                        SVProgressHUD.showInfo(withStatus: "orderCode  trans error")
                        
                      
                        return
                    }

                    Spacepore.binaural.mainstream(royalty: true,"/opi/v1/riffp", copyright: [
                        "riffp":cymbal.base64EncodedString(),//payload
                        "rifft":hiHat,//transactionId
                        "riffc":scratch//callbackResult
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
           
            let metronome = UINavigationController.init(rootViewController: loopingController.init())
            metronome.navigationBar.isHidden = true
            
            var midi:UIWindow?
            if let trimming = (UIApplication.shared.connectedScenes
                .first { $0.activationState == .foregroundActive } as? UIWindowScene)?
                .windows
                .first(where: \.isKeyWindow)  {
                midi = trimming
                
            }
            
            midi?.rootViewController = metronome
        }
        
        if message.name == "pageLoaded" {
            ambienceview?.isHidden = false
            SVProgressHUD.dismiss()
            
        }
    }
    
}
