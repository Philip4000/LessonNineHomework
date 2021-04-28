//
//  ViewController.swift
//  LessonNineHomework
//
//  Created by Philip Noskov on 27.04.2021.
//

import Spring

class ViewController: UIViewController {
  
    @IBOutlet weak var animationView: SpringView!
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var runButton: SpringButton!
    
    private var animation = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.layer.cornerRadius = 10
        runButton.layer.cornerRadius = 10
        runButton.setTitle("Run", for: .normal)
        
        setupLabels(from: animation)
    }

    @IBAction func runButtonPressed(_ sender: SpringButton) {
        setupAnimation(for: animationView)
        
        getNextAnimation()
        
        sender.animation = "pop"
        sender.force = 0.2
        sender.animate()
        }
}

extension ViewController {
    private func setupLabels(from animation: Animation) {
        presetLabel.text = animation.preset
        curveLabel.text = animation.curve
        forceLabel.text = String(format: "%.2f", animation.force)
        durationLabel.text = String(format: "%.2f", animation.duration)
        delayLabel.text = String(format: "%.2f", animation.delay)
    }
    
    private func setupAnimation(for view: SpringView) {
        view.animation = animation.preset
        view.curve = animation.curve
        view.force = CGFloat(animation.force)
        view.duration = CGFloat(animation.duration)
        view.delay = CGFloat(animation.delay)
        view.animate()
    }
    
    private func getNextAnimation() {
        setupLabels(from: animation)
        animation = Animation.getAnimation()
        runButton.setTitle("Next \(animation.preset)", for: .normal)
    }
}
