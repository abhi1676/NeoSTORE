//
//  CustomStarView.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import Foundation
import UIKit

class StarRatingView: UIView {
    
    private var starImageViews: [UIImageView] = []
    private let maxRating = 5
    var checkedStarImage: UIImage?
    var uncheckedStarImage: UIImage?
    
    var rating: Int = 0 {
        didSet {
            updateStars()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        checkedStarImage = UIImage(named: "star_check")
        uncheckedStarImage = UIImage(named: "star_unchek")
        
        for _ in 0..<maxRating {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            starImageViews.append(imageView)
            addSubview(imageView)
        }
        
        arrangeStarsHorizontally()
    }
    
    private func arrangeStarsHorizontally() {
        starImageViews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        for (index, imageView) in starImageViews.enumerated() {
            if index == 0 {
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            } else {
                imageView.leadingAnchor.constraint(equalTo: starImageViews[index - 1].trailingAnchor, constant: 8).isActive = true
            }
            
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        }
        
        starImageViews.last?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func updateStars() {
        for (index, imageView) in starImageViews.enumerated() {
            imageView.image = (index < rating) ? checkedStarImage : uncheckedStarImage
        }
    }
}
