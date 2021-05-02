import UIKit

class PasswordView: UIView {
    
    private var type: InputViewType = .password
    
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
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        textField.textColor = Colors.lightBlue
        textField.placeholder = type.placeholder
        
        textFieldContainer.addSubview(textField)
        return textField
    }()
    
    lazy var visibilityButton: UIButton = {
        let btn = UIButton(type: .custom)
        let image = UIImage(named: "passwordShow")
        btn.addTarget(self, action: #selector(visibilityButtonDidTap(_:)), for: .touchUpInside)
        btn.setImage(image, for: .normal)
        
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
        print("🟢👁‍🗨🟢 'visibilityButtonDidTap' button in Login Scene did Tap")
    }
}

extension PasswordView {
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
