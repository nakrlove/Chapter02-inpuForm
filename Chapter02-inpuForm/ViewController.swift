//
//  ViewController.swift
//  Chapter02-inpuForm
//
//  Created by nakrlove on 2022/12/07.
//

import UIKit

class ViewController: UIViewController {

    
    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fonts = UIFont.fontNames(forFamilyName:"Noto Nastaliq Urdu")
//        let fonts = UIFont.familyNames
        
        for f in fonts {
            print("\(f)")
        }
        
        
        self.view.center = CGPoint(x: (self.view.frame.width / 2)-160, y: ((self.view.frame.height / 2)-150))
//        self.view.addSubview(self)
        self.navigationItem.title = "설정"
        viewEmailLabel()
        viewAutoReplaceLabel()
        viewAutoReplaceRecycleLabel()
       
        
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        
        self.navigationItem.rightBarButtonItem = submitBtn
        // Do any additional setup after loading the view.
    }

    func viewEmailLabel() {
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblEmail)
        
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.adjustsFontSizeToFitWidth = true
        self.paramEmail.autocapitalizationType = .none
        self.paramEmail.textAlignment = NSTextAlignment.left
        self.paramEmail.placeholder = "이메일 예)sqlpro@naver.com"
        self.view.addSubview(self.paramEmail)
    }
    
    func viewAutoReplaceLabel() {
        
        let autoreplace = UILabel()
        autoreplace.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        autoreplace.text = "자동갱신"
        autoreplace.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(autoreplace)
        
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValeu(_:)), for: .valueChanged)
        self.view.addSubview(paramUpdate)
        
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.text = "갱신함"
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.view.addSubview(self.txtUpdate)
    }
    
    func viewAutoReplaceRecycleLabel() {
        
        let autoreplacerecycle = UILabel()
        autoreplacerecycle.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        autoreplacerecycle.text = "갱신주기"
        autoreplacerecycle.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(autoreplacerecycle)
        
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.paramInterval.addTarget(self, action: #selector(presendtIntervalValue(_:)), for: .valueChanged)
        self.view.addSubview(self.paramInterval)
        
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.text = "0분마다"
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.view.addSubview(self.txtInterval)
    }
    
    @objc func presentUpdateValeu(_ sender: UISwitch){
        if sender.isOn == true {
            self.txtUpdate.text = "갱신함"
        }else {
            self.txtUpdate.text = "비갱신함"
        }
    }
    
    @objc func presendtIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = "\(Int(sender.value))분마다"
    }
    
    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

