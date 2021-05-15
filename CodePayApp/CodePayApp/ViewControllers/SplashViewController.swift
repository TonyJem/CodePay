import  UIKit

class SplashViewController: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
            
            if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
                // navigate to protected page
                SceneDelegate.shared.rootViewController.switchToMainScreen()
            } else {
                // navigate to login screen
                SceneDelegate.shared.rootViewController.switchToLogout()
            }
        }
    }
}
