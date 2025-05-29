//
//  DovMBoxStutdioCell.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit

class DovMBoxStutdioCell: UICollectionViewCell {
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
    
    
   
    
    @IBOutlet weak var algorithmImage: UIImageView!
    
    
    
    
    @IBOutlet weak var ambience: UIButton!//big back
    

    
  
    
    @IBOutlet weak var snoozeLabel: UILabel!
    
    
    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam[""] as? String
        
        guard let parody =  patam[""] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
        let timgd = Int64(patam[""] as? Int ?? 0)
        let date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: timgd))
        
        
     
        
        
      
        
        snoozeLabel.text = patam[""] as? String
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 22)
      
    }

  
    
    
}
