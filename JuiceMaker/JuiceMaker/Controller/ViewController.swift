//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    var currentQuantity: [Fruit : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStockList()
    }
    
    @IBAction func showPush() {
        moveToStockVc()
    }
    
    @IBOutlet var fruitsLabel: [UILabel]!
    
    func getStockList() {
        self.currentQuantity = juiceMaker.passCurrentList()
        for (fruit, _) in currentQuantity {
            guard let fruitLabelText = currentQuantity[fruit] else {
                return
            }
            fruitsLabel[fruit.rawValue].text = String(fruitLabelText)
        }
    }
    
    @IBAction func makeOrder(_ sender: UIButton) {
        guard let menu = Juice(rawValue: sender.tag) else {
            return
        }
        
        print(Juice(rawValue: sender.tag)!)
        
        let orderResult = juiceMaker.getOrder(menu)
        
        if orderResult.success {
            getStockList()
        }
        
        successAlert(orderResult.message, orderResult.success)
    }
    
    func successAlert(_ message: String, _ isSuccess: Bool) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        let changeAction = UIAlertAction(title: "이동", style: .default, handler: { action in
            self.moveToStockVc()
        })
        
        if isSuccess {
            alert.addAction(okAction)
        } else {
            let cancleAction = UIAlertAction(title: "취소", style: .default)
            alert.addAction(cancleAction)
            alert.addAction(changeAction)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func moveToStockVc() {
        let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as! StockViewController
        self.navigationController?.pushViewController(stockVC, animated: true)
    }
}

