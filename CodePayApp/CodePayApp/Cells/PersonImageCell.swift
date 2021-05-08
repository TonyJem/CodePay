import UIKit

class PersonImageCell: BaseTableViewCell {
    
    private let imageContainerWidth: CGFloat = 90
    private let imageSizeMultiplier: CGFloat = 0.8888
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
        return view
    }()
    
    private let personImage: UIImageView = {
        return UIImageView(image: UIImage(imageLiteralResourceName: "person"))
    }()
    
    override func setupView() {
        super.setupView()
        imageContainerView.layer.cornerRadius = imageContainerWidth / 2
        contentView.addSubview(imageContainerView)
        imageContainerView.addSubview(personImage)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        imageContainerView.snp.makeConstraints { make in
            make.width.height.equalTo(imageContainerWidth)
            make.centerX.centerY.equalTo(contentView)
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageSizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
