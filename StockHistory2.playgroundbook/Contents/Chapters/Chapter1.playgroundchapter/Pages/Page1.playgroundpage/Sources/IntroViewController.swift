import UIKit
import PlaygroundSupport


import UIKit
import PlaygroundSupport

public class IntroViewController : UIViewController {
    public override func loadView() {
        public let view = UIView()
        view.backgroundColor = .white

        public let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}

