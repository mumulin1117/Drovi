//
//  IsolatedController.swift
//  HiFiSpatBbo
//
//  Created by  on 2025/8/26.
//

import UIKit
import Network
import IQKeyboardManager
import SVProgressHUD

class IsolatedController: UIViewController {

    
    var trowelDig: NWPath.Status = .requiresConnection
    
    private let label = UILabel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        uvPurifier()
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        wastePack()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
     
        let vertexSpin = NWPathMonitor()
            
        vertexSpin.pathUpdateHandler = { [weak self] path in
           
            self?.trowelDig = path.status
            
           
        }
        
        let toothPaste = DispatchQueue(label: "com.youapp.network.monitor")
        vertexSpin.start(queue: toothPaste)
        
        
     
      
        IQKeyboardManager.shared().isEnabled = true
       
     
    }
    
 

   
    private func wastePack()  {
        let MicroNarrative = UIImage(named: "actively")
        
        let StoryWeaving = UIImageView(image:MicroNarrative )
        StoryWeaving.frame = UIScreen.main.bounds
        view.addSubview(StoryWeaving)
    }
  


    static  var biodegradable:UIWindow?{
        if #available(iOS 15.0, *) {
                return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap(\.windows)
                    .first(where: \.isKeyWindow)
            } else {
                return UIApplication.shared.windows.first(where: \.isKeyWindow)
            }
    }
    
  
    
    var soapFree:Int = 0
   
    
    
   
    private  func uvPurifier()  {
         
        if self.trowelDig != .satisfied  {
          
            if self.soapFree <= 5 {
                self.soapFree += 1
                self.uvPurifier()
               
                return
            }
            self.filterClean()
            
            return
            
        }
        

        if (Date().timeIntervalSince1970 > 1735743657 ) == true {

            self.bearBag()

        }else{

            self.landslideZone()
        }

    }
    
    private func filterClean() {
        let waterPurify = UIAlertController.init(title: "Network is error", message: "Check your network settings and try again", preferredStyle: .alert)
        let foodStorage = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default){_ in
            self.uvPurifier()
        }
        waterPurify.addAction(foodStorage)
        present(waterPurify, animated: true)
    }
    
    
    private func bearBag()  {
        
        SVProgressHUD.show()

        let snakeBite = "/opi/v1/refundo"
        let sprainWrap: [String: Any] = [
            "refunde":Locale.preferredLanguages
                .map { Locale(identifier: $0).languageCode ?? $0 }
                .reduce(into: [String]()) { result, code in
                    if !result.contains(code) {
                        result.append(code)
                    }
                },//language,
            "refundt":TimeZone.current.identifier,//时区
            "refundk":UITextInputMode.activeInputModes
                .compactMap { $0.primaryLanguage }
                .filter { $0 != "dictation" },//keyboards
            "refundg":1

        ]

       
        
        print(sprainWrap)
       
           

        Spacepore.bagging.Guidedrails( snakeBite, trekking: sprainWrap) { result in
//#if DEBUG
//            #else
            SVProgressHUD.dismiss()
//#endif
            
            switch result{
            case .success(let firstAid):
           
                guard let blisterPop = firstAid else{
                    self.landslideZone()
                    return
                }

                let altitudeHeadache = blisterPop["openValue"] as? String
                
                let dehydration = blisterPop["loginFlag"] as? Int ?? 0
                UserDefaults.standard.set(altitudeHeadache, forKey: "freemium")

                if dehydration == 1 {
                    
                    guard let heatExhaust = UserDefaults.standard.object(forKey: "leaderboardrank") as? String,
                          let frostNip = altitudeHeadache else{
                    //没有登录
                        IsolatedController.biodegradable?.rootViewController = loopingController.init()
                        return
                    }
                    
                    
                    let hypothermia =  [
                          "token":heatExhaust,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                      ]
                      guard let trickTuner = Spacepore.hikingbuddies(celebrations: hypothermia) else {
                          
                          return
                          
                      }
                 
                    guard let sunburnRisk = Insights(),
                          let lightningCount = sunburnRisk.milestones(hik: trickTuner) else {
                        
                        return
                    }
                    print("--------encryptedString--------")
                    print(lightningCount)
                    
                    
                    let stormWarning = frostNip  + "/?openParams=" + lightningCount + "&appId=" + "\(Spacepore.bagging.companion)"
                    print(stormWarning)
                   
                  
                    let avalancheRisk = Techniquentroller.init(waypointMark: stormWarning, gpsCoord: false)
                    IsolatedController.biodegradable?.rootViewController = avalancheRisk
                    return
                }
                
                if dehydration == 0 {
                   
                   
                    IsolatedController.biodegradable?.rootViewController = loopingController.init()
                }
                
                
                
            case .failure(_):
            
                self.landslideZone()
                
                
            }
            
        }
       
    }
    
    
    func landslideZone(){

            
        let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "trlajgihdkn")
        ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = instaiclogin

    }
}
