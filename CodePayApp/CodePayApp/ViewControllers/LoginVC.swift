import UIKit
import SnapKit

class LoginVC: UIViewController {

    private let imageContainerMultiplier: CGFloat = 0.2778
    private let imageResizeMultiplier: CGFloat = 0.8888
    
    let titleHeight: CGFloat = 25
    let spaceBetweenTitleAndImageContainerView: CGFloat = 35
    
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
    
    lazy var titleLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: __("login_title"), dto: CodePayLabelDTO.heading)
        lbl.textAlignment = .center
        
        view.addSubview(lbl)
        return lbl
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
            make.width.height.equalToSuperview().multipliedBy(imageResizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(Core.itemWidth)
            make.height.equalTo(titleHeight)
            make.top.equalTo(personImageContainer.snp.bottom).offset(spaceBetweenTitleAndImageContainerView)
            make.centerX.equalToSuperview()
        }
    }
}
