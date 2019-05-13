//
//  ViewController.swift
//  calter
//
//  Created by Jacob Bonnan on 11/27/18.
//  Copyright © 2018 Jacob Bonnan. All rights reserved.
//

import UIKit
import YXWaveView

class ViewController: UIViewController, UITextFieldDelegate{

    var variableCal = UserDefaults.standard
    var totalCal = UserDefaults.standard
    
    var xStyle : CGFloat!
    var canTap : Bool!
    var input : String!
    var mView : UIView!
    var blurEffectView : UIVisualEffectView! = nil
    var textFeild: UITextField!
    var progBar: UIProgressView!
    var calAmountT = 2100.00
    var calAmountL = 2100.00
    var topLbl2: UILabel!
    var topLbl: UILabel!
    var waterView:  YXWaveView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        canTap = true
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
                xStyle = 0
            }
        }
        progBar = UIProgressView()
        progBar.bounds.size.width = self.view.frame.height - xStyle - 175
        progBar.bounds.size.height = self.view.frame.width
        progBar.center.x = self.view.bounds.midX
        progBar.center.y = self.view.frame.height/2  - xStyle
        
        progBar.transform = CGAffineTransform(rotationAngle: .pi * -0.5)
        progBar.setProgress(1, animated: false)
        progBar.progressTintColor = UIColor.white
        progBar.trackTintColor = UIColor.orange
        progBar.transform = progBar.transform.scaledBy(x: 1, y: self.view.bounds.width/2)
        
        self.view.addSubview(progBar)
        
        var topView = UIView(frame: CGRect(x: 0, y: progBar.frame.maxY - 2, width: self.view.frame.width, height: self.view.frame.height))
        topView.backgroundColor = UIColor.white
        self.view.addSubview(topView)
        
        var fromBottom = (self.view.frame.height - progBar.frame.maxY) + 39
         topLbl2 = UILabel(frame: CGRect(x: 0, y: self.view.frame.height - (progBar.frame.height * CGFloat(progBar.progress)) - fromBottom, width: self.view.frame.width, height: 52 + xStyle))
        topLbl2.font = UIFont(name: "AlienEncountersBold", size: 78)
        topLbl2.text = "2100"
        topLbl2.textAlignment = .center
        
        self.view.backgroundColor = UIColor.orange
        
        //self.view.addSubview(topView)
        let frame = CGRect(x: 0, y: topLbl2.frame.midY - 52, width: self.view.frame.width, height: 52)
        waterView = YXWaveView(frame: frame, color: UIColor.white)
        waterView.waveHeight = 13
        //waterView.addOverView(waterView)
        waterView.realWaveColor = UIColor.white
        
        self.view.addSubview(waterView)
        self.view.addSubview(topLbl2)
        
        waterView.start()
    
        let buttonView = UIView(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height - 87.5, width: 200, height: 50))
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowOpacity = 0.5
        buttonView.layer.shadowOffset = CGSize.zero
        buttonView.layer.shadowRadius = 5
        
        let mbutton = UIButton(type: .custom)
        mbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        mbutton.backgroundColor = UIColor.orange
        mbutton.setTitle("M",for: .normal)
        mbutton.setTitleColor(UIColor.black, for: .normal)
        mbutton.titleLabel?.font = UIFont(name: "AlienEncountersBold", size: 27)
        mbutton.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        buttonView.addSubview(mbutton)
        
        let cbutton = UIButton(type: .custom)
        cbutton.frame = CGRect(x: 50, y: 0, width: 150, height: 50)
        cbutton.backgroundColor = UIColor.black
        cbutton.setTitle("-calories",for: .normal)
        cbutton.setTitleColor(UIColor.white, for: .normal)
        cbutton.titleLabel?.font = UIFont(name: "AlienEncountersBold", size: 27)
        cbutton.addTarget(self, action: #selector(minCal), for: .touchUpInside)
        buttonView.addSubview(cbutton)
        
        view.addSubview(buttonView)
       
    }
    @objc func thumbsUpButtonPressed() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(blurEffectView)
    
        mView = UIView(frame: CGRect(x: self.view.frame.width/2 - 175, y: self.view.frame.height/2 - 100, width: 350 ,height: 200))
        
        topLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        topLbl.font = UIFont(name: "AlienEncountersBold", size: 19)
        topLbl.text = "How many callories to \nconsume each day?"
        topLbl.numberOfLines = 0
        topLbl.textAlignment = .center
        mView.addSubview(topLbl)
        
        let buttonView = UIView(frame: CGRect(x: mView.frame.width/2 - 100, y: mView.frame.height - 50, width: 200, height: 50))
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowOpacity = 0.5
        buttonView.layer.shadowOffset = CGSize.zero
        buttonView.layer.shadowRadius = 5
        
        let dbutton = UIButton(type: .custom)
        dbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        dbutton.backgroundColor = UIColor.orange
        dbutton.setTitle("X",for: .normal)
        dbutton.setTitleColor(UIColor.black, for: .normal)
        dbutton.titleLabel?.font = UIFont(name: "AlienEncountersBold", size: 27)
        dbutton.addTarget(self, action: #selector(mDone), for: .touchUpInside)
        buttonView.addSubview(dbutton)
        
        let sbutton = UIButton(type: .custom)
        sbutton.frame = CGRect(x: 50, y: 0, width: 150, height: 50)
        sbutton.backgroundColor = UIColor.black
        sbutton.setTitle("save",for: .normal)
        sbutton.setTitleColor(UIColor.white, for: .normal)
        sbutton.titleLabel?.font = UIFont(name: "AlienEncountersBold", size: 27)
        sbutton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        buttonView.addSubview(sbutton)
        mView.addSubview(buttonView)
        
        textFeild = UITextField(frame: CGRect(x: 100 , y: 75 , width: 150, height: 45))
        textFeild.backgroundColor = UIColor.white
        textFeild.placeholder = "Number of Cals"
        textFeild.awakeFromNib()
        textFeild.delegate = self
        textFeild.clipsToBounds = true
        textFeild.textAlignment = .center
        textFeild.layer.borderWidth = 1.25
        textFeild.layer.borderColor = UIColor.lightGray.cgColor
        textFeild.keyboardType = UIKeyboardType.decimalPad
        textFeild.returnKeyType = .done
        mView.addSubview(textFeild)
        input = textFeild.text ?? ""
        
        //addDoneButtonOnKeyboard()
        
        self.view.addSubview(mView)
    }
    
    @objc func mDone() {
        mView.removeFromSuperview()
        blurEffectView.removeFromSuperview()
        print("hi")
    }
    @objc func saveAction() {
        
        var amount = Float(textFeild.text!) ?? 0
        
        waterView.removeFromSuperview()
        progBar.removeFromSuperview()
        
        calAmountL = Double(calAmountL) - Double(amount)
        progBar.setProgress(Float(calAmountL/calAmountT), animated: false)
        
        top()
        mView.removeFromSuperview()
        blurEffectView.removeFromSuperview()
    }
    @objc func mSave() {}
    
    @objc func minCal() {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(blurEffectView)
        
        mView = UIView(frame: CGRect(x: self.view.frame.width/2 - 175, y: self.view.frame.height/2 - 100, width: 350 ,height: 200))
        
        var topLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        topLbl.font = UIFont(name: "AlienEncountersBold", size: 19)
        topLbl.text = "How many callories have \nbeen consumed?"
        topLbl.numberOfLines = 0
        topLbl.textAlignment = .center
        mView.addSubview(topLbl)
        
        let buttonView = UIView(frame: CGRect(x: mView.frame.width/2 - 100, y: mView.frame.height - 50, width: 200, height: 50))
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowOpacity = 0.5
        buttonView.layer.shadowOffset = CGSize.zero
        buttonView.layer.shadowRadius = 5
        
        let dbutton = UIButton(type: .custom)
        dbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        dbutton.backgroundColor = UIColor.orange
        dbutton.setTitle("X",for: .normal)
        dbutton.setTitleColor(UIColor.black, for: .normal)
        dbutton.titleLabel?.font = UIFont(name: "AlienEncountersBold", size: 27)
        dbutton.addTarget(self, action: #selector(mDone), for: .touchUpInside)
        buttonView.addSubview(dbutton)
        
        let sbutton = UIButton(type: .custom)
        sbutton.frame = CGRect(x: 50, y: 0, width: 150, height: 50)
        sbutton.backgroundColor = UIColor.black
        sbutton.setTitle("save",for: .normal)
        sbutton.setTitleColor(UIColor.white, for: .normal)
        sbutton.titleLabel?.font = UIFont(name: "AlienEncountersBold", size: 27)
        sbutton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        buttonView.addSubview(sbutton)
        mView.addSubview(buttonView)
        
        textFeild = UITextField(frame: CGRect(x: 100 , y: 75 , width: 150, height: 45))
        textFeild.backgroundColor = UIColor.white
        textFeild.placeholder = "Number of Cals"
        textFeild.awakeFromNib()
        textFeild.delegate = self
        textFeild.clipsToBounds = true
        textFeild.textAlignment = .center
        textFeild.layer.borderWidth = 1.25
        textFeild.layer.borderColor = UIColor.lightGray.cgColor
        textFeild.keyboardType = UIKeyboardType.decimalPad
        textFeild.returnKeyType = .done
        mView.addSubview(textFeild)
        input = textFeild.text ?? ""
        
        //addDoneButtonOnKeyboard()
        
        self.view.addSubview(mView)
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneButtonAction))
        
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.textFeild.inputAccessoryView = doneToolbar
    }
    @objc func doneButtonAction() {
        textFeild.resignFirstResponder()
    }
    func top(){
        topLbl2.removeFromSuperview()
        
        self.view.addSubview(progBar)
        
        var fromBottom = (self.view.frame.height - progBar.frame.maxY) + 39
        topLbl2 = UILabel(frame: CGRect(x: 0, y: self.view.frame.height - (progBar.frame.height * CGFloat(progBar.progress)) - fromBottom, width: self.view.frame.width, height: 52 + xStyle))
        topLbl2.font = UIFont(name: "AlienEncountersBold", size: 78)
        topLbl2.text = "\(calAmountL)"
        topLbl2.textAlignment = .center
        
        //self.view.addSubview(topView)
        let frame = CGRect(x: 0, y: topLbl2.frame.midY - 52, width: self.view.frame.width, height: 52)
        waterView = YXWaveView(frame: frame, color: UIColor.white)
        waterView.waveHeight = 13
        //waterView.addOverView(waterView)
        waterView.realWaveColor = UIColor.white
        
        self.view.addSubview(waterView)
        self.view.addSubview(topLbl2)

        
        waterView.start()
      
        
    }
}



