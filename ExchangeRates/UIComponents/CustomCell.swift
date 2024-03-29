//
//  CustomCell.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 06.12.2021.
//

import UIKit

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    private var titleLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1.0

        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
        
 //       myImageView = LazyImageView()
//        myImageView?.contentMode = .scaleAspectFill
        
        titleLabel = UILabel()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel?.layer.shadowColor = UIColor.gray.cgColor
        titleLabel?.layer.shadowRadius = 3.0
        titleLabel?.layer.shadowOpacity = 1.0
        titleLabel?.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel?.layer.masksToBounds = false
        
//        if let imageView = myImageView {
//            contentView.addSubview(imageView)
//        }
        if let label = titleLabel {
            contentView.addSubview(label)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        myImageView?.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        titleLabel?.frame = CGRect(x: 10, y: contentView.frame.size.height-30, width: contentView.frame.size.width, height:20)
    }
    
    func configure(title: String) {
        self.titleLabel?.text = title
//        guard let imgURL = URL(string: imageURL) else {
//            return
//        }
 //       myImageView?.loadImage(imageURL: imgURL, placeHolderImage: "")
    }
}
