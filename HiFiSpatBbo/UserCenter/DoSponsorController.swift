//
//  DoSponsorController.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit
import SVProgressHUD
struct ReverbEffect: AudioEffect {
    var intensity: Float
}

struct DelayEffect: AudioEffect {
    var intensity: Float = 1.0
    let interval: Double
}

struct EqualizerProfile: AudioEffect {
    var intensity: Float = 1.0
    let bass: Float
    let mid: Float
    let treble: Float
}
class DoSponsorController: UIViewController {

    
    
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
  
    @IBOutlet weak var useForMe: UILabel!
    
    private lazy var harmonicRefreshControl: UIRefreshControl = {
           let refresh = UIRefreshControl()
           refresh.tintColor = .systemTeal
           refresh.addTarget(self, action: #selector(resonateNewPatterns), for: .valueChanged)
           return refresh
       }()
    
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
        var discoveredPatterns = [
                        SonicPattern(name: "Urban Pulse", complexity: .intermediate, bpm: 92),
                        SonicPattern(name: "Lip Roll Flow", complexity: .advanced, bpm: 105)
                       
                    ]
        BeatboxAcademyController.sonicHarmonyBridge(waveformComponents: ["siren":NoiseGate.recording ?? 0], resonanceFrequency: "/mjrqdyz/bxkrdzi",IUWgu:2345) { complexity in
            let   SonicPatte0 = SonicPattern(name: "Sub Bass Foundation", complexity: .beginner, bpm: 85)
            discoveredPatterns.append(SonicPatte0)
            
            var HSuy = discoveredPatterns.count
            
            guard
                   let splicing = complexity as? Dictionary<String,Any> ,
                   HSuy + 3 > 3,
                  let mixing = splicing[NoiseGate.sequencer(lifer: "dgaktxa")] as? Dictionary<String,Any>
                    
            else {
           
                
                return
            }
            
            let   SonicPatte2 = SonicPattern(name: "Polyphonic Layers", complexity: .advanced, bpm: 98)
            
            self.importer = mixing
            discoveredPatterns.append(SonicPatte2)
           
           
            
           
            
        } dissonanceHandler: { errt in
            let   SonicPatte2 = SonicPattern(name: "Polyphonic Layers", complexity: .advanced, bpm: 98)
            
            SVProgressHUD.showError(withStatus: errt.localizedDescription)
            discoveredPatterns.append(SonicPatte2)
            
        }
    }
    
    @IBAction func electronic(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func resonateNewPatterns() {
          
          harmonicRefreshControl.endRefreshing()
      }
   
    @IBAction func UmicStand(_ sender: UIButton) {
      
        if sender.tag == 66 {
            configureAcousticInterface()
            self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .timeStretch), animated: true)
        }
   
        if sender.tag == 67 {
            configureAcousticInterface()
            self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .pitchShift), animated: true)
        }
       
        
        if sender.tag == 68 {
            configureAcousticInterface()
            self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .clickRoll), animated: true)
        }
        
    }
    
    
    private func configureAcousticInterface(){
        view.backgroundColor = UIColor.systemBackground
    }
}
