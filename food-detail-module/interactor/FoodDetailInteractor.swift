//
//  FoodDetailInteractor.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 22.09.2022.
//

import Foundation
import Alamofire

class FoodDetailInteractor : PresenterToInteractorFoodDetailProtocol {
    var foodDetailPresenter: InteractorToPresenterFoodDetailProtocol?
    
    func addToBasket(food: Yemekler, orderCount: Int, user: String) {
        let params:Parameters = ["yemek_adi": food.yemek_adi!,
                                 "yemek_resim_adi": food.yemek_resim_adi!,
                                 "yemek_fiyat": Int(food.yemek_fiyat!)!,
                                 "yemek_siparis_adet": orderCount,
                                 "kullanici_adi": user]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let answer = try JSONSerialization.jsonObject(with: data)
                    print(answer) //to check json reponse in debugger level
                    self.foodDetailPresenter?.sendDataToPresenter(message: "Yemek Sepete Başarı ile eklendi.")
                } catch {
                    print(error.localizedDescription)
                    self.foodDetailPresenter?.sendDataToPresenter(message: "Yemek Sepete Eklenirken bir hata oluştu.")
                }
            }
        }
    }
    
}
