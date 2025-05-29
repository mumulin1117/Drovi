//
//  DovMaintenance Cell.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit

class DovMaintenance_Cell: UICollectionViewCell {
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
  
    @IBOutlet weak var cableLabel: UILabel!
    
    
    
    @IBOutlet weak var cloudLabel: UILabel!
    
    
    @IBOutlet weak var algorithmImage: UIImageView!
    
    
    
    
    @IBOutlet weak var ambience: UIButton!
    
    
    @IBOutlet weak var workflow: UIButton!
    
    
    @IBOutlet weak var showcaseArchive: UIButton!
    
    
    
    @IBOutlet weak var snoozeLabel: UILabel!
    
    
    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam[""] as? String
        
        guard let parody =  patam[""] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
        let timgd = Int64(patam[""] as? Int ?? 0)
        let date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: timgd))
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        cableLabel.text =  formatter.string(from: date)
        
        
        ambience.setTitle("\(patam[""] as? Int ?? 0)", for: .normal)
        workflow.setTitle("\(patam[""] as? Int ?? 0)", for: .normal)
        
        snoozeLabel.text = patam[""] as? String
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 19)
        mainstream()
        cloudLabel.roundEditorCorners(editorradius: 10)
    }

    func mainstream()  {
       
        self.contentView.layer.addSublayer(createGrandientLayer(frame:self.contentView.bounds))
        
        
        cloudLabel.layer.insertSublayer(createGrandientLayer(frame: cloudLabel.bounds), at: 0)
    }
    
    
    func createGrandientLayer(frame:CGRect) -> CAGradientLayer {
        let filedLayer = CAGradientLayer()
        filedLayer.frame = frame
        filedLayer.colors = [UIColor(red: 0.01, green: 0.05, blue: 0.25, alpha: 1).cgColor, UIColor(red: 0.04, green: 0.08, blue: 0.44, alpha: 1).cgColor]
        filedLayer.locations = [0, 1]
        
        filedLayer.startPoint = CGPoint(x: 0.16, y: 0.06)
        filedLayer.endPoint = CGPoint(x: 1, y: 1)
        return filedLayer
    }
}
