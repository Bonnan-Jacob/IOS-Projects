import UIKit
import StoreKit

var optview: UIView!

extension ViewController {
    
    func buildOption(){
        let BtnSize = self.view.bounds.width / 9
        if canTap{
        menuBtn = UIButton(frame: CGRect(x: 20 , y: xStyle + 17.5 , width: BtnSize, height: BtnSize))
        menuBtn.addTarget(self, action: #selector(menuBtnAction(_ :)), for: .touchUpInside)
        menuBtn.clipsToBounds = true
        menuBtn.setTitle("=", for: .normal)
        menuBtn.titleLabel?.font =  .systemFont(ofSize: 35)
        menuBtn.setTitleColor(UIColor.gray, for: .normal)
        menuBtn.titleLabel?.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(menuBtn)
        }
        
    }
    @objc func menuBtnAction(_ : UIButton!) {
        
        if canTap{
            canTap = false
            let optformWidth: CGFloat = 300.0
            //let optformWidth = self.view.bounds.width - 75
            let optformHeight = optformWidth * 9/5
            let halfway = self.view.bounds.width/2
            
            optview = UIView(frame: CGRect(x: halfway - optformWidth/2, y: self.view.bounds.height/2 - optformHeight/2  , width: optformWidth, height: optformHeight))
            optview.layer.shadowOpacity = 0.5
            optview.backgroundColor = UIColor(red: 245/225, green: 245/225, blue: 245/225, alpha: 1)
            optview.layer.shadowColor = UIColor.black.cgColor
            optview.layer.shadowOpacity = 0.5
            optview.layer.shadowOffset = CGSize.zero
            optview.layer.shadowRadius = 6
            optview.layer.masksToBounds = false
            optview.layer.shadowOffset = CGSize.zero
            
            let optlable = UILabel(frame: CGRect(x: 5 , y: 5 , width: optformWidth - 10, height:  30))
            optlable.numberOfLines = 0
            optlable.text = "Options"
            optlable.textAlignment = .center
            optlable.adjustsFontSizeToFitWidth = true
            
            let delBudBtn = UIButton(frame: CGRect(x: 15, y: 50, width: optformWidth - 30, height: 70))
            delBudBtn.backgroundColor = UIColor(red: 232/225, green: 232/225, blue: 232/225, alpha: 1)
            delBudBtn.addTarget(self, action: #selector(delBudAction(_ :)), for: .touchUpInside)
            delBudBtn.clipsToBounds = true
            delBudBtn.setTitle("Remove a budget", for: .normal)
            delBudBtn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
            delBudBtn.layer.borderWidth = 1.25
            delBudBtn.layer.borderColor = UIColor.lightGray.cgColor
            
            let startNewBtn = UIButton(frame: CGRect(x: 15, y: 140, width: optformWidth - 30, height: 70))
            startNewBtn.backgroundColor = UIColor(red: 232/225, green: 232/225, blue: 232/225, alpha: 1)
            startNewBtn.addTarget(self, action: #selector(startNewAction(_ :)), for: .touchUpInside)
            startNewBtn.clipsToBounds = true
            startNewBtn.setTitle("Start new", for: .normal)
            startNewBtn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
            startNewBtn.layer.borderWidth = 1.25
            startNewBtn.layer.borderColor = UIColor.lightGray.cgColor
            
            let collable = UILabel(frame: CGRect(x: 5 , y: 230 , width: optformWidth - 10, height:  30))
            collable.numberOfLines = 0
            collable.text = "Customize"
            collable.textAlignment = .center
            collable.adjustsFontSizeToFitWidth = true
            
            //creamy peach
            let pColBtn = UIButton(frame: CGRect(x: 10, y: 270, width: 62.5, height: 62.5))
            pColBtn.addTarget(self, action: #selector(pColBtnAction(_ :)), for: .touchUpInside)
            pColBtn.clipsToBounds = true
            pColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "sky.png") ?? UIColor.red as! UIImage)
            pColBtn.layer.borderWidth = 1.25
            pColBtn.layer.borderColor = UIColor.gray.cgColor
            
            //rosy highlight
            let rColBtn = UIButton(frame: CGRect(x: 82.5, y: 270, width: 62.5, height: 62.5))
            rColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "person.png") ?? UIColor.red as! UIImage)
            rColBtn.addTarget(self, action: #selector(rColBtnAction(_ :)), for: .touchUpInside)
            rColBtn.clipsToBounds = true
            rColBtn.layer.borderWidth = 1.25
            rColBtn.layer.borderColor = UIColor.gray.cgColor
            
            //soft blue
            let sColBtn = UIButton(frame: CGRect(x: 155, y: 270, width: 62.5, height: 62.5))
            sColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "lips.png") ?? UIColor.red as! UIImage)
            sColBtn.addTarget(self, action: #selector(sColBtnAction(_ :)), for: .touchUpInside)
            sColBtn.clipsToBounds = true
            sColBtn.layer.borderWidth = 1.25
            sColBtn.layer.borderColor = UIColor.gray.cgColor
            
            //green
            let bColBtn = UIButton(frame: CGRect(x: 227.5, y: 270, width: 62.5, height: 62.5))
            bColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "brick.png") ?? UIColor.red as! UIImage)
            bColBtn.addTarget(self, action: #selector(bColBtnAction(_ :)), for: .touchUpInside)
            bColBtn.clipsToBounds = true
            bColBtn.layer.borderWidth = 1.25
            bColBtn.layer.borderColor = UIColor.gray.cgColor
            ////row 2
            //purple mountain
            let mColBtn = UIButton(frame: CGRect(x: 10, y: 352.5, width: 62.5, height: 62.5))
            mColBtn.addTarget(self, action: #selector(mColBtnAction(_ :)), for: .touchUpInside)
            mColBtn.clipsToBounds = true
            mColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "ba.png") ?? UIColor.red as! UIImage)
            mColBtn.layer.borderWidth = 1.25
            mColBtn.layer.borderColor = UIColor.gray.cgColor
            
