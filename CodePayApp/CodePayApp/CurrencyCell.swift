import UIKit

class CurrencyCell: BaseTableViewCell {
    
    let containerView = UIView()
    let checkIconImageView = UIImageView()
    let flagLabel = CodePayLabel()
    let acronymLabel = CodePayLabel()
    let symbolLabel = CodePayLabel()
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = .green
        
        contentView.addSubview(containerView)
        containerView.backgroundColor = .orange
        
        containerView.addSubview(checkIconImageView)
        
        containerView.addSubview(flagLabel)
        flagLabel.setDTO(dto: .flag)
//        containerView.addSubview(acronymLabel)
//        containerView.addSubview(symbolLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(5)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(60)
        }
        
        checkIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        flagLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(40)
            make.leading.equalTo(checkIconImageView.snp.trailing).offset(5)
            make.centerY.equalToSuperview()
        }
    }
    
    override func fill(currency: Currency) {
        super.fill(currency: currency)
        
        checkIconImageView.image = currency.icon
        flagLabel.text = currency.flag
        acronymLabel.text = currency.acronym
        symbolLabel.text = currency.symbol
    }
}
