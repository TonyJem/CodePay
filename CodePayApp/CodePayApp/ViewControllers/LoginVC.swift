import UIKit
import SnapKit

class LoginVC: UIViewController {
    private let imageContainerMultiplier: CGFloat = 0.2778
    private let imageResizeMultiplier: CGFloat = 0.8888
    private let mainContainerViewHeight: CGFloat = 350
    private let titleHeight: CGFloat = 70
    private let inputViewHeight: CGFloat = 70
    private let inputViewSpace: CGFloat = -20
    
    private var imageContainerWidth: CGFloat {
        return UIScreen.main.bounds.width * imageContainerMultiplier
    }
    
    // MARK: - Views
    lazy var mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var personImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
        view.layer.cornerRadius = imageContainerWidth/2
        
        mainContainerView.addSubview(view)
        return view
    }()
    
    lazy var personImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(imageLiteralResourceName: "person"))
        
        personImageContainer.addSubview(imageView)
        return imageView
    }()
    
    lazy var titleLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: __("login_title"), dto: CodePayLabelDTO.heading)
        lbl.textAlignment = .center
        
        mainContainerView.addSubview(lbl)
        return lbl
    }()
    
    lazy var phoneView: InputView = {
        let view = InputView()
        view.type = .phone
        
        mainContainerView.addSubview(view)
        return view
    }()
    
    lazy var passwordView: InputView = {
        let view = InputView()
        view.type = .password
        
        mainContainerView.addSubview(view)
        return view
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
        
        mainContainerView.snp.makeConstraints { make in
            make.width.equalTo(Core.itemWidth)
            make.height.equalTo(mainContainerViewHeight)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
        }
        
        personImageContainer.snp.makeConstraints { make in
            make.width.height.equalTo(imageContainerWidth)
            make.top.centerX.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageResizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualToSuperview()
            make.height.equalTo(titleHeight)
            make.top.equalTo(personImageContainer.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        passwordView.snp.makeConstraints { make in
            make.width.bottom.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        passwordView.setupConstraints()
        
        phoneView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
            make.bottom.equalTo(passwordView.snp.top).offset(inputViewSpace)
        }
        phoneView.setupConstraints()
    }
}
