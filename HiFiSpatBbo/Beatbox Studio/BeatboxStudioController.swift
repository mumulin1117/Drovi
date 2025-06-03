//
//  BeatboxStudioController.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit

class BeatboxStudioController: UIViewController {

    
    @IBAction func Transparency(_ sender: UIButton) {
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .lipRoll), animated: true)
    }
    
 

    @IBAction func webhook(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .percussion), animated: true)
        
    }
    
    
    
    
    
}
