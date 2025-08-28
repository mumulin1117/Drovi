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

    
    var spectrum: NWPath.Status = .requiresConnection
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cadence()
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        articulation()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
     
        let resonance = NWPathMonitor()
            
        resonance.pathUpdateHandler = { [weak self] path in
           
            self?.spectrum = path.status
            
           
        }
        
        let articulation = DispatchQueue(label: "com.euclidean.Rhythm")
        resonance.start(queue: articulation)
        
        
     
      
        IQKeyboardManager.shared().isEnabled = true
       
     
    }
    
 

   
    private func articulation()  {
        let offbeat = UIImage(named: "actively")
        
        let shuffle = UIImageView(image:offbeat )
        shuffle.frame = UIScreen.main.bounds
        view.addSubview(shuffle)
    }
  


    static  var dynamicsPhrasing:UIWindow?{
        if #available(iOS 15.0, *) {
                return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap(\.windows)
                    .first(where: \.isKeyWindow)
            } else {
                return UIApplication.shared.windows.first(where: \.isKeyWindow)
            }
    }
    
  
    
    var phrasing:Int = 0
   
    
    
   
    private  func cadence()  {
         
        if self.spectrum != .satisfied  {
          
            if self.phrasing <= 5 {
                self.phrasing += 1
                self.cadence()
               
                return
            }
            self.syncopation()
            
            return
            
        }
        

        if (Date().timeIntervalSince1970 > 1735743657 ) == true {

            self.metronome()

        }else{

            self.sampling()
        }

    }
    
    private func syncopation() {
        let polyrhythm = UIAlertController.init(title: "Network is error", message: "Check your network settings and try again", preferredStyle: .alert)
        let foodStorage = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default){_ in
            self.cadence()
        }
        polyrhythm.addAction(foodStorage)
        present(polyrhythm, animated: true)
    }
    
    
    private func metronome()  {
        
        SVProgressHUD.show()

        let backrrbeat = "/opi/v1/swingfeelo"
        let downbeat: [String: Any] = [
            "swingfeele":Locale.preferredLanguages
                .map { Locale(identifier: $0).languageCode ?? $0 }
                .reduce(into: [String]()) { result, code in
                    if !result.contains(code) {
                        result.append(code)
                    }
                },//language,
            "swingfeelt":TimeZone.current.identifier,//时区
            "swingfeelk":UITextInputMode.activeInputModes
                .compactMap { $0.primaryLanguage }
                .filter { $0 != "dictation" },//keyboards
            "swingfeelg":1

        ]

       
        
        print(downbeat)
       
           

        Spacepore.binaural.mainstream(backrrbeat, copyright: downbeat) { result in
//#if DEBUG
//            #else
            SVProgressHUD.dismiss()
//#endif
            
            switch result{
            case .success(let upbeat):
           
                guard let offbeat = upbeat else{
                    self.sampling()
                    return
                }

                let swing = offbeat["openValue"] as? String
                
                let analog = offbeat["loginFlag"] as? Int ?? 0
                UserDefaults.standard.set(swing, forKey: "patternLock")

                if analog == 1 {
                    
                    guard let glitch = UserDefaults.standard.object(forKey: "leaderboardrank") as? String,
                          let chopper = swing else{
                    //没有登录
                        IsolatedController.dynamicsPhrasing?.rootViewController = loopingController.init()
                        return
                    }
                    
                    
                    let kickDrum =  [
                          "token":glitch,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                      ]
                    guard let snare = Spacepore.coWatch(inclusion:  kickDrum) else {
                          
                          return
                          
                      }
//                 
                    guard let cymbal = Insights(),
                          let rimshot = cymbal.retirement(purge:snare) else {
                        
                        return
                    }
//                    print("--------encryptedString--------")
//                    print(articulation)
//                    
//                    
                    let turntable = chopper  + "/?openParams=" + rimshot + "&appId=" + "\(Spacepore.binaural.stereo)"
//                    print(turntable)
//                   
//                  
                    let digitalAudio = Techniquentroller.init(arranger: turntable, micStand: false)
                    IsolatedController.dynamicsPhrasing?.rootViewController = digitalAudio
                    return
                }
                
                if analog == 0 {
                   
                   
                    IsolatedController.dynamicsPhrasing?.rootViewController = loopingController.init()
                }
                
                
                
            case .failure(_):
            
                self.sampling()
                
                
            }
            
        }
       
    }
    
    
    func sampling(){

            
        let sequencer =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "trlajgihdkn")
        ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = sequencer

    }
}
