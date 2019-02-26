//
//  ViewController.swift
//  calculator
//
//  Created by Masaki on 2019/02/20.
//  Copyright © 2019年 Masaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var firstInput:Double = 0
    private var secondInput:Double = 0
    private var total = 0
    private var isSecond = false
    
    private var isPlus = false
    private var isMinus = false
    private var isMultiply = false
    private var isDivided = false
    
    private var inputNumber: Double = 0
    private var subTotalNumber: Double = 0
    
    @IBOutlet weak var formulaLabel: UILabel!
    
    @IBAction func tapPlus(_ sender: UIButton) {
        subTotalNumber = subTotalNumber + inputNumber
        inputNumber = 0
        
        isSecond = true
        isPlus = true
        isMinus = false
        isMultiply = false
        isDivided = false
    }
    @IBAction func tapMinus(_ sender: UIButton) {
        subTotalNumber = subTotalNumber + inputNumber
        inputNumber = 0
        
        isSecond = true
        isMinus = true
        isPlus = false
        isMultiply = false
        isDivided = false
    }
    @IBAction func tapMultiply(_ sender: UIButton) {
        subTotalNumber = subTotalNumber + inputNumber
        inputNumber = 0
        
        isSecond = true
        isMultiply = true
        isPlus = false
        isMinus = false
        isDivided = false
    }
    @IBAction func tapDivided(_ sender: UIButton) {
        subTotalNumber = subTotalNumber + inputNumber
        inputNumber = 0
        
        isSecond = true
        isDivided = true
        isPlus = false
        isMinus = false
        isMultiply = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ビューがロードされた時点で式と答えのラベルは空にする
        formulaLabel.text = "0"
    }
    
    @IBAction func inputFormula(_ sender: UIButton) {
        // ボタン（Cと=以外）が押されたら式を表示する
//        guard let formulaText = formulaLabel.text else {
//            return
//        }
        guard let senderedText = sender.titleLabel?.text else {
            return
        }
        
//        if isSecond == true {
//            if (secondInput != 0) {
//                formulaLabel.text =  String(Int((secondInput * 10) + Double(senderedText)!))
//            }else {
//                formulaLabel.text = String(senderedText)
//            }
//            secondInput = Double(formulaLabel.text!) ?? 0
//
//        } else {
//
//            if (firstInput != 0) {
//                formulaLabel.text =  String(Int((firstInput * 10) + Double(senderedText)!))
//            }else {
//                formulaLabel.text = String(senderedText)
//            }
//            firstInput = Double(formulaLabel.text!) ?? 0
//        }
        
        
        if (inputNumber != 0) {
            formulaLabel.text =  String(Int((inputNumber * 10) + Double(senderedText)!))
        }else {
            formulaLabel.text = String(senderedText)
        }
        inputNumber = Double(formulaLabel.text!) ?? 0
    }
    
    @IBAction func calculateAnswer(_ sender: UIButton) {
        if (isPlus == true) {
            calculatePlus()
        } else if(isMinus == true) {
            calculateMinus()
        } else if(isMultiply == true){
            calculateMultiply()
        } else if(isDivided == true){
            calculateDivided()
        }
    }
    
    private func calculatePlus() {
        subTotalNumber = subTotalNumber + inputNumber
        formulaLabel.text = String(subTotalNumber).replacingOccurrences(of: "\\.0$",with: "",
            options: NSString.CompareOptions.regularExpression)
        inputNumber = 0
    }
    
    private func calculateMinus() {
        subTotalNumber = subTotalNumber - inputNumber
        formulaLabel.text = String(subTotalNumber).replacingOccurrences(of: "\\.0$",with: "",
            options: NSString.CompareOptions.regularExpression)
        inputNumber = 0
    }
    
    private func calculateMultiply() {
        subTotalNumber = subTotalNumber * inputNumber
        formulaLabel.text = String(subTotalNumber).replacingOccurrences(of: "\\.0$",with: "",
            options: NSString.CompareOptions.regularExpression)
        inputNumber = 0
    }
    
    private func calculateDivided() {
        subTotalNumber = subTotalNumber / inputNumber
        formulaLabel.text = String(subTotalNumber).replacingOccurrences(of: "\\.0$",with: "",
            options: NSString.CompareOptions.regularExpression)
        inputNumber = 0
    }
    
    @IBAction func clearCalculation(_ sender: UIButton) {
        subTotalNumber = 0
        inputNumber = 0
        formulaLabel.text = "0"
//        firstInput = 0
//        secondInput = 0
        isSecond = false
        return
    }
}

