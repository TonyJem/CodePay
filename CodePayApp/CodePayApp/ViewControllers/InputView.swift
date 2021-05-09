import UIKit

class InputView: UIView {
    
    var type: InputViewType = .phone

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
    
//    lazy var textFieldContainer: InputContainer = {
//        let container = type.container
//        container.setPlaceHolder(placeholder: type.placeholder)
//
//        self.addSubview(container)
//        return container
//    }()
    
    lazy var inputContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .green

        self.addSubview(container)
        return container
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
        
        self.addSubview(view)
        return view
    }()
}

extension InputView {
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualToSuperview()
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
        
        inputContainer.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.leading.equalTo(iconContainerView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(bottomLineView.snp.top).inset(-4)
        }
//        inputContainer.setupContainerConstraints()
    }
}
