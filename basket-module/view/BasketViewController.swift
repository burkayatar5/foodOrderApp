//
//  BasketViewController.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.11.2022.
//

import UIKit
import Firebase

class BasketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var totalOrderPrice: UILabel!
    
    var basketPresenterObject: ViewToPresenterBasketProtocol?
    var basketFoodList = [BasketFoods]()
    var totalPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        basketTableView.dataSource = self
        basketTableView.delegate = self
        BasketRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalPrice = 0
        if let user = Auth.auth().currentUser?.email {
            basketPresenterObject?.retrieveBasket(user: user)
            DispatchQueue.main.async {
                self.basketTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketFoodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basketItem = basketFoodList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! BasketTableViewCell
        
        KingFisherSingelton.sharedInstance.getImage(imageName: basketItem.yemek_resim_adi!, imageView: cell.basketFoodImage)
        cell.basketFoodNameLabel.text = basketItem.yemek_adi!
        cell.basketFoodOrderAmountLabel.text = "\(basketItem.yemek_siparis_adet!)"
        var orderAmount: Int = Int(basketItem.yemek_siparis_adet!)!
        var price: Int = Int(basketItem.yemek_fiyat!)!
        var totalAmount = orderAmount * price
        cell.basketFoodPrice.text = "\(totalAmount)₺"
        
        //toplam ücreti hesaplayabilmek için her hücre okumasında yemek fiyatını ekle toplam ücrete
        
        self.totalPrice += totalAmount
        self.totalOrderPrice.text = "\(totalPrice)₺"
        
        //cell design features
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "X") { contextualAction, view, bool in
            let basketItem = self.basketFoodList[indexPath.row]
            let alertController = UIAlertController(title: "Uyarı", message: "Silmek istediğinize emin misiniz?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
            let yesAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.basketPresenterObject?.deleteItemFromBasket(id: Int(basketItem.sepet_yemek_id!)!, user: basketItem.kullanici_adi!)
                DispatchQueue.main.async {
                    self.totalPrice = 0
                    self.basketTableView.reloadData()
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(yesAction)
            self.present(alertController, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacing: CGFloat = 20
        return cellSpacing
    }
    
    @IBAction func sepetiOnaylaButtonPressed(_ sender: Any) {
        
        for item in basketFoodList {
            if let user = Auth.auth().currentUser?.email {
                basketPresenterObject?.deleteItemFromBasket(id: Int(item.sepet_yemek_id!)!, user: user)
            }
        }
        let alertController = UIAlertController(title: "Uyarı", message: "Siparişiniz başarı ile oluşturuldu.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Evet", style: .destructive) { action in
            let root = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.keyWindow?.rootViewController = root
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
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
extension BasketViewController: PresenterToViewBasketProtocol {
    func sendDataToView(basketFoodList: Array<BasketFoods>) {
        self.basketFoodList = basketFoodList
        DispatchQueue.main.async {
            //her yeni çekim sonrası total price'ın bozulmaması için 0 alınması gerekiyor.
            self.totalPrice = 0
            self.basketTableView.reloadData()
        }
    }
}
