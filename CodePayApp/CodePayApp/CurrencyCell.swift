import UIKit

class CurrencyCell: BaseTableViewCell {
    
    let containerView = UIView()

    override func setupView() {
        super.setupView()
        
        contentView.addSubview(containerView)
        containerView.backgroundColor = .orange
        
        backgroundColor = .green
        contentView.backgroundColor = .white
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(5)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
    }
}
