//
//  ViewController.swift
//  implicitAnimation
//
//  Created by yun on 2022/03/19.
//

import UIKit

class ViewController: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(toggleAnimation), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitle("Animate", for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    @objc func toggleAnimation() {
        if view.layer.sublayers?.first?.animation(forKey: "Animation") != nil {
            self.view.layer.sublayers?.first?.removeAnimation(forKey: "Animation")
        } else {
            makeAnimation()
        }
    }
    
    private func configureLayout() {
        view.addSubview(button)
        
        let safeArea = view.safeAreaLayoutGuide
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func makeAnimation() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.toValue = 1
        animation.fromValue = 0
        animation.duration = 1
        animation.repeatCount = .infinity
        self.view.layer.sublayers?.first?.add(animation, forKey: "Animation")
        // 애니메이션에 키를 설정해주지 않으면 removeAllAnimation()메소드로만 애니메이션을 제거 할 수 있다.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CALayer()
        layer.backgroundColor = UIColor.yellow.cgColor
        layer.frame = view.bounds
        self.view.layer.addSublayer(layer)
        configureLayout()
        // 가장 위에 있는 레이어 위에 UI요소들을 올려줘야지 유저 이벤트를 받을 수가 있다.
    }
}

