//
//  BeatboxAcademyController.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit

class BeatboxAcademyController: UIViewController {

    @IBOutlet weak var useAmbassador: UIButton!
    
    
    @IBOutlet weak var cluster: UICollectionView!
    
    @IBOutlet weak var microservice: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateInitialPatterns()
        useAmbassador.roundEditorCorners(editorradius: 24)
        detectVocalElements()
    }
    

   
    @IBAction func leaderboard(_ sender: UIButton) {
        
        let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoSponsorController") as! DoSponsorController
        
        self.navigationController?.pushViewController(instaiclogin, animated: true)
    }
    
    
    func generateInitialPatterns() {
        cluster.delegate = self
        cluster.showsHorizontalScrollIndicator = false
        
        let col = UICollectionViewFlowLayout()
        col.itemSize = CGSize(width: 56, height: 85)
        
        cluster.isPagingEnabled = true
        col.scrollDirection = .vertical
        col.minimumInteritemSpacing = 32
        col.minimumLineSpacing = 32
        cluster.collectionViewLayout = col
    }
    
    
    func detectVocalElements() {
        cluster.dataSource = self
        cluster.register(UINib.init(nibName: "DovEditorCell", bundle: nil), forCellWithReuseIdentifier: "DovEditorCell")
        
        cluster.showsVerticalScrollIndicator = false
        
        
        microservice
        cluster.delegate = self
        cluster.showsHorizontalScrollIndicator = false
        
        let col = UICollectionViewFlowLayout()
        col.itemSize = CGSize(width: UIScreen.main.bounds.width - 101 - 10, height: 300)
        
        cluster.isPagingEnabled = true
        col.scrollDirection = .vertical
        col.minimumInteritemSpacing = 10
        col.minimumLineSpacing = 10
        cluster.collectionViewLayout = col
        cluster.dataSource = self
        cluster.register(UINib.init(nibName: "DovMaintenance_Cell", bundle: nil), forCellWithReuseIdentifier: "DovMaintenance_Cell")
        
        cluster.showsVerticalScrollIndicator = false
    }
}


extension BeatboxAcademyController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.cluster {
            return 3
        }else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.cluster {
            let bboxce = collectionView.dequeueReusableCell(withReuseIdentifier: "DovEditorCell", for: indexPath) as! DovEditorCell
            return bboxce
        }else{
            let bboxce = collectionView.dequeueReusableCell(withReuseIdentifier: "DovMaintenance_Cell", for: indexPath) as! DovMaintenance_Cell
            return bboxce
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.cluster {
            return
        }
    }
    
}
