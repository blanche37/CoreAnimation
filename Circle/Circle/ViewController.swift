//
//  ViewController.swift
//  Circle
//
//  Created by yun on 2022/03/19.
//

import UIKit

class CircleView: UIView {
//    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath(ovalIn: rect)
//        let path2 = UIBezierPath(ovalIn: CGRect(x: 60, y: 30, width: 10, height: 10))
//        let layer = CAShapeLayer()
//        let layer2 = CAShapeLayer()
//
//        layer.path = path.cgPath
//        layer2.path = path2.cgPath
//        layer.fillColor = UIColor.yellow.cgColor
//        layer2.fillColor = UIColor.black.cgColor
//
//        self.layer.addSublayer(layer)
//        self.layer.addSublayer(layer2)
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.fromValue = [100, 100]
//        animation.toValue = [350, 100]
//        animation.duration = 5
//        animation.repeatCount = .infinity
//        self.layer.add(animation, forKey: nil)
//    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: center, radius: center.x, startAngle: 0, endAngle: (135 * .pi) / 180, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.backgroundColor = UIColor.blue.cgColor
        
        layer.path = path.cgPath
        self.layer.frame = bounds

        self.layer.addSublayer(layer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.layer.frame = frame
//        self.layer.backgroundColor = UIColor.blue.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    lazy var circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(circleView)
//        circleView.backgroundColor = .clear
//        circleView.layer.backgroundColor = UIColor.blue.cgColor
        circleView.layer.cornerRadius = 20
        self.view.layer.backgroundColor = UIColor.blue.cgColor
    }
    
    
}

//애니메이션에 key가 있는 이유는 어떤 이벤트가 발생했을떄, key를이용해서 애니메이션을 중지시킬 수 있다.
