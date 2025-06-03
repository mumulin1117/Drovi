//
//  LoopBattleArenaController.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit

class LoopBattleArenaController: UIViewController {
    var BattleArenalsit : Array<Dictionary<String,Any>> {
        let chios = BeatboxAcademyController.vocalBass.filter { studio in
            studio["subBass"] as? String != nil || studio["subBass"] as? String != ""
        }
        
        if kickDrum.isSelected {
            return chios
        }
        
        if metronome .isSelected,let only = chios.last{
            return [only]
        }else{
            return []
        }
        
    }

    @IBOutlet weak var kickDrum: UIButton!
    
    @IBOutlet weak var metronome: UIButton!
    
    
    @IBOutlet weak var articulation: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateInitialPatterns()
        detectVocalElements()
    }
    
    @IBAction func microserviceBackup(_ sender: UIButton) {
        kickDrum.isSelected = false
        metronome.isSelected = false
        sender.isSelected = true
        
        self.articulation.reloadData()
    }
    
    func generateInitialPatterns() {
        articulation.delegate = self
        articulation.showsHorizontalScrollIndicator = false
        
        let col = UICollectionViewFlowLayout()
        col.itemSize = self.view.frame.size
        articulation.isPagingEnabled = true
        col.scrollDirection = .horizontal
        
        articulation.collectionViewLayout = col
    }
    
    
    func detectVocalElements() {
        articulation.dataSource = self
        articulation.register(UINib.init(nibName: "DovMBoxStutdioCell", bundle: nil), forCellWithReuseIdentifier: "DovMBoxStutdioCell")
        
        articulation.showsVerticalScrollIndicator = false
        
        
    }
    
    
    
    
}


extension LoopBattleArenaController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    
        return BattleArenalsit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let battlecell = collectionView.dequeueReusableCell(withReuseIdentifier: "DovMBoxStutdioCell", for: indexPath) as! DovMBoxStutdioCell
       
        battlecell.transientEenvelope(patam: BattleArenalsit[indexPath.row])
        return battlecell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
     
        guard let iserDum = BattleArenalsit[indexPath.row]["articulation"] as? Int else {
            return
        }
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .offbeat, midi: "\(iserDum)"), animated: true)
    }
}
