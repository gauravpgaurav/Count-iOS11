//
//  ViewController.swift
//  Count
//
//  Created by Gaurav Pant on 6/22/18.
//  Copyright © 2018 Gaurav Pant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number1: Float = 0
    var number2: Float = 0
    var result: Float = 0
    var operation: Int = 0
    var isNextNumber: Bool = false
    var isAfterDecimal: Bool = false
    var isFirstEntry: Bool = true
    
    @IBOutlet weak var textOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textOutput.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        number1 = 0
        number2 = 0
        operation = 0
        isNextNumber = false
        isAfterDecimal = false
        textOutput.text = "0"
    }
    
    //Operations
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if(isNextNumber) {
            calculateResult()
        }
        isNextNumber = true
        isAfterDecimal = false
        operation = 5
    }
    
    @IBAction func subButtonPressed(_ sender: Any) {
        if(isNextNumber) {
            calculateResult()
        }
        isNextNumber = true
        isAfterDecimal = false
        operation = 4
    }
    
    @IBAction func mulButtonPressed(_ sender: Any) {
        if(isNextNumber) {
            calculateResult()
        }
        isNextNumber = true
        isAfterDecimal = false
        operation = 3
    }
    
    @IBAction func divButtonPressed(_ sender: Any) {
        if(isNextNumber) {
            calculateResult()
        }
        isNextNumber = true
        isAfterDecimal = false
        operation = 2
    }
    
    @IBAction func percentageButtonPressed(_ sender: Any) {
        if(isNextNumber) {
            calculateResult()
        }
        isAfterDecimal = false
        operation = 1
        calculateResult()
    }
    
    //Numbers - Inputs
    @IBAction func zeroPressed(_ sender: Any) {
        takeInput(digit: "0")
    }
    
    @IBAction func onePressed(_ sender: Any) {
        takeInput(digit: "1")
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        takeInput(digit: "2")
    }
    
    @IBAction func threePressed(_ sender: Any) {
        takeInput(digit: "3")
    }
    @IBAction func fourPressed(_ sender: Any) {
        takeInput(digit: "4")
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        takeInput(digit: "5")
    }
    
    @IBAction func sixPressed(_ sender: Any) {
        takeInput(digit: "6")
    }
    
    @IBAction func sevenPressed(_ sender: Any) {
        takeInput(digit: "7")
    }
    
    @IBAction func eightPressed(_ sender: Any) {
        takeInput(digit: "8")
    }
    
    @IBAction func ninePressed(_ sender: Any) {
        takeInput(digit: "9")
    }
    
    @IBAction func decimalButtonPressed(_ sender: Any) {
        if(isFirstEntry) {
            
        }
        if(!isAfterDecimal){
            isAfterDecimal = true
            if(!isNextNumber){
                var stringNumber1 = String(number1)
                stringNumber1 = stringNumber1 + ".0"
                number1 = Float(stringNumber1)!
            } else {
                var stringNumber2 = String(number2)
                stringNumber2 = stringNumber2 + "."
                number2 = Float(stringNumber2)!
            }
        }
    }
    
    @IBAction func signChangeButtonPressed(_ sender: Any) {
    }

    
    //Results
    
    @IBAction func getResultButtonPressed(_ sender: Any) {
        calculateResult()
        isNextNumber = false
        isAfterDecimal = false
        isFirstEntry = true
    }
    
    func takeInput(digit: String) {
        let floatDigit = Float(digit)
        if(isFirstEntry) {
            // TODO
        }
        if(!isNextNumber) {
            //Number 1
            if(!isAfterDecimal) {
                //Before
                number1 = (number1 * 10) + floatDigit!
            } else {
                //After
                var stringNumber1 = String(number1)
                stringNumber1 = stringNumber1 + digit
                number1 = Float(stringNumber1)!
            }
            textOutput.text = String(number1)
        } else {
            //Number 2
            if(!isAfterDecimal) {
                //Before
                number2 = (number2 * 10) + floatDigit!
            } else {
                //After
                var stringNumber2 = String(number2)
                stringNumber2 = stringNumber2 + digit
                number2 = Float(stringNumber2)!
            }
            textOutput.text = String(number2)
        }
    }
    func calculateResult(){
        switch(operation) {
            case 1: result = number1 / 100
                break;
            case 2: result = number1 / number2
                break;
            case 3: result = number1 * number2
                break;
            case 4: result = number1 - number2
                break;
            case 5: result = number1 + number2
                break;
            default:
                if(!isNextNumber) {
                    result = number1
                }
                isNextNumber = false
                break;
            }
        textOutput.text = String(result)
        number1 = result
        number2 = 0
    }
}

