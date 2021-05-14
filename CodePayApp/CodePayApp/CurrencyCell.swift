import UIKit

class CurrencyCell: BaseTableViewCell {
    
    let containerView = UIView()
   
    
    
    override func setupView() {
        super.setupView()
        
        contentView.addSubview(containerView)
        
        backgroundColor = .systemGray6
        contentView.backgroundColor = .white
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(contentView).inset(10)
        }
    }
}
