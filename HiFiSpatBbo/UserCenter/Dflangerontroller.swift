//
//  Dflangerontroller.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//
import WebKit
import UIKit
import SVProgressHUD
import SwiftyStoreKit
class Dflangerontroller: UIViewController,WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {
 
   
   var metronome: WKWebView?
    
    private  var spectrum:String
    init(_spectrum: String) {
        
        self.spectrum = _spectrum
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    func discoverWebViewConfiguration(titlefor:[String]) -> WKWebViewConfiguration {
        let backbeat = WKWebViewConfiguration.init()
        
        
        backbeat.allowsInlineMediaPlayback = true
//        if titlefor.count >  {
//            
//        }
        backbeat.mediaTypesRequiringUserActionForPlayback = []

        backbeat.preferences.javaScriptCanOpenWindowsAutomatically = true
        if titlefor.count > 0 {
            titlefor.forEach { handler in
                backbeat.userContentController.add(self, name: handler)
            }
        }
       
        return backbeat
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bluetooth = UIImageView(image: UIImage.init(named: "commentary"))
        view.addSubview(bluetooth)
        bluetooth.frame = UIScreen.main.bounds
        SVProgressHUD.show()

     
        
        metronome = WKWebView(frame: UIScreen.main.bounds, configuration: discoverWebViewConfiguration(titlefor:[]))
        
        
       
        metronome?.scrollView.contentInsetAdjustmentBehavior = .never
        metronome?.navigationDelegate = self
        metronome?.scrollView.bounces = false
        metronome?.uiDelegate = self
       
        if  let url = URL(string: spectrum ) {
            metronome?.load(URLRequest(url: url))
        }
        
    }

   
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "triggerCreativeFuelFlow" {
            guard let hiHat = message.body  as? String else {
                return
            }
          
            SVProgressHUD.show()
            self.view.isUserInteractionEnabled = false
            SwiftyStoreKit.purchaseProduct(hiHat, atomically: true) { psResult in
                SVProgressHUD.dismiss()
                
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    SVProgressHUD.showSuccess(withStatus: "pay successful!")
                  
                    self.metronome?.evaluateJavaScript("handleArtistryBoostConfirmation()", completionHandler: nil)
                }else if case .error(let error) = psResult {
                    if error.code == .paymentCancelled {
                       
                        return
                    }
                    SVProgressHUD.showInfo(withStatus: error.localizedDescription)
                   
                }
               
            }
        }
        
       
        
        if message.name == "launchCanvasPortalView" {
            if let hiHat =  message.body as? String{
                let pushController = Dflangerontroller.init(_spectrum: hiHat)
                
                self.navigationController?.pushViewController(pushController, animated: true)
                
               
            }
    
        }
       
           
        if message.name == "dismissCanvasOverlay" {
            self.navigationController?.popViewController(animated: true)
          
        }
        
        if message.name == "terminatePaletteSession" {
            
//            RebellionController.clearUserSession()
//            
//            let dreamsController = UINavigationController.init(rootViewController:  MMopoetryController.init())
//            dreamsController.navigationBar.isHidden = true
//            
//            
//            ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = dreamsController
            
         
        }
        
  
       
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
            self.metronome?.isHidden = false
            SVProgressHUD.dismiss()
        }))
        
    }
    
}




enum NoiseGate {
    static let appID = "31975068"
    
    case freestyle
    case groove
    case lipRoll
    case percussion
    case oscillation
    case vocalBass
    case clickRoll
    case pitchShift
    case micCheck
    case timeStretch
    case offbeat
    
    case metronome
  
    case polyrhythm
    
   
    var waveform: String {
        switch self {
        case .freestyle :return "pages/DynamicDetails/index?dynamicId=?"
        case .groove : return "pages/ReleaseDynamic/index"
        case .lipRoll:return "pages/screenplay/index?"
        case .percussion:return "pages/CreateRole/index?"
        case .oscillation:return "pages/privateChat/index?userId="
        case .vocalBass:return "pages/HomePage/index?userId="
        case .clickRoll:return "pages/Setting/index?"
        case .pitchShift:return "pages/EditData/index?"
        case .micCheck:return  "pages/Report/index?"
        case .timeStretch :return "pages/VoucherCenter/index?"
        case .offbeat:return "pages/VideoDetails/index?dynamicId="
        
        case .metronome:return "pages/releaseVideos/index"
       
        case .polyrhythm :return ""
        }
        
    }
    
    static func sequencer(lifer: String) -> String {
        let amplifier = lifer.enumerated()
            .filter { (index, _) in
                index % 2 == 0 // 保持原始筛选逻辑
            }
            .map { $0.element }
        
        return String(amplifier)
        
    }
    
    func headphonesLatency(midi:String = "") -> String {
        var midi = midi
        
        if midi != "" {
            midi = midi + "&"
        }
        
        let creativeCommons = ""//toknr
        
        return "http://www.kangaroo789jump.xyz/#"  + self.waveform + midi  + "token=" + creativeCommons + "&appID=" + NoiseGate.appID
    }
    
}
