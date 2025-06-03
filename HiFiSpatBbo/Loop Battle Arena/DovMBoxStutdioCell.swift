//
//  DovMBoxStutdioCell.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit

class DovMBoxStutdioCell: UICollectionViewCell {
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
    
    
   
    
    @IBOutlet weak var algorithmImage: UIImageView!
    
    
    
    
    @IBOutlet weak var ambience: UIButton!//big back
    

    
  
    
    @IBOutlet weak var snoozeLabel: UILabel!
    
    
    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam["tempo"] as? String
        
        if let parody =  patam["syncopation"] as? String  {
            BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
        }
        
        
        
        let timgd = Int64(patam["offbeat"] as? Int ?? 0)
        let date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: timgd))
        
        if let parody =  patam["subBass"] as? String  {
            
            ambience.sd_setBackgroundImage(with: URL.init(string: parody), for: .normal)
        }
        
        
        
      
        
        snoozeLabel.text = patam["phrasing"] as? String
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 22)
      
    }

  
    
    
}
