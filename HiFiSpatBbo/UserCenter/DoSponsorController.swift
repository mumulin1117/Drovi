//
//  DoSponsorController.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit
//user center
class DoSponsorController: UIViewController {

    
    
    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
  
    @IBOutlet weak var useForMe: UILabel!
    
    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam[""] as? String
        useForMe.text = "\(patam[""] as? Int ?? 0)"
        guard let parody =  patam[""] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BellUserImageci.roundEditorCorners(editorradius: 40)
    }
    
    @IBAction func electronic(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
   
    @IBAction func UmicStand(_ sender: UIButton) {
        //66 coin
        //67 edit
        //68 setting
    }
    

}
