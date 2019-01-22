
import UIKit

class AppNavigationController: UINavigationController {
    
    var hamburger: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.barTintColor = UIColor(red:0.95, green:0.95, blue:0.96, alpha:1.0)
        self.navigationBar.tintColor = UIColor(red:0.32, green:0.33, blue:0.36, alpha:1.0)
        self.navigationBar.isTranslucent = false
        self.title = ""
        
        let hamburgerWidth = (self.view.frame.width / 4) * 3
        hamburger = UITableView(frame: CGRect(x: -hamburgerWidth, y: 0, width: hamburgerWidth, height: self.view.frame.height))
        hamburger.delegate = self
        hamburger.dataSource = self
        hamburger.register(UITableViewCell.self, forCellReuseIdentifier: "hamburgerCell")
        hamburger.tableHeaderView = setupTableViewHeader()
        hamburger.separatorStyle = .none
        hamburger.layer.shadowColor = UIColor.gray.cgColor
        hamburger.layer.shadowOffset = CGSize(width: 4, height: 0)
        hamburger.layer.shadowOpacity = 0.1
        hamburger.layer.shadowRadius = 0.5
        hamburger.layer.masksToBounds = false
        self.view.addSubview(hamburger)
    }
    
    func showHamburger() {
        UIView.animate(withDuration: 0.3) {
            self.hamburger.frame.origin.x = 0
        }
    }

}

extension AppNavigationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hamburger.dequeueReusableCell(withIdentifier: "hamburgerCell", for: indexPath)
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Dashboard"
        case 1:
            cell.textLabel?.text = "Cameras"
        case 2:
            cell.textLabel?.text = "Timeline"
        case 3:
            cell.textLabel?.text = "Log Out"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hideHamburger()
        if indexPath.row == 3 {
            UserDefaults.standard.set(false, forKey: "LoggedIn")
            self.present(UINavigationController(rootViewController: LoginViewController()), animated: true, completion: nil)
        }
    }
    
    func setupTableViewHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: hamburger.frame.width, height: 50))
        
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(hideHamburger), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(closeButton)
        closeButton.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -15).isActive = true
        closeButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        let separator = UIView(frame: CGRect(x: 0, y: 49, width: headerView.frame.width, height: 1))
        separator.backgroundColor = .gray
        headerView.addSubview(separator)
        
        return headerView
    }
    
    @objc func hideHamburger() {
        let hamburgerWidth = (self.view.frame.width / 4) * 3
        UIView.animate(withDuration: 0.3) {
            self.hamburger.frame.origin.x = -hamburgerWidth
        }
    }
}
