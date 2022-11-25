//
//  kingFisherSingleton.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 26.09.2022.
//

import Foundation
import UIKit
import Kingfisher

class KingFisherSingelton {
    static let sharedInstance = KingFisherSingelton()
    
    init() {
        //initial setup or initial connection if required
    }
    
    func getImage(imageName: String, imageView: UIImageView) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)") {
            DispatchQueue.main.async {
                imageView.kf.setImage(with: url)
            }
        }
    }
}

class ViewAnimationsSingelton {
    static let sharedInstance = ViewAnimationsSingelton()
    init() {}
    
    func shakingAnimation(for view: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        animation.repeatCount = 4
        
        animation.isAdditive = true
        view.layer.add(animation, forKey: "shake")
    }
}
