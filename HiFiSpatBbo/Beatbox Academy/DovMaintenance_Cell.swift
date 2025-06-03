//
//  DovMaintenance Cell.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
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
        
        exhibitionLabel.text = patam["tempo"] as? String
        
        if let parody =  patam["syncopation"] as? String  {
            BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
        }
        
        
        
        let timgd = Int64(patam["offbeat"] as? Int ?? 0)/1000
        let date = Date(timeIntervalSince1970: TimeInterval(integerLiteral: timgd))
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        cableLabel.text =  formatter.string(from: date)
        
        
        ambience.setTitle("\(patam["polyrhythm"] as? Int ?? 0)", for: .normal)
        workflow.setTitle("\(patam["metronome"] as? Int ?? 0)", for: .normal)
        
        snoozeLabel.text = patam["phrasing"] as? String
        
        
        if let parody =  (patam["swing"] as? Array<String>)?.first {
            algorithmImage.loadImageWithCaching(from: URL.init(string: parody))
        }
        
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 19)
        mainstream()
        algorithmImage.roundEditorCorners(editorradius: 15)
        cloudLabel.roundEditorCorners(editorradius: 10)
    }

    func mainstream()  {
       
        self.contentView.layer.insertSublayer(createGrandientLayer(colors: [UIColor(red: 0.01, green: 0.05, blue: 0.25, alpha: 1).cgColor, UIColor(red: 0.04, green: 0.08, blue: 0.44, alpha: 1).cgColor], frame:self.contentView.bounds), at: 0)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: DispatchWorkItem(block: {
            self.contentView.layer.insertSublayer(self.createGrandientLayer(colors: [UIColor(red: 0.26, green: 0.8, blue: 1, alpha: 1).cgColor, UIColor(red: 0.56, green: 0.01, blue: 1, alpha: 1).cgColor, UIColor(red: 1, green: 0.12, blue: 0.35, alpha: 1).cgColor], frame:self.cloudLabel.frame), below: self.cloudLabel.layer)
        }))
        
    }
    
   
    func createGrandientLayer(colors:[CGColor]  ,frame:CGRect) -> CAGradientLayer {
        let filedLayer = CAGradientLayer()
        filedLayer.frame = frame
        filedLayer.colors = colors
        filedLayer.locations = [0, 1]
        filedLayer.cornerRadius = 13
        filedLayer.masksToBounds = true
        
        filedLayer.startPoint = CGPoint(x: 0.16, y: 0.06)
        filedLayer.endPoint = CGPoint(x: 1, y: 1)
        return filedLayer
    }
}
