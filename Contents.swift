//: Playground - noun: a place where people can play
//: Playground - noun: a place where people can play
import PlaygroundSupport
import UIKit
class TriangleView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to:CGPoint (x:rect.size.width/2,y:0))
        path.addLine(to:CGPoint(x:rect.size.width,y:rect.size.height))
        path.addLine(to:CGPoint(x:0,y:rect.size.height))
        path.close()
        UIColor.green.setFill()
        path.fill()
    }
}
class Contorller:UIViewController{
    var label:UILabel!
    var triangle:TriangleView!
    @IBAction func clicked(){
        print("I am clicked")
        label?.text = "I am clicked!"
        UIView.animate(withDuration: 1){
            self.triangle.center = CGPoint(x:200,y:0)
        }
    }
    override func loadView() {
        
        let view = UIView(frame: CGRect(x:0,y:0,width:400,height:800))
        view.backgroundColor = UIColor.red;
        let label = UILabel(frame: CGRect(x:100,y:20,width:200,height:50))
        label.backgroundColor  = UIColor.blue
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "hello world!"
        view.addSubview(label)
        let url = URL(string:" http://img9.ph.126.net/-HfEbE2Ww_u0PYeleti7rQ==/2582251436361021109.jpg")!
        let data = try! Data(contentsOf:url)
        let imge = UIImage(data:data)
        let imageView = UIImageView(frame: CGRect(x:0,y:100,width:400,height:400))
        imageView.image = imge
        view.addSubview(imageView)
        let button = UIButton(frame:CGRect(x:0,y:500,width:400,height:400))
        button.setTitle("Click Me", for:.normal)
        button.addTarget(ct, action:#selector(Contorller.clicked), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        triangle = TriangleView(frame:CGRect(x:100,y:400,width:200,height:200))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
    }
}
let ct = Contorller()
PlaygroundPage.current.liveView = ct
