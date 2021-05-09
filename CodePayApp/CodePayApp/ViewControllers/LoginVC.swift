import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    lazy var personImageContainer: UIView = {
       let view = UIView()
        
        view.backgroundColor = .systemPink
        
        self.view.addSubview(view)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        setupConstraints()
    }
}

private extension LoginVC {
    private func setupConstraints() {
        personImageContainer.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
