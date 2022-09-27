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
