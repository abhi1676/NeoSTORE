//
//  HomeScreenViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/7/24.
//

import UIKit
extension HomeScreenViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeScreenCollectionViewCell", for: indexPath) as! HomeScreenCollectionViewCell
        
        return cell
    }
    
    
}
