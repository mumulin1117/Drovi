//
//  DovEditorCell.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit
import SDWebImage
class DovEditorCell: UICollectionViewCell {

    @IBOutlet weak var BellUserImageci: UIImageView!
    
    
    @IBOutlet weak var exhibitionLabel: UILabel!
    private let complexityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
        
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        BellUserImageci.roundEditorCorners(editorradius: 28)
    }
    private let bpmLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .bold)
        label.textColor = .systemPurple
        label.textAlignment = .center
        return label
        
    }()
    func transientEenvelope(patam:Dictionary<String,Any>) {
        
        exhibitionLabel.text = patam["layer"] as? String
        
        guard let parody =  patam["rhythm"] as? String else {
            return
        }
        
        
        BellUserImageci.loadImageWithCaching(from: URL.init(string: parody))
    }

    private func configureVibrationCell() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 12
        layer.masksToBounds = true
        let titleLabel = UILabel()
        let stackView = UIStackView(arrangedSubviews: [titleLabel, complexityLabel, bpmLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
        
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
