//
//  SpatialSoundLabsController.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit

class SpatialSoundLabsController: UIViewController {
    @IBOutlet weak var vibranSpace: UIView!
    var Centric = Array<Dictionary<String,Any>>()
    
    
    @IBOutlet weak var expressJams: UITableView!
    
    var BattleArenalsit : Array<Dictionary<String,Any>> {
        
        if BeatboxAcademyController.timeStretch.count >= 2{
            return Array(BeatboxAcademyController.timeStretch.prefix(2))
        }
        return BeatboxAcademyController.timeStretch
    }
    @IBOutlet weak var nilholder: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if NoiseGate.feed != nil {
            fetchchilzlwei()
        }else{
            let alertLogin = UIAlertController.init(title: "View message sessions", message: "Sign in to unlock full features and connect with beatboxers worldwide", preferredStyle: .alert)
            alertLogin.addAction(UIAlertAction(title: "Sign In Now", style: .default, handler: { alert in
                let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoRoyaltyController") as! DoRoyaltyController
                
                self.navigationController?.pushViewController(instaiclogin, animated: true)
            }))
            alertLogin.addAction(UIAlertAction(title: NoiseGate.sequencer(lifer: "Cbaenkcdeql"), style: .default, handler: { alerta in
                if let tabBarController = self.tabBarController as? SjuiTAbar {
                    let lastIndex = tabBarController.previousSelectedIndex
                    tabBarController.selectedIndex = lastIndex
                }
            }))
            self.present(alertLogin, animated: true)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expressJams.delegate = self
        expressJams.rowHeight = 60 + 34
        
        generateInitialPatterns()
        expressJams.separatorStyle = .none
        expressJams.backgroundColor = nil
        
        regaer()
       
    }
    
    func regaer()  {
        vibranSpace.subviews.forEach { sub in
            sub.removeFromSuperview()
        }
        
        
        
        for (i,it) in BeatboxAcademyController.timeStretch.enumerated() {
            let mudiour = Bundle.main.loadNibNamed("ShiwingPaper", owner:nil, options: nil)?.first as! ShiwingPaper
            mudiour.frame = CGRect(x: 130*i, y: 0, width: 120, height: 160)
            vibranSpace.addSubview(mudiour)
            mudiour.transientEenvelope(patam: BeatboxAcademyController.timeStretch[i])
            mudiour.tag = i
            mudiour.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gestBaui(tapo:))))
        }
    }
    
    
    @objc func gestBaui(tapo:UITapGestureRecognizer)  {
        
        guard let iser = BeatboxAcademyController.timeStretch[tapo.view?.tag ?? 0]["loop"] as? Int else {
            return
        }
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .vocalBass, midi: "\(iser)"), animated: true)
    }
    
    
    func generateInitialPatterns() {
        expressJams.register(UINib.init(nibName: "DovMsoundlabeCell", bundle: nil), forCellReuseIdentifier: "DovMsoundlabeCell")
        expressJams.dataSource = self
        expressJams.allowsSelection = true
        
    }
    private let complexityLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            label.textColor = .label
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
       
    }()
        
    func fetchchilzlwei()  {
        
        complexityLabel.text = "complexityLabel"
        var discoveredPatterns = [
                        SonicPattern(name: "Urban Pulse", complexity: .intermediate, bpm: 92),
                        SonicPattern(name: "Lip Roll Flow", complexity: .advanced, bpm: 105)
                       
                    ]
        BeatboxAcademyController.sonicHarmonyBridge(waveformComponents: ["click":NoiseGate.highPass], resonanceFrequency: "/voawnyz/ibyfppz") { complexity in
            let   SonicPatte0 = SonicPattern(name: "Sub Bass Foundation", complexity: .beginner, bpm: 85)
            discoveredPatterns.append(SonicPatte0)
            guard
                let splicing = complexity as? Dictionary<String,Any> ,
                discoveredPatterns.count > 1,
                    let mixing = splicing[NoiseGate.sequencer(lifer: "dgaktxa")] as? Array<Dictionary<String,Any>>
                    
            else {
                
                
                return
            }
            
            self.Centric = mixing.map { ric in
                if let official = (ric["whistle"] as? Array<[String:Any]>)?.first{
                    official
                }else{
                    
                    [:]
                }
                
            }
            let   SonicPatte1 = SonicPattern(name: "Hi-Hat Symphony", complexity: .intermediate, bpm: 120)
            discoveredPatterns.append(SonicPatte1)
           
            
            if self.Centric.count == 0 {
                self.nilholder.isHidden = false
                self.expressJams.isHidden = true
            }else{
                self.nilholder.isHidden = true
                self.expressJams.isHidden = false
            }
           
            self.expressJams.reloadData()
            
        } dissonanceHandler: { errt in
            
           
        }
        
        
    }
}

extension SpatialSoundLabsController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Centric.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vibracell = tableView.dequeueReusableCell(withIdentifier: "DovMsoundlabeCell", for: indexPath) as! DovMsoundlabeCell
        vibracell.selectionStyle = .none
        vibracell.transientEenvelope(patam: Centric[indexPath.row])
        return vibracell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let parody =  Centric[indexPath.row]["siren"]  as? Int else {
            return
        }
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .oscillation, midi: "\(parody)"), animated: true)
        
    }
}


class ShiwingPaper: UIView {
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundEditorCorners(editorradius: 16)
        BellUserImageci.roundEditorCorners(editorradius: 32)
    }

    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam["layer"] as? String
        
        guard let parody =  patam["rhythm"] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
    }

}


extension UIViewController{
    
}
