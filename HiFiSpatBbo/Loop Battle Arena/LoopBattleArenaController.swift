//
//  LoopBattleArenaController.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit

class LoopBattleArenaController: UIViewController {

    @IBOutlet weak var kickDrum: UIButton!
    
    @IBOutlet weak var metronome: UIButton!
    
    
    @IBOutlet weak var articulation: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateInitialPatterns()
        detectVocalElements()
    }
    
    @IBAction func microserviceBackup(_ sender: UIButton) {
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let battlecell = collectionView.dequeueReusableCell(withReuseIdentifier: "DovMBoxStutdioCell", for: indexPath) as! DovMBoxStutdioCell
        return battlecell
        
    }
    
    
}
