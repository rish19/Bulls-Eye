//
//  ViewController.swift
//  Second
//
//  Created by Rishabh Bhandari on 29/05/19.
//  Copyright © 2019 Rishabh Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var roundNumber: Int = 0
    var score:Int = 0
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var randomLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        addNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let rightTrackImage = #imageLiteral(resourceName: "SmallButton")
        
        let insets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        
        let leftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        let rightResizable = rightTrackImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(leftResizable, for: .normal)
        slider.setMaximumTrackImage(rightResizable, for: .normal)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert(){
        let title: String
        
        
        let difference = abs(currentValue - targetValue)
        
        switch difference {
        case 0:
            title = "Bulls Eye!"
        
        case 1...3:
            title = "Very close"
        case 4...8:
            title = " Not so far "
        case 8...100:
            title = "You're far away!! "
        default:
            title = "Good attempt"
        }
        

        
        var points = 100 - (difference*10)
        if difference == 0 {
            points += 100
        } else if difference == 1 {
            points += 50
        }
        score = score + points
        
        
        
        
        let message:String = "Congrats!! You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok!", style: .default, handler: {
            action in
            self.addNewRound()
        })
        
        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
        
        //addNewRound()

    }
    @IBAction func sliderMoved(_ slider:UISlider) {
        
        let roundedValue = slider.value.rounded()
        
        currentValue = Int(roundedValue)
    
    }
    
    func addNewRound() {
        
        targetValue = Int.random(in: 1...100)
        print(targetValue)
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        
        UpdateLabels()
    }
    
    func UpdateLabels() {
        randomLabel.text = "\(targetValue)"
        roundLabel.text = String(roundNumber)
        scoreLabel.text = String(score)
    }
    
    @IBAction func StartOver() {
        
        score = 0
        roundNumber = 0
        UpdateLabels()
        addNewRound()
        
    }
        
        
        
    }
    
    
    




