//
//  ReadViewController.swift
//  Chapter02-inpuForm
//
//  Created by nakrlove on 2022/12/07.
//

import UIKit

class ReadViewController: UIViewController {

    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let email = UILabel()
        let update = UILabel()
        let interval = UILabel()
       
        
        email.frame = CGRect(x: 50, y: 100, width: 220, height: 30)
        update.frame = CGRect(x: 50, y: 150, width: 220, height: 30)
        interval.frame = CGRect(x: 50, y: 200, width: 220, height: 30)
        
        email.text = "전달받은 이메일 : \(self.pEmail!)"
        update.text = "업데이터 여부 : \(self.pUpdate == true ? "업데이터 함" :"업데이트 안 함")"
        interval.text = "업데이터 주기 : \(Int(self.pInterval!)) 분마다"
        
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)
        // Do any additional setup after loading the view.
    }
    

   

}