            //rouge pink
            let piColBtn = UIButton(frame: CGRect(x: 82.5, y: 352.5, width: 62.5, height: 62.5))
            piColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "birds.png") ?? UIColor.red as! UIImage)
            piColBtn.addTarget(self, action: #selector(piColBtnAction(_ :)), for: .touchUpInside)
            piColBtn.clipsToBounds = true
            piColBtn.layer.borderWidth = 1.25
            piColBtn.layer.borderColor = UIColor.gray.cgColor
            
            //soft gray
            let sbColBtn = UIButton(frame: CGRect(x: 155, y: 352.5, width: 62.5, height: 62.5))
            sbColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "black-2.png") ?? UIColor.red as! UIImage)
            sbColBtn.addTarget(self, action: #selector(sbColBtnAction(_ :)), for: .touchUpInside)
            sbColBtn.clipsToBounds = true
            sbColBtn.layer.borderWidth = 1.25
            sbColBtn.layer.borderColor = UIColor.gray.cgColor
            
            //white
            let wColBtn = UIButton(frame: CGRect(x: 227.5, y: 352.5, width: 62.5, height: 62.5))
            wColBtn.backgroundColor = UIColor(patternImage: UIImage(named: "background.png") ?? UIColor.red as! UIImage)
            wColBtn.addTarget(self, action: #selector(wColBtnAction(_ :)), for: .touchUpInside)
            wColBtn.clipsToBounds = true
            wColBtn.layer.borderWidth = 1.25
            wColBtn.layer.borderColor = UIColor.gray.cgColor
            
            let restoreBtn = UIButton(frame: CGRect(x: 30, y: 435, width: optformWidth - 60, height: 35))
            restoreBtn.backgroundColor = UIColor(red: 245/225, green: 245/225, blue: 245/225, alpha: 1)
            restoreBtn.addTarget(self, action: #selector(restoreAction(_ :)), for: .touchUpInside)
            restoreBtn.clipsToBounds = true
            restoreBtn.setTitle("Restore purchase", for: .normal)
            restoreBtn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
            restoreBtn.layer.borderWidth = 1.25
            restoreBtn.layer.borderColor = UIColor.lightGray.cgColor
            
            let doneBtn = UIButton(frame: CGRect(x: 30, y: 480, width: optformWidth - 60, height: 35))
            doneBtn.backgroundColor = UIColor(red: 245/225, green: 245/225, blue: 245/225, alpha: 1)
            doneBtn.addTarget(self, action: #selector(doneAction(_ :)), for: .touchUpInside)
            doneBtn.clipsToBounds = true
            doneBtn.setTitle("Done", for: .normal)
            doneBtn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
            doneBtn.layer.borderWidth = 1.25
            doneBtn.layer.borderColor = UIColor.lightGray.cgColor
            
            optview.addSubview(restoreBtn)
            optview.addSubview(doneBtn)
            //r2
            optview.addSubview(wColBtn)
            optview.addSubview(sbColBtn)
            optview.addSubview(piColBtn)
            optview.addSubview(mColBtn)
            //r1
            optview.addSubview(bColBtn)
            optview.addSubview(sColBtn)
            optview.addSubview(rColBtn)
            optview.addSubview(pColBtn)
            //
            optview.addSubview(collable)
            optview.addSubview(startNewBtn)
            optview.addSubview(optlable)
            optview.addSubview(delBudBtn)
            
            invisBtn()
            
            self.view.addSubview(optview)
        }
    }
    @objc func delBudAction(_ : UIButton!) {
        canTap = false
        var rmBtnY: CGFloat = 14.0
        print(idCount)
        if idCount > 0{
            for i in 1...idCount{
                
                let rmBtn = UIButton(frame: CGRect(x: 10, y: rmBtnY, width: self.view.bounds.width - 20, height: 73.81818181818181))
                rmBtn.addTarget(self, action: #selector(self.rmBrnAction), for: .touchUpInside)
                rmBtn.setTitle("Remove", for: .normal)
                rmBtn.setTitleColor(UIColor.black, for: .normal)
                rmBtn.backgroundColor = UIColor.red.withAlphaComponent(0.65)
                rmBtn.layer.borderWidth = 1.25
                rmBtn.layer.borderColor = UIColor.red.cgColor
                rmBtn.titleLabel?.font =  .systemFont(ofSize: 30)
                rmBtn.tag = i
                
                rmBtnY = rmBtnY + rmBtn.bounds.height + CGFloat(14)
                
                scrollView.addSubview(rmBtn)
            }
        }
        
        doneButn = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - (self.view.bounds.width / 4.5) / 2, y: self.view.bounds.height - self.view.bounds.height/20 - self.view.bounds.width / 18, width: self.view.bounds.width / 4.5, height: self.view.bounds.width / 9))
        doneButn.backgroundColor = UIColor(red: 232/225, green: 232/225, blue: 232/225, alpha: 1)
        doneButn.addTarget(self, action: #selector(self.rmBrnAction), for: .touchUpInside)
        doneButn.clipsToBounds = true
        doneButn.setTitle("Done", for: .normal)
        doneButn.setTitleColor(UIColor(red: 63/225, green: 81/225, blue: 181/225, alpha: 1), for: .normal)
        doneButn.layer.borderWidth = 1.25
        doneButn.layer.borderColor = UIColor.lightGray.cgColor
        doneButn.tag = 1000
        
        self.view.addSubview(doneButn)
        
        optview?.removeFromSuperview()
    }
    @objc func restoreAction(_ : UIButton!){
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    @objc func startNewAction(_ : UIButton!) {
        startNew()
        canTap = true
    }
    
    @objc func pColBtnAction(_ : UIButton!) {
        if didBuy1 == true{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "sky.png") ?? UIColor.red as! UIImage)
            bgInt.set(1, forKey: "bg")
            dateLbl.textColor = UIColor.black
        }
        else{
            iapViewFunc()
        }
    }
    @objc func rColBtnAction(_ : UIButton!) {
        if didBuy1{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "person.png") ?? UIColor.red as! UIImage)
            bgInt.set(2, forKey: "bg")
            dateLbl.textColor = UIColor.black
        }else{
            iapViewFunc()
        }
        
    }
    @objc func sColBtnAction(_ : UIButton!) {
        if didBuy1{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "lips.png") ?? UIColor.red as! UIImage)
            bgInt.set(3, forKey: "bg")
            dateLbl.textColor = UIColor.black
        }else{
            iapViewFunc()
        }
    }
    @objc func bColBtnAction(_ : UIButton!) {
        if didBuy1{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "brick.png") ?? UIColor.red as! UIImage)
            dateLbl.textColor = UIColor.black
            bgInt.set(4, forKey: "bg")
        }else{
            iapViewFunc()
        }
    }
    //r2
    @objc func mColBtnAction(_ : UIButton!) {
        if didBuy1{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "ba.png") ?? UIColor.red as! UIImage)
            dateLbl.textColor = UIColor.white
            bgInt.set(5, forKey: "bg")
        }else{
            iapViewFunc()
        }
    }
    @objc func piColBtnAction(_ : UIButton!) {
        if didBuy1{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "birds.png") ?? UIColor.red as! UIImage)
            dateLbl.textColor = UIColor.black
            bgInt.set(6, forKey: "bg")
        }else{
            iapViewFunc()
        }
    }
    @objc func sbColBtnAction(_ : UIButton!) {
        
        if didBuy1{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "black-2.png") ?? UIColor.red as! UIImage)
            dateLbl.textColor = UIColor.white
            bgInt.set(7, forKey: "bg")
        }else{
            iapViewFunc()
        }
    }
    @objc func wColBtnAction(_ : UIButton!) {
        if didBuy1{
            background.backgroundColor = UIColor(patternImage: UIImage(named: "background.png") ?? UIColor.red as! UIImage)
            dateLbl.textColor = UIColor.black
            bgInt.set(8, forKey: "bg")
        }else{
            iapViewFunc()
        }
    }
    @objc func doneAction(_ : UIButton!) {
        optview.removeFromSuperview()
        canTap = true
    }
    
    @objc func rmBrnAction(sender : UIButton!){
        
        canTap = true
        var inc = 0
        idCount = 0
        print("id")
        print(idSave.integer(forKey: "count"))
        let loopNum = idSave.integer(forKey: "count")
        if loopNum > 0 {
            for i in 1...loopNum {
                
                if sender.tag == i{
                    inc = 1
                    print("tag")
                }
                idCount = i
                print(i)
                let newBudgetAmt = budgetAmtdefaults.float(forKey: "\(1000 + i + inc)")
                let newBudgetName = budgetNamesdefaults.string(forKey: "\(i + inc)")
                let newBudgetAvl = budgetAvalibledefaults.float(forKey: "\(2000 + i + inc)")
                
                budgetAvalibledefaults.set(Float(newBudgetAvl), forKey: "\(2000 + idCount!)")
                budgetAmtdefaults.set(Float(newBudgetAmt), forKey: "\(1000 + idCount!)")
                budgetNamesdefaults.set(String(newBudgetName ?? ""), forKey: "\( idCount!)")
                print(idCount)
                idSave.set(idCount - inc, forKey: "count")
                
                for views in scrollView?.subviews as! [UIView]{
                    views.removeFromSuperview()
                }
                
            }
            blockYpos = 14
            continueBudgets()
        }
        doneButn.removeFromSuperview()
    }
}

