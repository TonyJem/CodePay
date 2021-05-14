import UIKit

class CurrencyCell: BaseTableViewCell {
    
    let containerView = UIView()
    let checkIconImageView = UIImageView()
    let flagLabel = CodePayLabel()
    let acronymLabel = CodePayLabel()
    let symbolLabel = CodePayLabel()
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = Colors.mainBackground
        
        contentView.addSubview(containerView)
        containerView.backgroundColor = Colors.mainBackground
        
        containerView.addSubview(checkIconImageView)
        
        containerView.addSubview(flagLabel)
        flagLabel.setDTO(dto: .currencyFlag)
        
        containerView.addSubview(acronymLabel)
        acronymLabel.setDTO(dto: .currencyAcronym)
        
        containerView.addSubview(symbolLabel)
        symbolLabel.setDTO(dto: .currencySymbol)
        symbolLabel.textAlignment = .right
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(5)
            make.width.equalTo(Core.itemWidth)
            make.centerX.equalToSuperview()
        }
        
        checkIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        flagLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(40)
            make.leading.equalTo(checkIconImageView.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        acronymLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.leading.equalTo(flagLabel.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        symbolLabel.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    override func fill(currency: Currency) {
        super.fill(currency: currency)
        
        if let icon = currency.icon {
            checkIconImageView.image = icon
            containerView.backgroundColor = .orange
        } else {
            checkIconImageView.image = UIImage()
            containerView.backgroundColor = Colors.mainBackground
        }
        
        flagLabel.text = currency.flag
        acronymLabel.text = currency.acronym
        symbolLabel.text = currency.symbol
    }
}
