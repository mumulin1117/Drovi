//
//  ConnectMarketplaceController.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
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
        if let tabBarController = self.tabBarController as? SjuiTAbar {
            let lastIndex = tabBarController.previousSelectedIndex
            tabBarController.selectedIndex = lastIndex
        }
        
        
    }
    
    
    private func adSupported()  {//story
        compliance.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(maintenance)))
        complianceLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(maintenance)))
        
        
        desktopApp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(curatorgroup)))
        desktopAppLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(curatorgroup)))
    }

    
   @objc func curatorgroup() {
        //video
       self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .metronome), animated: true)
      
   }
    
    
    @objc func maintenance() {
        
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .groove), animated: true)
        
    }
}
