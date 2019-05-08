//
//  GradientHub.swift
//  CircularLoaderLBTA
//
//  Created by Mouhammed Ali on 5/5/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import Foundation
import UIKit
public class GradientHUD:UIView {
    var timer = Timer()
    open var dimBackground = true
    var spinnerView = SpinnerView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var gradientView = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 140 ))
    private let gradient = CAGradientLayer()
    private var gradientSet = [[CGColor]]()
    private var currentGradient: Int = 0
    open var startPoint = CGPoint(x:0, y:0)
    open var endPoint = CGPoint(x:1, y:1)
    open var gradientArr = [CGColor]()
    private let kCONTENT_XIB_NAME = "GradientHUD"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        addNotificationObservers()
    }
    
    deinit {
        removeNotificationObservers()
        timer.invalidate()
    }
    
    override public func layoutSubviews() {
        gradientView.layer.sublayers = nil
        setupView()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func commonInit() {
        addSubViewToCenter(view:gradientView, size:140)
        addSubViewToCenter(view:spinnerView, size:80)
    }
    private func setupView(){
        gradientView.layer.sublayers = nil
        if gradientArr.count == 0 {
            gradientArr = [UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor,
                           UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor,
                           UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor]
        }
        for i in 1...gradientArr.count{
            if gradientArr.count == i {
                gradientSet.append([gradientArr[i-1], gradientArr[0]])
            }else{
                print(i)
                gradientSet.append([gradientArr[i-1], gradientArr[i]])
                
            }
        }
        
        gradient.frame = gradientView.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        gradientView.layer.addSublayer(gradient)
        gradientView.layer.cornerRadius = 30
        gradientView.layer.masksToBounds = true
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
        animateGradient()
        if !dimBackground {
            self.backgroundColor = .clear
        }else{
            self.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 0.6588987586)
        }
        
    }
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
         gradientChangeAnimation.delegate = self
        gradientChangeAnimation.duration = 1.5
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = kCAFillModeForwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }
    @objc func updateCounting(){
        gradient.colors = gradientSet[currentGradient]
        animateGradient()
    }
    func removeNotificationObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func addNotificationObservers() {
        let center = NotificationCenter.default
        let enterForeground = NSNotification.Name.UIApplicationWillEnterForeground
        center.addObserver(self, selector: #selector(didBecomeActive), name: enterForeground, object: nil)
    }
    
    @objc func didBecomeActive() {
        gradientView.layer.sublayers = nil
        setupView()
    }
    
    func addSubViewToCenter(view:UIView, size:CGFloat){
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.widthAnchor.constraint(equalToConstant: size).isActive = true
        view.heightAnchor.constraint(equalToConstant: size).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    
    open func show(on view:UIViewController){
        self.frame = view.view.frame
        self.fixInView(view.view)
        setupView()
        view.view.addSubview(self)
    }
    open func hide(){
        self.removeFromSuperview()
    }
    
}

extension GradientHUD: CAAnimationDelegate {
    
    private func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
