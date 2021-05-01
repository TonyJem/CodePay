import UIKit

class InputView: UIView {
    
    var imageName = ""
    var titleLabelText = ""
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        lbl.textColor = Colors.lightBlue
        lbl.text = titleLabelText
        
        self.addSubview(lbl)
        return lbl
    }()
    
    lazy var iconContainerView: UIView = {
        let view = UIView()
        
        self.addSubview(view)
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        iconContainerView.addSubview(imageView)
        return imageView
    }()
    
    lazy var textFieldContainer: TextFieldContainerView = {
        let view = TextFieldContainerView()
        
        self.addSubview(view)
        return view
        
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
        textFieldContainer.setupConstraints()
    }
}
