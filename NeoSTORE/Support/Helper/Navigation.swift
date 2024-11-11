//
//  Navigation.swift
//  NeoSTORE
//
//  Created by Apple on 10/28/24.
//

import Foundation
import UIKit
extension UIViewController {
    
    func navigate( storyboardName: String, viewControllerID: String) {
       let sb = UIStoryboard(name: storyboardName, bundle: nil)
     
        let nextVc = sb.instantiateViewController(withIdentifier: viewControllerID)
        if let navigationController = self.navigationController {
            navigationController.pushViewController(nextVc, animated: true)
        }
        else{
            print("Error! In Navigation")
        }
    }
    
    func hideNavigationBackButtton(){
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
    }
    
    
     func setupNavigationBarButton(imageName: String, isLeft: Bool, action: Selector) {
        guard let image = UIImage(named: imageName) else { return }
        
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
         
        
        if isLeft {
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
        }
    }

}
