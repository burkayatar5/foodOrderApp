//
//  FoodDetailViewController.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 22.09.2022.
//

import UIKit
import Firebase

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    
    var totalPrice = 0
    var foodDetail: Yemekler?
    var foodDetailPresenterObject: ViewToPresenterFoodDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodDetailRouter.createModule(ref: self)
        self.navigationItem.title = "Food Detail"
        
        if let food = foodDetail {
            KingFisherSingelton.sharedInstance.getImage(imageName: food.yemek_resim_adi!, imageView: foodImageView)
            foodNameLabel.text = food.yemek_adi!
            foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
        }
        
    }
    
    @IBAction func countDecrease(_ sender: Any) {
        guard let itemCount = orderCountLabel.text, let price = foodDetail?.yemek_fiyat else {
            return
        }
        //Force-Unwrapping should not be an issue because of guard let statement
        var itemCountInt: Int = Int(itemCount)!
        let priceInt: Int = Int(price)!
        
        if itemCountInt == 1 {
            //alert do-nothing
            let alert = UIAlertController(title: "Warning",
                                          message: "Minimum item count can be 1.",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK",
                                         style: .cancel) { action in
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }else {
            itemCountInt -= 1
            orderCountLabel.text = String(itemCountInt)
            foodPriceLabel.text = "\(itemCountInt * priceInt) ₺"
        }
    }
    
    @IBAction func countIncrease(_ sender: Any) {
        guard let itemCount = orderCountLabel.text, let price = foodDetail?.yemek_fiyat else {
            return
        }
        //Force-Unwrapping should not be an issue because of guard let statement
        var itemCountInt: Int = Int(itemCount)!
        let priceInt: Int = Int(price)!
        
        if itemCountInt == 5 {
            //alert do-nothing
            let alert = UIAlertController(title: "Warning",
                                          message: "Maximum item count can be 5.",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK",
                                         style: .cancel) { action in
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }else {
            itemCountInt += 1
            orderCountLabel.text = String(itemCountInt)
            foodPriceLabel.text = "\(itemCountInt * priceInt) ₺"
        }
    }
    
    @IBAction func addToCartButtonPressed(_ sender: Any) {
        if let currentUser = Auth.auth().currentUser?.email {
            foodDetailPresenterObject?.addToBasket(food: foodDetail!, orderCount: Int(orderCountLabel.text!) ?? 1, user: currentUser)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FoodDetailViewController: PresenterToViewFoodDetailProtocol {
    func sendDataToView(message: String) {
        let alertController = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
