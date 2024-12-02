//
//  HomeScreenCollectionViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 11/6/24.
//

import UIKit
protocol PageControlDelegate{
    func didPageControltapped(page:Int)
}
class HomeScreenCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var pageCOntrol: UIPageControl!
    
    @IBOutlet var sliderImage: UIImageView!
    
     var delegate : PageControlDelegate?

   
    override func awakeFromNib() {
        super.awakeFromNib()
        pageCOntrol.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }
    @objc func pageControlTapped(_ sender: UIPageControl) {
        delegate?.didPageControltapped(page: sender.currentPage)
     }
    
    func configure(image : UIImage,currentPage:Int,totalPages:Int){
        sliderImage.image = image
        pageCOntrol.numberOfPages = totalPages
        pageCOntrol.currentPage = currentPage
        
    }
}
