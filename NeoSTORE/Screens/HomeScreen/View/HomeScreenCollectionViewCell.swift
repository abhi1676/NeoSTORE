//
//  HomeScreenCollectionViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 11/6/24.
//

import UIKit

class HomeScreenCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var pageCOntrol: UIPageControl!
    
    @IBOutlet var sliderImage: UIImageView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(image : UIImage,currentPage:Int,totalPages:Int){
        sliderImage.image = image
        pageCOntrol.numberOfPages = totalPages
        pageCOntrol.currentPage = currentPage
        
    }
}
