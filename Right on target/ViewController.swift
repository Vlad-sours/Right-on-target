//
//  ViewController.swift
//  Right on target
//
//  Created by Vlad on 1.5.23..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number = 0
    var round = 0
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func checkNumber(){
        if round == 0 {
            number = Int.random(in: 1...50)
            label.text = String(number)
            round = 1
        }else {
            let numSlider = Int(slider.value.rounded())
            label.text = String(number)
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
                
            } else {
                points += 50
            }
            if round == 10 {
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            }else {
                self.round += 1
            }
            number = Int.random(in: 1...50)
            
        }
        
    }
}
