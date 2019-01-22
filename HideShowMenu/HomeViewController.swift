
import UIKit

class HomeViewController: UIViewController {
    
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.96, alpha:1.0)
        
        label = UILabel()
        label.text = "Dashboard"
        label.font = UIFont.systemFont(ofSize: 40)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}

