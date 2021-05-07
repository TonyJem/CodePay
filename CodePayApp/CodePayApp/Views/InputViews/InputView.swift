import UIKit

class InputView: UIView {
    
    private var type: InputViewType = .password
    
    private var passwordIsVisible = false {
        didSet {
            if passwordIsVisible {
                let image = UIImage(named: "passwordHide")
                visibilityButton.setImage(image, for: .normal)
            } else {
                let image = UIImage(named: "passwordShow")
                visibilityButton.setImage(image, for: .normal)
            }
            textField.isSecureTextEntry = !passwordIsVisible
        }
    }
    
    lazy var titleLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: type.title, dto: CodePayLabelDTO.title)
        
        self.addSubview(lbl)
        return lbl
    }()
    
    lazy var iconContainerView: UIView = {
        let view = UIView()
        
        self.addSubview(view)
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(imageLiteralResourceName: type.imageName))
        
        iconContainerView.addSubview(imageView)
        return imageView
    }()
    
    lazy var textFieldContainer: UIView = {
        let view = UIView()
        
        self.addSubview(view)
        return view
    }()
    
    lazy var textField: CodePayTextField = {
        let textField = CodePayTextField(frame: .zero)
        textField.setup(title: "", dto: CodePayTextFieldDTO.regular)
        textField.placeholder = type.placeholder
        textField.isSecureTextEntry = true
        
        textFieldContainer.addSubview(textField)
        return textField
    }()
    
    lazy var visibilityButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(visibilityButtonDidTap(_:)), for: .touchUpInside)
        btn.setImage(UIImage(named: "passwordShow"), for: .normal)
        
        textFieldContainer.addSubview(btn)
        return btn
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
        
        self.addSubview(view)
        return view
    }()
    
    @objc func visibilityButtonDidTap(_ sender: UIButton) {
        passwordIsVisible = !passwordIsVisible
    }
}

extension InputView {
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.leading.equalToSuperview()
        }
        
        bottomLineView.snp.makeConstraints { make in
            make.height.equalTo(3)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        iconContainerView.snp.makeConstraints { make in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.leading.equalToSuperview()
            make.bottom.equalTo(bottomLineView.snp.top).offset(-4)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.edges.equalTo(iconContainerView)
        }
        
        textFieldContainer.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.leading.equalTo(iconContainerView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(bottomLineView.snp.top).inset(-4)
        }
        
        visibilityButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(35)
            make.bottom.trailing.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.trailing.equalTo(visibilityButton.snp.leading)
        }
    }
}
