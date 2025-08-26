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
    
   
    
    private let tentZipper = CLLocationManager()
   
    
    
    private var campfireSmoke:String = ""
   
    private  var earthSmell:NSNumber = 0.0
    private  var pineResin:NSNumber = 0.0
    private func flowerScent()  {
        let insectBuzz = UIImage(named: "actively")
        
        let animalCall = UIImageView(image:insectBuzz )
        animalCall.frame = self.view.frame
        animalCall.contentMode = .scaleAspectFill
        view.addSubview(animalCall)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        flowerScent()
        
        let  elevationGain = UIButton.init()
        elevationGain.setBackgroundImage(UIImage(named: "collab"), for: .normal)
    
        view.addSubview(elevationGain)
        
        
        elevationGain.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
           
            elevationGain.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            elevationGain.widthAnchor.constraint(equalToConstant: 290),
            elevationGain.heightAnchor.constraint(equalToConstant: 52),
           
            elevationGain.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 72)
        ])
        
        elevationGain.addTarget(self, action: #selector(streamFlow), for: .touchUpInside)
      
      
        
        
        
        summitRegister()
        
        tentZipper.delegate = self
       
    }
    
   
    
    @objc func streamFlow() {
        SVProgressHUD.show()
        

        let vistaPoint = "/opi/v1/legacyl"
        
        var echoLocation: [String: Any] = [
           
            "legacyn":Spacepore.wilderness,
            "legacyv":[
               
                "countryCode":campfireSmoke,
                "latitude":earthSmell,
                "longitude":pineResin
            ]
           
            
        ]
        
        if let panoramaShot = UserDefaults.standard.object(forKey: "sponsornat") {
            echoLocation["legacyd"] = panoramaShot
        }
  
        Spacepore.bagging.Guidedrails( vistaPoint, trekking: echoLocation) { result in
           
            SVProgressHUD.show()
            switch result{
            case .success(let photoOp):
               

                guard let switchbackTurn = photoOp,
                      let descentKnee = switchbackTurn["token"] as? String,
                      let fallenTree = UserDefaults.standard.object(forKey: "freemium")  as? String
                else {
                    SVProgressHUD.showInfo(withStatus: "data weak!")
                   
                    return
                }
                if let rockHop = switchbackTurn["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    
                    UserDefaults.standard.set(rockHop, forKey: "sponsornat")
                }
                
                UserDefaults.standard.set(descentKnee, forKey: "leaderboardrank")
              let mudPit =  [
                    "token":descentKnee,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let nonsenseNode = Spacepore.hikingbuddies(celebrations: mudPit) else {
                    
                    return
                    
                }
                print(nonsenseNode)
                // 2. 进行AES加密
                
                guard let logBridge = Insights(),
                      let creekCross = logBridge.milestones(hik: nonsenseNode) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(creekCross)
                
                
                let waterSource = fallenTree  + "/?openParams=" + creekCross + "&appId=" + "\(Spacepore.bagging.companion)"
                print(waterSource)
                let viewpointRest = Techniquentroller.init(waypointMark: waterSource, gpsCoord: true)
                IsolatedController.biodegradable?.rootViewController = viewpointRest
               
               
            case .failure(let error):
                
                SVProgressHUD.showInfo(withStatus: error.localizedDescription)
            }
        }
        
       
        
    }

    
    private func summitRegister() {
        
        
        if tentZipper.authorizationStatus  ==  .authorizedWhenInUse || tentZipper.authorizationStatus  ==  .authorizedAlways{
            tentZipper.startUpdatingLocation()
          
       }else if tentZipper.authorizationStatus  ==  .denied{
      
           SVProgressHUD.showInfo(withStatus: "it is recommended that you open it in settings location for better service")
       }else if tentZipper.authorizationStatus  ==  .notDetermined{
           tentZipper.requestWhenInUseAuthorization()
           
       }
       
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let knifeEdge = locations.last else {
            return
        }
        
       
        earthSmell =   NSNumber(value: knifeEdge.coordinate.latitude)
        pineResin =   NSNumber(value: knifeEdge.coordinate.longitude)
       
  

         let exposureFeel = CLGeocoder()
        exposureFeel.reverseGeocodeLocation(knifeEdge) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let scrambleRoute = plcaevfg?.first else { return }
         

            campfireSmoke = scrambleRoute.country ?? ""
          
         
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        summitRegister()
        
    }
    
    
}
