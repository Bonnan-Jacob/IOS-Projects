//
//  customView.swift
//  testing-class
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

class customView: UIView, UITextFieldDelegate{
    
    
    var budgetName: String!
    var budgetAmount: Float!
    var id : Int!
    var returnAmt : Float!
    
    private var budgetAmountRemaining: Float!
    private var inputText: String!
    private var inputConvert: Float!
    
    private var textFeild: UITextField!
    private var progBar: UIProgressView!
    private var amountLable: UILabel!
    
    /*  func editBudget(){
     let delButn = UIButton(frame: CGRect(x: frame.width/2 - 60 * 9/10, y: frame.height/2 - 30, width: 60 * 9/5, height: 60))
     delButn.backgroundColor = UIColor(red: 232/225, green: 232/225, blue: 232/225, alpha: 1)
     delButn.addTarget(self, action: #selector(delButtonAction(_ :)), for: .touchUpInside)
     delButn.clipsToBounds = true
     delButn.setTitle("Delete", for: .normal)
     delButn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
     delButn.layer.borderWidth = 1.25
     delButn.layer.borderColor = UIColor.lightGray.cgColor
     
     self.addSubview(delButn)
     }
     */
    /* @objc func delButtonAction(_ : UIButton!) {
     var inc = 0
     self.removeFromSuperview()
     idCount = 0
     
     for i in 1...idSave.integer(forKey: "count") {
     
     if budgetName == budgetNamesdefaults.string(forKey: "\(i)"){
     inc = 1
     }
     
     let newBudgetAmt = budgetAmtdefaults.float(forKey: "\(1000 + i + inc)")
     let newBudgetName = budgetNamesdefaults.string(forKey: "\(i + inc)")
     let newBudgetAvl = budgetAvalibledefaults.float(forKey: "\(2000 + i + inc)")
     
     budgetAvalibledefaults.set(Float(newBudgetAvl), forKey: "\(2000 + idCount!)")
     budgetAmtdefaults.set(Float(newBudgetAmt), forKey: "\(1000 + idCount!)")
     budgetNamesdefaults.set(String(newBudgetName ?? ""), forKey: "\( idCount!)")
     idSave.set(idCount, forKey: "count")
     
     idCount += 1
     */
    
    func final(){
        createLables()
        //  editBudget()
    }
    
    func moveY(newMinY: CGFloat){
        self.frame = CGRect(x: frame.minX, y: newMinY, width: frame.width, height: frame.height)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "-Amount", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneButtonAction))
        
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.textFeild.inputAccessoryView = doneToolbar
    }
    
    func getFrame() -> CGRect{
        return self.frame
        
    }
    
    @objc func doneButtonAction() {
        if textFeild.text != ""{
            inputText = textFeild.text //gets input string makes it a float
            inputConvert = NSString(string: inputText).floatValue
            budgetAmountRemaining = budgetAmountRemaining - inputConvert //new budget amount
            amountLeft = amountLeft - CGFloat(inputConvert ?? 0)
            btmLbl.text = "Total $\(amountLeft!)/ \(totalAmount!)"
            
            progBar.setProgress(budgetAmountRemaining / budgetAmount, animated: true) //animates prog bar
            amountLable.text = "$\(budgetAmountRemaining ?? 0)/ \(budgetAmount ?? 0)" //change lable val
            
            textFeild.text = nil
            
            budgetAvalibledefaults.set(Float(budgetAmountRemaining), forKey: "\(2000 + id)")
            
            
        }
        textFeild.resignFirstResponder()
        
    }
    
    private func textInputAndButton(){
        textFeild = UITextField(frame: CGRect(x: self.frame.width - self.frame.height * 2/3 - 10 , y: 10 , width: frame.height * 2/3, height: frame.height - 20))
        textFeild.backgroundColor = UIColor.white
        textFeild.placeholder = "-$"
        textFeild.awakeFromNib()
        textFeild.delegate = self
        textFeild.clipsToBounds = true
        textFeild.textAlignment = .center
        textFeild.layer.borderWidth = 1.25
        textFeild.layer.borderColor = UIColor.lightGray.cgColor
        textFeild.keyboardType = UIKeyboardType.decimalPad
        textFeild.returnKeyType = .done
        
        inputText = textFeild.text
        
        addDoneButtonOnKeyboard()
        
        self.addSubview(textFeild)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //hide keyboard
        textFeild.resignFirstResponder()
    }
    
    
    private func createLables(){
        var nameLable = UILabel.init(frame: CGRect(x: 10, y: frame.height/4 , width: frame.width/2, height: frame.height/2 ))
        nameLable.text = budgetName
        nameLable.font = UIFont(name: "Avenir-Light", size: frame.height/2)
        nameLable.adjustsFontSizeToFitWidth = true
        
        progBar = UIProgressView(frame: CGRect(x: 10, y: self.frame.height - 10 - 2, width: self.frame.width - 30 - frame.height * 2/3, height: 20))
        progBar.setProgress(returnAmt / budgetAmount, animated: false)
        progBar.progressTintColor = UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1)
        progBar.trackTintColor = UIColor.lightGray
        progBar.transform = progBar.transform.scaledBy(x: 1, y: 2)
        
        budgetAmountRemaining = returnAmt
        
        amountLable = UILabel.init(frame: CGRect(x: frame.width/2 + 15 , y: nameLable.frame.midY - frame.height/11, width: frame.width/2 - frame.height * 2/3 - 25, height: frame.height/5.5))
        amountLable.text = "$\(budgetAmountRemaining ?? 0)/ \(budgetAmount ?? 0)" //note optional value defaults to '0'
        amountLable.font = UIFont(name: "Avenir-Light", size: frame.height/5.5)
        amountLable.textAlignment = .center
        amountLable.adjustsFontSizeToFitWidth = true
        amountLable.textColor = UIColor.gray
        
        
        textInputAndButton()
        
        self.addSubview(amountLable)
        self.addSubview(progBar)
        self.addSubview(nameLable)
    }
    
    private func setupView(){
        self.backgroundColor = UIColor(red: 245/225, green: 245/225, blue: 245/225, alpha: 1)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = false
        
    }
}
