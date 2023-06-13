//
//  ViewController.swift
//  Animation
//
//  Created by Матвей Авдеев on 13.06.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var presetNameLabel: SpringLabel!
    @IBOutlet var curveNameLabel: SpringLabel!
    @IBOutlet var forceValueLabel: SpringLabel!
    @IBOutlet var duratationValueLabel: SpringLabel!
    @IBOutlet var delayValueLabel: SpringLabel!
    
    @IBOutlet var springView: SpringView!
    
    let setAnimation = Animation.setAnimation()
    
    private var indexCount = 0
    
    private var randomForce = CGFloat.random(in: 0.3...3)
    private var randomDuration = CGFloat.random(in: 0.5...2)
    private var randomDelay = CGFloat.random(in: 0.2...1)
    
    @IBAction func springButton(_ sender: SpringButton) {
     
        if indexCount != setAnimation.percents.count - 1 {
            indexCount += 1
            springView.animation = setAnimation.percents[indexCount]
            springView.curve = setAnimation.curves[indexCount]
            springView.force = randomForce
            springView.duration = randomDuration
            springView.delay = randomDelay
            springView.animate()
            
            presetNameLabel.text = "Preset: \(springView.animation)"
            curveNameLabel.text = "Curve: \(springView.curve)"
            
            forceValueLabel.text = "Force: \(formattedValue(springView.force))"
            duratationValueLabel.text = "Duration: \(formattedValue(springView.duration))"
            delayValueLabel.text = "Delay: \(formattedValue(springView.delay))"
            
            randomDuration = CGFloat.random(in: 0.5...2)
            randomForce = CGFloat.random(in: 0.3...3)
            randomDelay = CGFloat.random(in: 0.2...1)

        } else {
            indexCount = 0
        }
        if indexCount != setAnimation.percents.count - 1 {
            sender.setTitle("Run \(setAnimation.percents[indexCount + 1])", for: .normal)
        }
        
        animationLabel(presetNameLabel)
        animationLabel(curveNameLabel)
        animationLabel(forceValueLabel)
        animationLabel(delayValueLabel)
        animationLabel(duratationValueLabel)
        
    }
    
    private func formattedValue(_ value: CGFloat) -> String {
        String(format: "%.2f", value)
    }
    
    private func animationLabel(_ label: SpringLabel) {
        label.animation = "fadeIn"
        label.curve = "easeIn"
        label.force = randomForce
        label.duration = randomDuration
        label.delay = randomDelay
        label.animate()
    }
    
}

