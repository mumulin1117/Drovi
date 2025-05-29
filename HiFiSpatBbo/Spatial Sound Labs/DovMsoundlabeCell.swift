//
//  DovMsoundlabeCell.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit

class DovMsoundlabeCell: UITableViewCell {

    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
    
    @IBOutlet weak var webhookLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 30)
    }

    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam[""] as? String
        webhookLabel.text = patam[""] as? String
        
        let timgd = Int64(patam[""] as? Int ?? 0)
        let date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: timgd))
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        webhookLabel.text =  formatter.string(from: date)
        
        
        guard let parody =  patam[""] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
        
        
        
        
    }

}
