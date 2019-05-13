//
//  extention.swift
//  Budgetize
//
//  Created by admin on 11/1/18.
//  Copyright © 2018 bonnan. All rights reserved.
//

import UIKit
//import SwiftyStoreKit
import StoreKit
//in app purchase


extension ViewController {
    
    func iapViewFunc(){
        let iapformWidth = self.view.bounds.width - 75
        let iapformHeight = iapformWidth * 9 / 8
        canTap = false
        
        iapview = UIView(frame: CGRect(x: self.view.bounds.width/2 - iapformWidth/2, y: self.view.bounds.height/2 - iapformHeight/2  , width: iapformWidth, height: iapformHeight))
        iapview.layer.shadowOpacity = 0.5
        iapview.backgroundColor = UIColor(red: 245/225, green: 245/225, blue: 245/225, alpha: 1)
        iapview.layer.shadowColor = UIColor.black.cgColor
        iapview.layer.shadowOpacity = 0.5
        iapview.layer.shadowOffset = CGSize.zero
        iapview.layer.shadowRadius = 6
        iapview.layer.masksToBounds = false
        iapview.layer.shadowOffset = CGSize.zero
        
        let iaplable = UILabel(frame: CGRect(x: 5 , y: 0 - 50 , width: iapformWidth - 10, height:  iapformHeight))
        iaplable.numberOfLines = 0
        iaplable.text = "Budgetvue Plus!\n\n\nUnlock all the features of Budgetvue\n\n-Unlimited budgets\n-7 New background options for customization\n-Watch support coming soon"
        iaplable.textAlignment = .center
        iaplable.adjustsFontSizeToFitWidth = true
        
        let iapButn = UIButton(frame: CGRect(x: iapview.frame.width/2 - 50 * 9/10, y: iapview.frame.height - 70, width: 50 * 9/5, height: 50))
        iapButn.backgroundColor = UIColor(red: 232/225, green: 232/225, blue: 232/225, alpha: 1)
        iapButn.addTarget(self, action: #selector(iapButtonAction(_ :)), for: .touchUpInside)
        iapButn.clipsToBounds = true
        iapButn.setTitle("upgrade", for: .normal)
        //addButn.titleLabel?.font = UIFont.boldSystemFont(ofSize: self.view.bounds.width / 9)
        iapButn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
        iapButn.layer.borderWidth = 1.25
        iapButn.layer.borderColor = UIColor.lightGray.cgColor
        
        invisBtn()
        
        iapview.addSubview(iaplable)
        iapview.addSubview(iapButn)
        self.view.addSubview(iapview)
        
    }
    
    @objc func iapButtonAction(_ : UIButton!) {
        purchasePlus()
        print("in iap")
    }
    
    
    func purchasePlus(){
        for product in list{
            let prodID = product.productIdentifier
            print("!!!!")
            print(prodID)
            if(prodID == "com.bonnan.Budgetize.pluss"){
                p = product
                buyProduct()
            }
        }
    }
    
    func buyProduct(){
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let myProduct = response.products
        for product in myProduct{
            print("product added")
            print(product.productIdentifier)
            print(product.localizedTitle)
            list.append(product)
            print("Appended product")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add payment")
        //didBuy1 = false
     
        for transaction: AnyObject in transactions{
            let trans = transaction as! SKPaymentTransaction
            print(trans.error as Any)
            
            switch trans.transactionState{
            case .purchased, .restored:
                print("buy ok, unlock IAP")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier
                
                switch prodID{
                case "com.bonnan.Budgetize.pluss":
                    ActivatePlus()
                    print("Unlimited budgets")
                default:
                    print("Default1")
                    break
                }
                queue .finishTransaction(trans)
            case .failed:
                print("fail")
                queue .finishTransaction(trans)
                
                break
            default:
                print("Default2")
            }
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        print("Transaction restored")
        for transaction in queue.transactions{
            let t: SKPaymentTransaction = transaction
            let prodID = t.payment.productIdentifier as String
            switch prodID{
            case "com.bonnan.Budgetize.pluss":
                print("Unlimited budgets")
                ActivatePlus()
            default:
                print("IAP not found")
            }
        }
    }
    
    func ActivatePlus(){
        buySave.set(true, forKey: "didBuy")
        didBuy1 = buySave.bool(forKey: "didBuy")
        if iapview != nil{
            canTap = true
        }
    }
    
    
}
