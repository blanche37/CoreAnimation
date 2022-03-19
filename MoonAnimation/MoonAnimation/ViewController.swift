//
//  ViewController.swift
//  MoonAnimation
//
//  Created by yun on 2022/03/18.
//

import UIKit
class ViewController: UIViewController {
    
    lazy var moonView = SomeView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(moonView)
        self.view.layer.backgroundColor = UIColor.black.cgColor
    }
    
}


class SomeView: UIView {
    override func draw(_ rect: CGRect) {
        let moonLayer = CALayer()
        moonLayer.frame = bounds
        moonLayer.contents = UIImage(named: "moon")?.cgImage
        self.layer.addSublayer(moonLayer)
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.repeatCount = .infinity
        animation.duration = 1
        moonLayer.add(animation, forKey: "shapeanimation")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
