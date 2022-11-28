//
//  BasketInteractor.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.11.2022.
//

import Foundation
import Alamofire

class BasketInteractor : PresenterToInteractorBasketProtocol {
    var basketPresenter: InteractorToPresenterBasketProtocol?
    
    func retrieveBasket(user: String) {
        let params: Parameters = ["kullanici_adi": user]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response {
            response in
            if let data = response.data {
                print(data)
                do {
                    let apiResponse = try JSONDecoder().decode(BasketAPIResponse.self, from: data)
                    print(apiResponse)
                    if let foodList = apiResponse.sepet_yemekler {
                        self.basketPresenter?.sendDataToPresenter(basketFoodList: foodList)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteItemFromBasket(id: Int, user: String) {
        let params: Parameters = ["sepet_yemek_id": id,
                                  "kullanici_adi": user]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",
                   method: .post,
                   parameters: params).response { response in
            
            if let data = response.data {
                do {
                    let apiResponse = try JSONSerialization.jsonObject(with: data)
                    print(apiResponse)
                    self.retrieveBasket(user: user)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
