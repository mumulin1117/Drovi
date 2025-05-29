//
//  DovEditorCell.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/5/29.
//

import UIKit
import SDWebImage
class DovEditorCell: UICollectionViewCell {

    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 28)
    }

    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam[""] as? String
        
        guard let parody =  patam[""] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
    }

    
}


extension UIView {
    func roundEditorCorners(editorradius: CGFloat) {
        self.layer.cornerRadius = editorradius
        self.layer.masksToBounds = true
    }
}



extension UIImageView {
   
    func loadImageWithCaching(
        from url: URL?,
      
        maxSize: CGSize = CGSize(width: 400, height: 500)
    ) {
        guard let url = url else {
            
            return
        }

        self.sd_setImage(
            with: url,
            placeholderImage: nil,
            options: [
                .progressiveLoad,
                .scaleDownLargeImages,
                .retryFailed,
                .continueInBackground,
                .highPriority
            ],
            context: [.imageThumbnailPixelSize: maxSize],
            progress: nil
        ) { (image, error, cacheType, url) in
            if let error = error {
                print("Image load error: \(error.localizedDescription)")
            }
        }
    }
}
