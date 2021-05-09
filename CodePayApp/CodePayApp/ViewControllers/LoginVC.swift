import UIKit
import SnapKit

class LoginVC: UIViewController {

    private let imageContainerMultiplier: CGFloat = 0.2778
    private let imageSizeMultiplier: CGFloat = 0.8888
    
    private var imageContainerWidth: CGFloat {
        return UIScreen.main.bounds.width * imageContainerMultiplier
    }
    
    lazy var personImageContainer: UIView = {
        let view = UIView()
        
        view.backgroundColor = Colors.lightBlue
        
        view.layer.cornerRadius = imageContainerWidth/2
        
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
            make.width.height.equalTo(imageContainerWidth)
            make.centerX.centerY.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageSizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
