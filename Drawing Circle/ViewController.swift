//
//  ViewController.swift
//  Drawing Circle
//
//  Created by Pawan kumar on 30/08/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit


//https://www.appcoda.com/bezier-paths-introduction/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Add Drawig View
        let width: CGFloat = 320.0
        let height: CGFloat = 320.0
        let demoView = DrawingView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                              y: self.view.frame.size.height/2 - height/2,
                                              width: width,
                                              height: height))
        
        demoView.layer.cornerRadius = 15.0
        demoView.layer.masksToBounds = true
        self.view.addSubview(demoView)
    }
}

class DrawingView: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        //self.createRectangle()
        
        //self.createTriangle()
        
        //self.createCircle()
        
        self.createARC()
        
        self.createARCRuntime()
        
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill()
        path.fill()
        
        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        path.stroke()
    }
    func createRectangle() {
        // Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
    func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
    func createCircle() {
        
        // Create an oval shape path.
        //Oval
        path = UIBezierPath(ovalIn: self.bounds)
        
        //Circle
        //path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: self.frame.size.height, height: self.frame.size.height))
    }
    
    func createARC()  {
    
        let radians = deg2rad(90)
        print("radians:- \(radians)")
    
        let arcCenter = CGPoint.init(x: 150, y: 150)
        let radius: CGFloat = 75.0
        let startAngle: CGFloat  = 0
        let endAngle = radians
        let clockwise = true
        path =  UIBezierPath.init(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        path.close()
    }
    
    func deg2rad(_ degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }
    
    
    func createARCRuntime()  {
        
        let numberOfImages: CGFloat = 1.0
        let radians = deg2rad(360 / numberOfImages)
        print("radians:- \(radians)")
        
        let arcCenter = CGPoint.init(x: 150, y: 150)
        let radius: CGFloat = 75.0
        let startAngle: CGFloat  = 0
        let endAngle = radians
        let clockwise = true
        let path1 =  UIBezierPath.init(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        path1.close()
        
        // Specify the fill color and apply it to the path.
        UIColor.red.setFill()
        path1.fill()
        
        // Specify a border (stroke) color.
        UIColor.green.setStroke()
        path1.stroke()
    }
}
