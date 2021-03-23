//
//  ViewController.swift
//  TrafficLight
//
//  Created by Mac on 23.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var changeColorBtn: UIButton!

    private var currentColor: TrafficColor = .red
    private var isFirstRun = true

    override func viewDidLoad() {
        super.viewDidLoad()
        redLight.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        yellowLight.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        greenLight.backgroundColor = UIColor.green.withAlphaComponent(0.3)

        changeColorBtn.layer.cornerRadius = 10
        redLight.layer.cornerRadius = 100
        yellowLight.layer.cornerRadius = 100
        greenLight.layer.cornerRadius = 100
    }

    @IBAction func changeColor() {
        // Change button name
        if isFirstRun {
            changeColorBtn.setTitle("Next", for: .normal)
            redLight.backgroundColor = UIColor.red.withAlphaComponent(1.0)
            isFirstRun = false
        } else {
            switch currentColor {
            case .red:
                changeAlpha(for: redLight, alpha: 0.3)
                changeAlpha(for: yellowLight, alpha: 1.0)
                currentColor = .yellow
            case .yellow:
                changeAlpha(for: yellowLight, alpha: 0.3)
                changeAlpha(for: greenLight, alpha: 1.0)
                currentColor = .green
            case .green:
                changeAlpha(for: greenLight, alpha: 0.3)
                changeAlpha(for: redLight, alpha: 1.0)
                currentColor = .red
            }
        }
    }

    func changeAlpha(for lamp: UIView, alpha: CGFloat) {
        lamp.backgroundColor = lamp.backgroundColor?.withAlphaComponent(alpha)
    }
}
