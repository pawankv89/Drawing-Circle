//
//  StatusViewCotroller.swift
//  Drawing Circle
//
//  Created by Pawan kumar on 31/08/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//


import UIKit
import Foundation

//https://www.appcoda.com/bezier-paths-introduction/

class StatusViewCotroller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Add Drawig View
        let width: CGFloat = 320.0
        let height: CGFloat = 320.0
        let demoView = DrawingStatusView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                                 y: self.view.frame.size.height/2 - height/2,
                                                 width: width,
                                                 height: height))
        
        demoView.layer.cornerRadius = 15.0
        demoView.layer.masksToBounds = true
        self.view.addSubview(demoView)
    }
}

class DrawingStatusView: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        self.createARCRuntime()
        
        /*
        let path = UIBezierPath()
        let innerRadius: CGFloat = 50
        let outerRadius: CGFloat = 60
        let numTicks = 24
        
        for i in 0..<numTicks {
            let angle = CGFloat(i) * CGFloat(2*M_PI) / CGFloat(numTicks)
            let inner = CGPoint(x: innerRadius * cos(angle), y: innerRadius * sin(angle))
            let outer = CGPoint(x: outerRadius * cos(angle), y: outerRadius * sin(angle))
            path.move(to: inner)
            path.addLine(to: outer)
            UIColor.red.setStroke()
            print("RED")
            path.stroke()
        }*/
    }

    func deg2rad(_ degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }
    
    func createARCRuntime()  {
        
        /*
        let numberOfImages: CGFloat = 8.0
        let startAngle: CGFloat  = 0.0
    
        // For 0 - 45
        //let radians = deg2rad(360 / numberOfImages)
        let radians = deg2rad(45)
        print("radians :- \(radians) count:- \(numberOfImages) ")
        
        let arcCenter = CGPoint.init(x: 150, y: 150)
        let radius: CGFloat = 75.0
        
        let endAngle = radians
        let clockwise = true
        let path1 =  UIBezierPath.init(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        //path1.close()
 
        
        //Line Width
        path1.lineWidth = 5.0
        
        // Specify a border (stroke) color.
        UIColor.red.setStroke()
        print("RED")
        path1.stroke()
        */
        
        /*
        // For 45 - 90
        let startAngle_1 = deg2rad(0)
        let endAngle_1 = deg2rad(90)
        let arcCenter_1 = CGPoint.init(x: 150, y: 150)
        let radius_1: CGFloat = 75.0
        
        let clockwise_1 = true
        let path_1 =  UIBezierPath.init(arcCenter: arcCenter_1, radius: radius_1, startAngle: startAngle_1, endAngle: endAngle_1, clockwise: clockwise_1)
    
        self.circle(path: path_1, color: UIColor.green)
        
        print("START:-\(startAngle_1) END:-\(endAngle_1)")
        
        // For 45 - 90
        let startAngle_2 = endAngle_1
        let endAngle_2 = deg2rad(180)
        let arcCenter_2 = CGPoint.init(x: 150, y: 150)
        let radius_2: CGFloat = 75.0
        
        let clockwise_2 = true
        let path_2 =  UIBezierPath.init(arcCenter: arcCenter_2, radius: radius_2, startAngle: startAngle_2, endAngle: endAngle_2, clockwise: clockwise_2)
        
        self.circle(path: path_2, color: UIColor.red)
        
        print("START:-\(startAngle_2) END:-\(endAngle_2)")
        
        
        // For 45 - 90
        let startAngle_3 = endAngle_2
        let endAngle_3 = deg2rad(270)
        let arcCenter_3 = CGPoint.init(x: 150, y: 150)
        let radius_3: CGFloat = 75.0
        
        let clockwise_3 = true
        let path_3 =  UIBezierPath.init(arcCenter: arcCenter_3, radius: radius_3, startAngle: startAngle_3, endAngle: endAngle_3, clockwise: clockwise_3)
        
        self.circle(path: path_3, color: UIColor.yellow)
        
        print("START:-\(startAngle_3) END:-\(endAngle_3)")
        
        // For 45 - 90
        let startAngle_4 = endAngle_3
        let endAngle_4 = deg2rad(360)
        let arcCenter_4 = CGPoint.init(x: 150, y: 150)
        let radius_4: CGFloat = 75.0
        
        let clockwise_4 = true
        let path_4 =  UIBezierPath.init(arcCenter: arcCenter_4, radius: radius_4, startAngle: startAngle_4, endAngle: endAngle_4, clockwise: clockwise_4)
        
        self.circle(path: path_4, color: UIColor.blue)
        
        print("START:-\(startAngle_4) END:-\(endAngle_4)")
        */
        
        var numberOfImages: CGFloat = 5.0
        // For 0 - 90
        var startAngle_1 = deg2rad(0)
        var endAngle_1 = deg2rad(360 / numberOfImages)
        let everyAngle_1 = endAngle_1
        let clockwise_1 = true
        let radius_1: CGFloat = 75.0
        let arcCenter_1 = CGPoint.init(x: 150, y: 150)
        
        while ( numberOfImages > 0) {
            
            let path_1 =  UIBezierPath.init(arcCenter: arcCenter_1, radius: radius_1, startAngle: startAngle_1, endAngle: endAngle_1, clockwise: clockwise_1)
            
            self.circle(path: path_1, color: UIColor.random)
            
            print("START:-\(startAngle_1) END:-\(endAngle_1)")
            
            numberOfImages = numberOfImages - 1
            startAngle_1 = endAngle_1
            endAngle_1 = endAngle_1 + everyAngle_1
        }
    }
    
    func circle(path: UIBezierPath, color: UIColor) {
        
        //path.close()
        
        //Line Width
        path.lineWidth = 10.0
        
        // Specify a border (stroke) color.
        color.setStroke()
        print("GREEN")
        
        path.stroke()
    }
    
    /*
    func createARCRuntime()  {
        
        var numberOfImages: CGFloat = 8.0
        var startAngle: CGFloat  = 0
        
        while ( numberOfImages > 0) {
            
            //let radians = deg2rad(360 / numberOfImages)
            let radians = deg2rad(45)
            print("radians :- \(radians) count:- \(numberOfImages) ")
            
            let arcCenter = CGPoint.init(x: 150, y: 150)
            let radius: CGFloat = 75.0
            
            let endAngle = radians
            let clockwise = true
            let path1 =  UIBezierPath.init(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
            //path1.close()
            
            //Line Width
            path1.lineWidth = 5.0
            
            // Specify the fill color and apply it to the path.
            //UIColor.red.setFill()
            //path1.fill()
            
            if ((numberOfImages.truncatingRemainder(dividingBy: 2)) == 0 ) {
                // Specify a border (stroke) color.
                UIColor.blue.setStroke()
                print("BLUE")
            } else {
                // Specify a border (stroke) color.
                UIColor.red.setStroke()
                print("RED")
            }
            
            path1.stroke()
            
            numberOfImages = numberOfImages - 1
            startAngle = startAngle + 45
        }
    }*/
}


extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
