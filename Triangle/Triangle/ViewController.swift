//
//  ViewController.swift
//  Triangle
//
//  Created by yun on 2022/03/19.
//

import UIKit

class UseOnlyBezierPathView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width / 2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        UIColor.yellow.setFill()
        path.close()
        path.fill()
        path.stroke()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class UseCALayerView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width / 2, y: self.frame.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.systemPink.cgColor
        self.layer.addSublayer(shapeLayer)
    }
}

class ViewController: UIViewController {
    lazy var view1 = UseOnlyBezierPathView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 2))
    
    lazy var view2 = UseCALayerView(frame: CGRect(x: 0, y: self.view.frame.height / 2, width: self.view.frame.width, height: self.view.frame.height / 2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [view1, view2].forEach { self.view.addSubview($0) }
    }

    

}

