# Drawing-Circle

## Drawing Circle on ImageView depend on circle count.

Added Some screens here.

![](https://github.com/pawankv89/Drawing-Circle/blob/master/images/screen_1.png)

## Usage

### ADrawing-Circle.

``` swift 

import UIKit
import Foundation

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
    }

    func deg2rad(_ degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }
    
    func createARCRuntime()  {
        
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
     
        //Line Width
        path.lineWidth = 10.0
        
        // Specify a border (stroke) color.
        color.setStroke()
        print("GREEN")
        
        path.stroke()
    }
    
    
}


extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}


```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 

