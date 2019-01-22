
import UIKit

class PageViewController: UIPageViewController {
    
    var pageControl: UIPageControl!
    
    let pages = [HomeViewController(), AboutViewController(), ContactViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self

        self.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        
        let hamburgerButton = UIButton()
        hamburgerButton.setImage(UIImage(named: "hamburger")?.withRenderingMode(.alwaysTemplate), for: .normal)
        hamburgerButton.addTarget(self, action: #selector(hamburgerTapped), for: .touchUpInside)
        hamburgerButton.translatesAutoresizingMaskIntoConstraints = false
        hamburgerButton.widthAnchor.constraint(equalTo: hamburgerButton.heightAnchor, multiplier: 1).isActive = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: hamburgerButton)
        
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let currentFrame = pageControl.frame
        pageControl.frame = CGRect(x: currentFrame.origin.x, y: currentFrame.origin.y, width: currentFrame.width + 20, height: currentFrame.height)
        pageControl.layer.cornerRadius = currentFrame.height / 2
    }
    
    @objc func hamburgerTapped() {
        if let navigationController = self.navigationController as? AppNavigationController {
            navigationController.showHamburger()
        }
    }

}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = pages.index(of: viewController) {
            if viewControllerIndex != 0 {
                return pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = pages.index(of: viewController) {
            if viewControllerIndex < pages.count - 1 {
                return pages[viewControllerIndex + 1]
            }
        }
        return nil
    }
}

extension PageViewController {
    func setupView() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pageControl)
        
        configureLayout()
    }
    
    func configureLayout() {
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
