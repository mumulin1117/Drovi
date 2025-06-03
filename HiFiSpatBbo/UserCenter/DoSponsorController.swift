//
//  DoSponsorController.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit
import SVProgressHUD
//user center
class DoSponsorController: UIViewController {

    
    
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
  
    @IBOutlet weak var useForMe: UILabel!
    
    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam[""] as? String
        useForMe.text = "\(patam[""] as? Int ?? 0)"
        guard let parody =  patam[""] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
    }
    
    private var importer:Dictionary<String,Any>?{
        didSet{
            exhibitionLabel.text = importer?["turntable"] as? String
            useForMe.text = "ID:\(importer?["scratch"] as? Int ?? 0) "
            guard let parody =  importer?["vinyl"] as? String else {
                return
            }
            
            UserDefaults.standard.set(parody, forKey: "mastering")
            BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BellUserImageci.roundEditorCorners(editorradius: 40)
       
        BeatboxAcademyController.sonicHarmonyBridge(waveformComponents: ["siren":NoiseGate.recording ?? 0], resonanceFrequency: "/mjrqdyz/bxkrdzi") { complexity in
           
            guard
                   let splicing = complexity as? Dictionary<String,Any> ,
                 
                  let mixing = splicing["data"] as? Dictionary<String,Any>
                    
            else {
           
                
                return
            }
            
            
            self.importer = mixing
            
           
            
        } dissonanceHandler: { errt in
            
            SVProgressHUD.showError(withStatus: errt.localizedDescription)
        }
    }
    
    @IBAction func electronic(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
   
    @IBAction func UmicStand(_ sender: UIButton) {
        //66 coin
        if sender.tag == 66 {
            self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .timeStretch), animated: true)
        }
        
        //67 edit
        if sender.tag == 67 {
            self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .pitchShift), animated: true)
        }
       
        //68 setting
        if sender.tag == 68 {
            self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .clickRoll), animated: true)
        }
        
    }
    
    

}
