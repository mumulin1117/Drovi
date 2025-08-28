//
//  loopingController.swift
//  HiFiSpatBbo
//
//  Created by  on 2025/8/26.
//

import UIKit
import CoreLocation
import SVProgressHUD

class loopingController: UIViewController ,CLLocationManagerDelegate {
    
   
    
    private let arranger = CLLocationManager()
   
    
    
    private var composer:String = ""
   
    private  var producerdd:NSNumber = 0.0
    private  var micStand:NSNumber = 0.0
    private func headphones()  {
        let amplifier = UIImage(named: "actively")
        
        let interface = UIImageView(image:amplifier )
        interface.frame = self.view.frame
        interface.contentMode = .scaleAspectFill
        view.addSubview(interface)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        headphones()
        
        let  bluetooth = UIButton.init()
        bluetooth.setBackgroundImage(UIImage(named: "collab"), for: .normal)
    
        view.addSubview(bluetooth)
        
        
        bluetooth.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
           
            bluetooth.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            bluetooth.widthAnchor.constraint(equalToConstant: 290),
            bluetooth.heightAnchor.constraint(equalToConstant: 52),
           
            bluetooth.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 72)
        ])
        
        bluetooth.addTarget(self, action: #selector(bitrate), for: .touchUpInside)
      
      
        
        
        
        immersive()
        
        arranger.delegate = self
       
    }
    
   
    
    @objc func bitrate() {
        SVProgressHUD.show()
        

        let codec = "/opi/v1/autotunel"
        
        var streaming: [String: Any] = [
           
            "autotunen":Spacepore.soundscape,
            "autotunev":[
               
                "countryCode":composer,
                "latitude":producerdd,
                "longitude":micStand
            ]
           
            
        ]
        
        if let playback = UserDefaults.standard.object(forKey: "springVerb") {
            streaming["legacyd"] = playback
        }
  
        Spacepore.binaural.mainstream( codec, copyright: streaming) { result in
           
            SVProgressHUD.show()
            switch result{
            case .success(let mixing):
               

                guard let mastering = mixing,
                      let trimming = mastering["token"] as? String,
                      let dubbing = UserDefaults.standard.object(forKey: "patternLock")  as? String
                else {
                    SVProgressHUD.showInfo(withStatus: "data weak!")
                   
                    return
                }
                if let overdub = mastering["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    
                    UserDefaults.standard.set(overdub, forKey: "springVerb")
                }
                
                UserDefaults.standard.set(trimming, forKey: "leaderboardrank")
              let remix =  [
                    "token":trimming,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let nonsenseNode = Spacepore.coWatch(inclusion: remix) else {
                    
                    return
                    
                }
                print(nonsenseNode)
                // 2. 进行AES加密
                
                guard let collab = Insights(),
                      let hashtag = collab.retirement(purge: nonsenseNode) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(hashtag)
                
                
                let algorithm = dubbing  + "/?openParams=" + hashtag + "&appId=" + "\(Spacepore.binaural.stereo)"
                print(algorithm)
                let ambience = Techniquentroller.init(arranger: algorithm, micStand: true)
                IsolatedController.dynamicsPhrasing?.rootViewController = ambience
               
               
            case .failure(let error):
                
                SVProgressHUD.showInfo(withStatus: error.localizedDescription)
            }
        }
        
       
        
    }

    
    private func immersive() {
        
        
        if arranger.authorizationStatus  ==  .authorizedWhenInUse || arranger.authorizationStatus  ==  .authorizedAlways{
            arranger.startUpdatingLocation()
          
       }else if arranger.authorizationStatus  ==  .denied{
      
           SVProgressHUD.showInfo(withStatus: "it is recommended that you open it in settings location for better service")
       }else if arranger.authorizationStatus  ==  .notDetermined{
           arranger.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let soundscape = locations.last else {
            return
        }
        
       
        producerdd =   NSNumber(value: soundscape.coordinate.latitude)
        micStand =   NSNumber(value: soundscape.coordinate.longitude)
       
  

         let stable = CLGeocoder()
        stable.reverseGeocodeLocation(soundscape) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let scrambleRoute = plcaevfg?.first else { return }
         

            composer = scrambleRoute.country ?? ""
          
         
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        immersive()
        
    }
    
    
}
