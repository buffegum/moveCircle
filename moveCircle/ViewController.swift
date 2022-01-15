import UIKit

enum Movebuttons: String {
    case left = "left"
    case right = "right"
    case up = "up"
    case down = "down"
}

class ViewController: UIViewController {

    let circle = UIView()
    let upButton = UIButton()
    let downButton = UIButton()
    let leftButton = UIButton()
    let rightButton = UIButton()
    let step: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleSet()
        setButton()
        move()
    }
    
    func circleSet()  {
        circle.frame.size.height = 100
        circle.frame.size.width = 100
        circle.center = self.view.center
        circle.backgroundColor = .red
        circle.layer.cornerRadius = circle.frame.width / 2
        self.view.addSubview(circle)
    }
    
    func setButton(){
        let array = [upButton,downButton,leftButton,rightButton]
        let widthButton = 50
        let heighButton = 50
        upButton.backgroundColor = .gray
        downButton.backgroundColor = .blue
        leftButton.backgroundColor = .brown
        rightButton.backgroundColor = .cyan
        
        downButton.frame =  CGRect(x: Int(view.center.x) - widthButton/2, y: Int(self.view.frame.height) - widthButton * 2, width: widthButton, height: heighButton)
        upButton.frame = CGRect(x: Int(downButton.frame.origin.x), y: Int(downButton.frame.origin.y) - widthButton * 2, width: widthButton, height: heighButton)
        leftButton.frame = CGRect(x: Int(downButton.frame.origin.x) - widthButton, y: Int(downButton.frame.origin.y) - heighButton, width: widthButton, height: heighButton)
        rightButton.frame = CGRect(x: Int(downButton.frame.origin.x) + widthButton, y: Int(downButton.frame.origin.y) - heighButton, width: widthButton, height: heighButton)
        var tag = 0
        for i in array{
            self.view.addSubview(i)
            i.tag = tag
            tag += 1
        }
    }

    
    func move(){
        upButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressButton(_ sender: UIButton){
        switch sender.tag {
        case 0:
            if circle.frame.origin.y - step < 16{
                        return
                    }
                    circle.frame.origin.y -= step
        case 1:
            if circle.frame.origin.y + circle.frame.height + step > upButton.frame.origin.y {
                return
            }
            circle.frame.origin.y += step
        case 2:
            if circle.frame.origin.x - step < 0 {
                return
            }
            circle.frame.origin.x -= step
        case 3:
            if circle.frame.origin.x + step + circle.frame.width > self.view.frame.width {
                return
            }
            circle.frame.origin.x += step
        default:
            return
            
        }
    }
   
}







//        upButton.addTarget(self, action: #selector(up), for: .touchUpInside)
//        downButton.addTarget(self, action: #selector(down), for: .touchUpInside)
//        leftButton.addTarget(self, action: #selector(left), for: .touchUpInside)
//        rightButton.addTarget(self, action: #selector(right), for: .touchUpInside)
        

//    @objc func up(){
//        if circle.frame.origin.y - step < 16{
//            return
//        }
//        circle.frame.origin.y -= step
//    }
//    @objc func down(){
//        if circle.frame.origin.y + circle.frame.height + step > upButton.frame.origin.y {
//            return
//        }
//        circle.frame.origin.y += step
//    }
//    @objc func left(){
//        if circle.frame.origin.x - step < 0 {
//            return
//        }
//        circle.frame.origin.x -= step
//    }
//    @objc func right(){
//        if circle.frame.origin.x + step + circle.frame.width > self.view.frame.width {
//            return
//        }
//        circle.frame.origin.x += step
//    }
