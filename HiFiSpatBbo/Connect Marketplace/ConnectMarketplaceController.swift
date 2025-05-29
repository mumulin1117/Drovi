//
//  ConnectMarketplaceController.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit

class ConnectMarketplaceController: UIViewController {

    @IBOutlet weak var compliance: UIImageView!
    
    @IBOutlet weak var complianceLbl: UILabel!
    
    
    
    @IBOutlet weak var desktopApp: UIImageView!
    
    @IBOutlet weak var desktopAppLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adSupported()
    }
    

    @IBAction func documentation(_ sender: UIButton) {
        
    }
    
    
    private func adSupported()  {//story
        compliance.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(curatorgroup)))
        complianceLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(curatorgroup)))
        
        
        desktopApp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(curatorgroup)))
        desktopAppLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(maintenance)))
    }

    
   @objc func curatorgroup() {
        
   
   }
    
    
    @objc func maintenance() {
        
        
    }
}
