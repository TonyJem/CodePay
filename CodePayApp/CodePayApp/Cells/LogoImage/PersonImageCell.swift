import UIKit

class PersonImageCell: BaseTableViewCell {
    
    let imageContainerWidth: CGFloat = 90
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlue
//        view.layer.cornerRadius = self.frame.size.width / 2
        return view
    }()
    
//    private let personImage: UIImageView = {
//        return UIImageView(image: UIImage(imageLiteralResourceName: "person"))
//    }()
    
    override func setupView() {
        super.setupView()
        contentView.addSubview(imageContainerView)
//        imageContainerView.addSubview(personImage)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        imageContainerView.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            make.top.centerX.equalTo(contentView)
        }
        
//        personImage.snp.makeConstraints { make in
//            make.top.bottom.trailing.leading.equalToSuperview()
//        }
        
    }
}
