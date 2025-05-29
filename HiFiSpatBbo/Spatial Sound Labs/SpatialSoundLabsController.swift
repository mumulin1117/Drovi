//
//  SpatialSoundLabsController.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit

class SpatialSoundLabsController: UIViewController {
    @IBOutlet weak var vibranSpace: UIView!
    
    
    @IBOutlet weak var expressJams: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expressJams.delegate = self
        expressJams.rowHeight = 60 + 34
        
        generateInitialPatterns()
        expressJams.separatorStyle = .none
        expressJams.backgroundColor = nil
    }
    
    func generateInitialPatterns() {
        expressJams.register(UINib.init(nibName: "DovMsoundlabeCell", bundle: nil), forCellReuseIdentifier: "DovMsoundlabeCell")
        expressJams.dataSource = self
        expressJams.allowsSelection = true
        
    }

}

extension SpatialSoundLabsController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vibracell = tableView.dequeueReusableCell(withIdentifier: "DovMsoundlabeCell", for: indexPath) as! DovMsoundlabeCell
        return vibracell
        
    }
    
    
}


class ShiwingPaper: UIView {
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 32)
    }

    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam[""] as? String
        
        guard let parody =  patam[""] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
    }

}


extension UIViewController{
    
}
