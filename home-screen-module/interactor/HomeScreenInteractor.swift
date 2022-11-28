//
//  HomeScreenInteractor.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 20.09.2022.
//

import Foundation
import Alamofire

class HomeScreenInteractor : PresenterToInteractorHomeScreenProtocol {
    var homeScreenPresenter: InteractorToPresenterHomeScreenProtocol?
    
    func getFoodList() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            
            if let data = response.data {
                do{
                    let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                    if let foodList = apiResponse.yemekler {
                        self.homeScreenPresenter?.sendDataToPresenter(foodList: foodList)
                        print()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
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
                    self.homeScreenPresenter?.sendResultToPresenter(message: "Yemek Sepete Başarı ile eklendi.")
                } catch {
                    print(error.localizedDescription)
                    self.homeScreenPresenter?.sendResultToPresenter(message: "Yemek Sepete Eklenirken bir hata oluştu.")
                }
            }
        }
    }
}

//post : webservis bizden değer göndermemizi ister
//get : istemez
