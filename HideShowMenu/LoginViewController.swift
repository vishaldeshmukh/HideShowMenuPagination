
import UIKit

class LoginViewController: UIViewController {
    
    var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.96, alpha:1.0)

        loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func loginTapped() {
        UserDefaults.standard.set(true, forKey: "LoggedIn")
        UIApplication.shared.keyWindow?.rootViewController = AppNavigationController(rootViewController: PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil))
        self.dismiss(animated: true, completion: nil)
    }

}
