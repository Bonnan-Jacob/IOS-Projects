//
//  ViewController.swift
//  testing-class
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
//import SwiftyStoreKit
import StoreKit

var sharedSecret = "87b03a4b776e41f5b0c3e7e3ef5fc055"

var amountLeft: CGFloat!
var totalAmount: CGFloat!
var btmLbl: UILabel!

//save variables
var budgetAmtdefaults = UserDefaults.standard
var budgetAvalibledefaults = UserDefaults.standard
var budgetNamesdefaults = UserDefaults.standard
var idSave = UserDefaults.standard
var start = UserDefaults.standard
var dateStart = UserDefaults.standard
var dateEnd = UserDefaults.standard
var buySave = UserDefaults.standard
var bgInt = UserDefaults.standard

var rmBtn: UIButton!
var idCount: Int! // give an id to the custom view class
var canTap: Bool!
var didBuy1: Bool!
var scrollView: UIScrollView!
var topMidLable: UIColor!
var dateLbl: UILabel!
var continueBug: Bool!

var bugetViews: UIView!
var height: CGFloat!
var xStyle: CGFloat!
var menuBtn: UIButton!

class ViewController: UIViewController, UITextFieldDelegate,SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        //location is relative to the current view
        // do something with the touched point
      
        guard let location = touch?.location(in: self.view) else { return }
      
        if nameTextFeild != nil{
            nameTextFeild.resignFirstResponder()
        }
        if amountTextFeild != nil{
            amountTextFeild.resignFirstResponder()
       
         }
    }
    
    let bundleId = "com.bonnan.Budgetize"
    
    var background: UIView!
    var nameTextFeild: UITextField!
    var amountTextFeild: UITextField!
    var form: UIView!
    var iapview: UIView!
    var saveButton: UIButton!
    var weekBtn: UIButton!
    var twoWeekBtn: UIButton!
    var fourWeekBtn: UIButton!
    var lable: UILabel!
    var selectPeriodLbl: UILabel!
    var blockYpos: CGFloat!
    var endDate: Date!
    var didStartDate: Bool!
    var list = [SKProduct]()
    var p = SKProduct()
    var doneButn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                xStyle = 0
            case 1334:
                print("iPhone 6/6S/7/8")
                xStyle = 0
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                xStyle = 0
            case 2436:
                print("iPhone X, Xs")
                xStyle = 30
            case 2688:
                print("iPhone Xs Max")
                xStyle = 30
            case 1792:
                print("iPhone Xr")
                xStyle = 30
            default:
                print("unknown")
                xStyle = 30
            }
        }
        
        canTap = true
        
        didBuy1 = buySave.bool(forKey: "didBuy")
        
        if(SKPaymentQueue.canMakePayments()){
            print("IAP is enabled, loading")
            let productID: NSSet = NSSet(object: "com.bonnan.Budgetize.pluss")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        }
        else{
            print("Please enable IAP")
        }
        
        let didStart = start.integer(forKey: "start")
        
        //youcan()
        blockYpos = 14
        idCount = 0
        totalAmount = 0
        amountLeft = 0
        height = 0
        
        if didStart == 0{
            startNew()
        }
        else{
            continueBug = true
            didStartDate = true
            continueBudgets()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func continueBudgets(){
        idCount = 0
        buildTopBanner()
        bottomBtns()
        dateLblM(timeint: dateEnd.double(forKey: "dateEnd"))
        if idSave.integer(forKey: "count") > 0{
            for i in 1...idSave.integer(forKey: "count") {
                var viewheight = CGFloat(self.view.bounds.height/11)
                
                // var view1 = customView(frame: CGRect(x: 10, y: 0, width: self.view.bounds.width - 20 , height: self.view.bounds.height/11))
                var view1 = customView(frame: CGRect(x: (self.view.bounds.width - 355) / 2, y: 0, width: 355 , height: 73.81818181818181))
                view1.moveY(newMinY: CGFloat(blockYpos))
                view1.budgetName = budgetNamesdefaults.string(forKey: "\(i)")
                view1.budgetAmount = budgetAmtdefaults.float(forKey: "\(1000 + i)")
                view1.returnAmt = budgetAvalibledefaults.float(forKey: "\(2000 + i)")
                view1.final()
                idCount = idCount + 1
                view1.id = idCount
                blockYpos = CGFloat(blockYpos) + view1.bounds.height + CGFloat(14)
                
                //totals
                totalAmount = totalAmount + CGFloat(budgetAmtdefaults.float(forKey: "\(1000 + i)"))
                amountLeft = amountLeft + CGFloat(budgetAvalibledefaults.float(forKey: "\(2000 + i)"))
                btmLbl.text = "Total $\(amountLeft!)/ \(totalAmount!)"
                //save stuff
                
                //bugetViews = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
                bugetViews.frame.size.height = blockYpos
                scrollView.contentSize = bugetViews.frame.size
                
                self.view.scrollView.addSubview(view1)
            }
        }
    }
    
    func buildTopBanner(){
        

        
        switch  bgInt.integer(forKey: "bg") {
        case 1:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "sky.png") ?? UIColor.red as! UIImage)
            break
        case 2:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "person.png") ?? UIColor.red as! UIImage)
            break
        case 3:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "lips.png") ?? UIColor.red as! UIImage)
            break
        case 4:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "brick.png") ?? UIColor.red as! UIImage)
            break
        case 5:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "ba.png") ?? UIColor.red as! UIImage)
            topMidLable = UIColor.white
            break
        case 6:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "birds.png") ?? UIColor.red as! UIImage)
            break
        case 7:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "black-2.png") ?? UIColor.red as! UIImage)
            topMidLable = UIColor.white
            break
        case 8:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "background.png") ?? UIColor.red as! UIImage)
            break
        default:
            background.backgroundColor = UIColor(patternImage: UIImage(named: "background.png") ?? UIColor.red as! UIImage)
        }
        
        var btmLine = UIView(frame: CGRect(x: 0, y: self.view.bounds.height/10 + xStyle, width: self.view.bounds.width, height: 1))
        btmLine.backgroundColor = UIColor.lightGray
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: btmLine.frame.midY, width: self.view.bounds.width, height: self.view.bounds.height - self.view.bounds.height/5 - xStyle ))
        scrollView.isPagingEnabled = false
        scrollView.isUserInteractionEnabled = true
        scrollView.alwaysBounceVertical = true
        bugetViews = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        
        
        self.view.addSubview(background)
        self.view.addSubview(scrollView)
        scrollView.addSubview(bugetViews)
        self.view.addSubview(btmLine)
        
        buildOption()
    }
    func dateLblM(timeint: Double){
        
        let startDate : Date
        if continueBug == false{
            startDate = Date()
            dateStart.setValue(Date(), forKey: "dateStart")
            print("if")
            continueBug = true
        }
        else{
            startDate = dateStart.object(forKey: "dateStart") as! Date
            print("else")
            
        }
        
        let calendar = Calendar.current
        
        endDate = Date(timeInterval: timeint, since: startDate)
        
        //get month
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        
        var startMonth = dateFormatter.string(from: startDate)
        var endMonth = dateFormatter.string(from: endDate)
        
        //get day
        let startDay = calendar.component(.day, from: startDate)
        let endDay = calendar.component(.day, from: endDate)
        
        let monthS = startDay
        let monthE = endDay
        var startDayStr = ""
        var endDayStr = ""
        
        if monthS == 1{
            startDayStr = "1st"
        }
        else if monthS == 2{
            startDayStr = "2nd"
        }
        else if monthS == 3{
            startDayStr = "3rd"
        }
        else{
            startDayStr = "\(startDay)th"
        }
        
        if monthE == 1{
            endDayStr = "1st"
        }
        else if monthE == 2{
            endDayStr = "2nd"
        }
        else if monthE == 3{
            endDayStr = "3rd"
            
        }
        else{
            endDayStr = "\(endDay)th"
        }
        
        dateLbl = UILabel(frame: CGRect(x: 0, y: xStyle, width: self.view.bounds.width, height: self.view.bounds.height/10))
        dateLbl.numberOfLines = 0
        dateLbl.text = "My budget\n\(startMonth) \(startDayStr) - \(endMonth) \(endDayStr)"
        dateLbl.textAlignment = .center
        dateLbl.font = UIFont(name: "AppleSDGothicNeo", size: dateLbl.frame.height/2)
        dateLbl.adjustsFontSizeToFitWidth = true
        dateLbl.textColor = topMidLable ?? UIColor.black
        
        self.view.addSubview(dateLbl)
        
        daysLeftLbl()
        
    }
    func daysLeftLbl(){
        let currentDate = Date()
        
        let diffInDays = Calendar.current.dateComponents([.day], from: currentDate, to: endDate ?? currentDate).day
        if diffInDays == 0 {
            day0()
        }
        
        var daysLeftLbl = UILabel(frame: CGRect(x: self.view.bounds.width - 83, y: xStyle, width: 83, height: self.view.bounds.height/10))
        daysLeftLbl.numberOfLines = 0
        daysLeftLbl.text = "\(diffInDays! + 1) days\n left."
        daysLeftLbl.textAlignment = .center
        daysLeftLbl.font = UIFont(name: "AppleSDGothicNeo", size: daysLeftLbl.frame.height/6)
        daysLeftLbl.adjustsFontSizeToFitWidth = true
        daysLeftLbl.textColor = UIColor.gray
        daysLeftLbl.font = daysLeftLbl.font.withSize(daysLeftLbl.frame.height/7)
        
        self.view.addSubview(daysLeftLbl)
    }
    
    func bottomBtns(){
        let addButn = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - (self.view.bounds.width / 9) / 2, y: self.view.bounds.height - self.view.bounds.height/20 - self.view.bounds.width / 18, width: self.view.bounds.width / 9, height: self.view.bounds.width / 9))
        addButn.backgroundColor = UIColor(red: 232/225, green: 232/225, blue: 232/225, alpha: 1)
        addButn.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
        addButn.clipsToBounds = true
        addButn.setTitle("+", for: .normal)
        //addButn.titleLabel?.font = UIFont.boldSystemFont(ofSize: self.view.bounds.width / 9)
        addButn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
        addButn.layer.borderWidth = 1.25
        addButn.layer.borderColor = UIColor.lightGray.cgColor
        
        let btmLine = UIView(frame: CGRect(x: 0, y: self.view.bounds.height - self.view.bounds.height/10, width: self.view.bounds.width, height: 1))
        btmLine.backgroundColor = UIColor.lightGray
        
        btmLbl = UILabel(frame: CGRect(x: 20.75, y: self.view.bounds.height - self.view.bounds.height/10 , width: 83, height: self.view.bounds.height/10))
        btmLbl.numberOfLines = 0
        btmLbl.text = "Total $\(amountLeft!)/ \(totalAmount!)"
        btmLbl.textAlignment = .center
        btmLbl.font = UIFont(name: "AppleSDGothicNeo", size: 1)
        btmLbl.adjustsFontSizeToFitWidth = true
        btmLbl.textColor = UIColor.gray
        btmLbl.font = btmLbl.font.withSize(btmLbl.frame.height/7)
        
        self.view.addSubview(btmLbl)
        self.view.addSubview(addButn)
        self.view.addSubview(btmLine)
        
    }
    @objc func buttonAction(_ : UIButton!) {
        print("Button tapped")
        if canTap{
            if  idCount < 4 || didBuy1{
                addBudgetForm()
            }else{
                iapViewFunc()
            }
        }
    }
    func addBudgetForm(){
        
        let formWidth = self.view.bounds.width - 100
        canTap = false
        
        form = UIView(frame: CGRect(x: self.view.bounds.width/2 - formWidth/2, y: self.view.bounds.height/2 - formWidth/2 , width: formWidth, height: formWidth))
        form.layer.shadowOpacity = 0.5
        form.backgroundColor = UIColor(red: 245/225, green: 245/225, blue: 245/225, alpha: 1)
        form.layer.shadowColor = UIColor.black.cgColor
        form.layer.shadowOpacity = 0.5
        form.layer.shadowOffset = CGSize.zero
        form.layer.masksToBounds = false
        form.layer.shadowOffset = CGSize.zero
        
        lable = UILabel(frame: CGRect(x: form.bounds.width/2 - (formWidth - 100)/2 , y: 0 + 25, width: formWidth - 100, height: 35))
        lable.text = "Add a new budget"
        lable.textAlignment = .center
        
        nameTextFeild = UITextField(frame: CGRect(x:  form.bounds.width/2 - (formWidth - 100)/2, y: 0 + 85, width: formWidth - 100, height: 35))
        nameTextFeild.backgroundColor = UIColor.white
        //UIColor(red: 220/225, green: 220/225, blue: 220/225, alpha: 1)
        nameTextFeild.delegate = self
        nameTextFeild.placeholder = "name. ie rent, groceries, coffee"
        nameTextFeild.layer.borderWidth = 1.25
        nameTextFeild.layer.borderColor = UIColor.lightGray.cgColor
        
        amountTextFeild = UITextField(frame: CGRect(x:  form.bounds.width/2 - (formWidth - 100)/2, y: 0 + 140, width: formWidth - 100, height: 35))
        amountTextFeild.backgroundColor = UIColor.white
        //UIColor(red: 220/225, green: 220/225, blue: 220/225, alpha: 1)
        amountTextFeild.delegate = self
        amountTextFeild.placeholder = "budget amount"
        amountTextFeild.keyboardType = UIKeyboardType.decimalPad
        amountTextFeild.layer.borderWidth = 1.25
        amountTextFeild.layer.borderColor = UIColor.lightGray.cgColor
        
        saveButton = UIButton.init(type: .roundedRect)
        saveButton.frame = CGRect(x:  form.bounds.width/2 - 38, y: 215, width: 76, height: 37)
        saveButton.addTarget(self, action: #selector(saveAction(_ :)), for: .touchUpInside)
        saveButton.backgroundColor = UIColor.black
        saveButton.layer.shadowColor = UIColor.black.cgColor
        saveButton.layer.shadowOpacity = 0.5
        saveButton.layer.shadowOffset = CGSize.zero
        saveButton.setTitle("save", for: .normal)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        
        invisBtn()
        
        form.addSubview(lable)
        form.addSubview(nameTextFeild)
        form.addSubview(amountTextFeild)
        form.addSubview(saveButton)
        
        self.view.addSubview(form)
        
    }
    @objc func saveAction(_ : UIButton!) {
        var amount = Float(amountTextFeild.text!) ?? 0
        print("saveAction")
        
        var viewheight = CGFloat(self.view.bounds.height/11)
        
        nameTextFeild.resignFirstResponder()
        amountTextFeild.resignFirstResponder()
        idCount = idCount + 1
        
        var view = customView(frame: CGRect(x: 10, y: 0, width: self.view.bounds.width - 20 , height: 73.81818181818181))
        view.moveY(newMinY: CGFloat(blockYpos))
        view.budgetName = nameTextFeild.text
        view.budgetAmount = amount ?? 0
        view.returnAmt = amount
        view.final()
        view.id = idCount
        
        blockYpos = CGFloat(blockYpos) + view.frame.height + CGFloat(14)
        
        //totals
        totalAmount = totalAmount + CGFloat(amount)
        amountLeft = amountLeft + CGFloat(amount)
        btmLbl.text = "Total $\(amountLeft!)/ \(totalAmount!)"
        
        //save stuff
        
        budgetAvalibledefaults.set(Float(amount), forKey: "\(2000 + idCount!)")
        budgetAmtdefaults.set(Float(amount), forKey: "\(1000 + idCount!)")
        budgetNamesdefaults.set(nameTextFeild.text! ?? "", forKey: "\( idCount!)")
        idSave.set(idCount, forKey: "count")
        
        canTap = true
        
        self.form.removeFromSuperview()
        
        bugetViews.frame.size.height = blockYpos
        
        
        
        scrollView.addSubview(view)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide keyboard on return press
        textField.resignFirstResponder()
        return true
    }
    
    func startNew(){
        blockYpos = 14
        idCount = 0
        totalAmount = 0
        amountLeft = 0
        didStartDate = false
        continueBug = false
        
        let formWidth = self.view.bounds.width - 100
        
        form = UIView(frame: CGRect(x: self.view.bounds.width/2 - formWidth/2, y: self.view.bounds.height/2 - formWidth/1.6 , width: formWidth, height: formWidth/1.3))
        form.layer.shadowOpacity = 0.5
        form.backgroundColor = UIColor(red: 245/225, green: 245/225, blue: 245/225, alpha: 1)
        form.layer.shadowColor = UIColor.black.cgColor
        form.layer.shadowOpacity = 0.5
        form.layer.shadowOffset = CGSize.zero
        form.layer.shadowRadius = 6
        form.layer.masksToBounds = false
        form.layer.shadowOffset = CGSize.zero
        
        lable = UILabel(frame: CGRect(x: form.bounds.width/2 - (formWidth - 20)/2 , y: 0 + 25, width: formWidth - 20, height: 35))
        lable.text = "Welcome, Lets get started!"
        lable.textAlignment = .center
        lable.adjustsFontSizeToFitWidth = true
        
        let btnWidth = (form.frame.width - 40) / 3
        
        weekBtn = UIButton.init(type: .roundedRect)
        weekBtn.frame = CGRect(x:  10 , y: form.frame.height - btnWidth - 10 , width: btnWidth, height: btnWidth)
        weekBtn.addTarget(self, action: #selector(oneWeek(_:)), for: .touchUpInside)
        weekBtn.backgroundColor = UIColor.black
        weekBtn.layer.shadowColor = UIColor.black.cgColor
        weekBtn.layer.shadowOpacity = 0.5
        weekBtn.layer.shadowOffset = CGSize.zero
        weekBtn.layer.shadowRadius = 4
        weekBtn.setTitle("1 week", for: .normal)
        weekBtn.setTitleColor(UIColor.white, for: .normal)
        
        twoWeekBtn = UIButton.init(type: .roundedRect)
        twoWeekBtn.frame = CGRect (x:  form.frame.width/2 - btnWidth/2 , y: form.frame.height - btnWidth - 10 , width: btnWidth, height: btnWidth)
        twoWeekBtn.addTarget(self, action: #selector(TwoWeeks(_:)), for: .touchUpInside)
        twoWeekBtn.backgroundColor = UIColor.black
        twoWeekBtn.layer.shadowColor = UIColor.black.cgColor
        twoWeekBtn.layer.shadowOpacity = 0.5
        twoWeekBtn.layer.shadowOffset = CGSize.zero
        twoWeekBtn.layer.shadowRadius = 4
        twoWeekBtn.setTitle("2 weeks", for: .normal)
        twoWeekBtn.setTitleColor(UIColor.white, for: .normal)
        
        fourWeekBtn = UIButton.init(type: .roundedRect)
        fourWeekBtn.frame = CGRect(x:  form.frame.width - btnWidth - 10 , y: form.frame.height - btnWidth - 10 , width: btnWidth, height: btnWidth)
        fourWeekBtn.addTarget(self, action: #selector(fourWeeks(_:)), for: .touchUpInside)
        fourWeekBtn.backgroundColor = UIColor.black
        fourWeekBtn.layer.shadowColor = UIColor.black.cgColor
        fourWeekBtn.layer.shadowOpacity = 0.5
        fourWeekBtn.layer.shadowOffset = CGSize.zero
        fourWeekBtn.layer.shadowRadius = 4
        fourWeekBtn.setTitle("4 weeks", for: .normal)
        fourWeekBtn.setTitleColor(UIColor.white, for: .normal)
        
        selectPeriodLbl = UILabel(frame: CGRect(x: form.bounds.width/2 - (formWidth - 20)/2 , y: twoWeekBtn.frame.minY - 35 - 10, width: formWidth - 20, height: 35))
        selectPeriodLbl.text = "choose a time period for your budget"
        selectPeriodLbl.adjustsFontSizeToFitWidth = true
        
        form.addSubview(selectPeriodLbl)
        form.addSubview(weekBtn)
        form.addSubview(twoWeekBtn)
        form.addSubview(fourWeekBtn)
        form.addSubview(lable)
        
        self.view.addSubview(form)
        
    }
    @objc func oneWeek(_ : UIButton!) {
        buildTopBanner()
        bottomBtns()
        dateLblM(timeint: 604800)
        form.removeFromSuperview()
        addBudgetForm()
        start.set(1, forKey: "start")
        dateEnd.set(604800, forKey: "dateEnd")
        
    }
    @objc func TwoWeeks(_ : UIButton!) {
        buildTopBanner()
        bottomBtns()
        dateLblM(timeint: 1209600)
        form.removeFromSuperview()
        addBudgetForm()
        start.set(1, forKey: "start")
        dateEnd.set(1209600, forKey: "dateEnd")
        
    }
    @objc func fourWeeks(_ : UIButton!) {
        buildTopBanner()
        bottomBtns()
        form.removeFromSuperview()
        dateLblM(timeint: 2419200)
        addBudgetForm()
        start.set(1, forKey: "start")
        dateEnd.set(2419200, forKey: "dateEnd")
        
    }
    func day0(){
        
        idCount = 0
        continueBug = false
        let loopNum = idSave.integer(forKey: "count")
        if loopNum > 0{
            for i in 1...loopNum {
                
                idCount = i
                
                let newBudgetAmt = budgetAmtdefaults.float(forKey: "\(1000 + i )")
                let newBudgetName = budgetNamesdefaults.string(forKey: "\(i )")
                let newBudgetAvl = budgetAvalibledefaults.float(forKey: "\(2000 + i )")
                
                budgetAvalibledefaults.set(Float(newBudgetAmt), forKey: "\(2000 + idCount!)")
                budgetAmtdefaults.set(Float(newBudgetAmt), forKey: "\(1000 + idCount!)")
                budgetNamesdefaults.set(String(newBudgetName ?? ""), forKey: "\( idCount!)")
                print(idCount)
                idSave.set(idCount, forKey: "count")
                
                for views in scrollView?.subviews as! [UIView]{
                    views.removeFromSuperview()
                }
                blockYpos = 14
                continueBudgets()
                
            }
        }
    }
    
    func invisBtn(){
    
    let inBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        inBtn.addTarget(self, action: #selector(self.inBtnAction), for: .touchUpInside)
        
    self.view.addSubview(inBtn)
    }
    
    @objc func inBtnAction(sender : UIButton){
        if form != nil{
                form.removeFromSuperview()
                canTap = true
        }
        if iapview != nil{
                iapview.removeFromSuperview()
        }
        if optview != nil{
                optview.removeFromSuperview()
                canTap = true
        }
        
        sender.removeFromSuperview()
        
    }
    
}
    
