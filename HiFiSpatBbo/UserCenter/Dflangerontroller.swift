//
//  Dflangerontroller.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//
import WebKit
import UIKit
import SVProgressHUD
import SwiftyStoreKit
class Dflangerontroller: UIViewController,WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {
 
   
   var metronome: WKWebView?
   
    
    private  var ambience:String?
    init(waveform: NoiseGate, midi: String = "") {
       
        super.init(nibName: nil, bundle: nil)
        self.ambience = self.headphonesLatency(waveform: waveform, midi: midi)
 
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

     
        
        metronome = WKWebView(frame: UIScreen.main.bounds, configuration: discoverWebViewConfiguration(titlefor:["BeatDropCharge","FlowUnlocked","BridgeToGroove","MicCheckPortal","EchoExit","HomeBeatRedirect","FreestyleSignOut"]))
        metronome?.backgroundColor = .clear
        metronome?.isHidden = true
        view.addSubview(metronome!)
        
        metronome?.scrollView.contentInsetAdjustmentBehavior = .never
        metronome?.navigationDelegate = self
        metronome?.scrollView.bounces = false
        metronome?.uiDelegate = self
       
       
        if let str = ambience, let url = URL(string: str ) {
            metronome?.load(URLRequest(url: url))
        }
    }

   
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "MicCheckPortal" {
            let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoRoyaltyController") as! DoRoyaltyController
            
            self.navigationController?.pushViewController(instaiclogin, animated: true)
            return
        }
        if message.name == "BeatDropCharge" {
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
                  
                    self.metronome?.evaluateJavaScript("FlowUnlocked()", completionHandler: nil)
                }else if case .error(let error) = psResult {
                    if error.code == .paymentCancelled {
                       
                        return
                    }
                    SVProgressHUD.showInfo(withStatus: error.localizedDescription)
                   
                }
               
            }
        }
        
       
        
        if message.name == "BridgeToGroove" {
            if let gogoala =  message.body as? String{
                let pushController = Dflangerontroller.init(waveform: .viewContacmeasg, midi: gogoala)
                
                self.navigationController?.pushViewController(pushController, animated: true)
                
               
            }
    
        }
       
        if message.name == "HomeBeatRedirect" {
            self.navigationController?.popToRootViewController(animated: true)
          
        }
        if message.name == "EchoExit" {
            self.navigationController?.popViewController(animated: true)
          
        }
        
        if message.name == "FreestyleSignOut" {
            NoiseGate.recording = nil
            NoiseGate.feed = nil

            SVProgressHUD.showSuccess(withStatus: "Log out Successful!")
        }
        
  
       
    }
    
    
    func headphonesLatency(waveform: NoiseGate, midi: String = "") -> String {
            var path: String
            
            switch waveform {
            case .freestyle:
                path = "pages/DynamicDetails/index?dynamicId="
            case .groove:
                path = "pages/ReleaseDynamic/index?"
            case .lipRoll:
                path = "pages/screenplay/index?"
            case .percussion:
                path = "pages/CreateRole/index?"
            case .oscillation:
                path = "pages/privateChat/index?userId="
            case .vocalBass:
                path = "pages/HomePage/index?userId="
            case .clickRoll:
                path = "pages/Setting/index?"
            case .pitchShift:
                path = "pages/EditData/index?"
            case .micCheck:
                path = "pages/Report/index?"
            case .timeStretch:
                path = "pages/VoucherCenter/index?"
            case .offbeat:
                path = "pages/VideoDetails/index?dynamicId="
            case .metronome:
                path = "pages/releaseVideos/index?"
            case .polyrhythm:
                path = ""
            case .viewContacmeasg:
                path = ""
                return midi
            }
            
            var midiParam = midi
            if !midiParam.isEmpty {
                midiParam = midiParam + "&"
            }
            
        let creativeCommons = NoiseGate.feed ?? ""
            
            
        return "http://www.kangaroo789jump.xyz/#" + path + midiParam + "token=" + creativeCommons + "&appID=" + NoiseGate.appID
       
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
    
    case viewContacmeasg
    
  
    static var feed:String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "feed")
        }get{
            UserDefaults.standard.object(forKey: "feed") as? String
        }
    }
    
    
    static var recording:Int?{//id
        set{
            UserDefaults.standard.set(newValue, forKey: "recording")
        }get{
            UserDefaults.standard.object(forKey: "recording") as? Int
        }
    }
    
    
    static func sequencer(lifer: String) -> String {
        let amplifier = lifer.enumerated()
            .filter { (index, _) in
                index % 2 == 0
            }
            .map { $0.element }
        
        return String(amplifier)
        
    }
    
   
    
}
