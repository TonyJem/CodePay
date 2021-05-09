import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    private let imageSizeMultiplier: CGFloat = 0.8888
    
    lazy var personImageContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = Colors.lightBlue
        
        view.layer.cornerRadius = 45
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var personImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(imageLiteralResourceName: "person"))
        
        personImageContainer.addSubview(imageView)
        return imageView
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        setupConstraints()
    }
}

// MARK:  - LoginVC constraints
private extension LoginVC {
    private func setupConstraints() {
        personImageContainer.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
            make.centerX.centerY.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageSizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
