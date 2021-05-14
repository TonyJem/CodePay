import UIKit

class CurrencyCell: BaseTableViewCell {
    
    private let containerView = UIView()
    private let checkIconImageView = UIImageView()
    private let flagLabel = CodePayLabel()
    private let acronymLabel = CodePayLabel()
    private let symbolLabel = CodePayLabel()
    
    private let containerViewCornerRadius: CGFloat = 15
    private let containerViewShadowOffset = CGSize(width: 5, height: 5)
    private let containerViewShadowOpacity: Float  = 0.2
    private let containerViewShadowRadius: CGFloat = 5
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = Colors.mainBackground
        contentView.addSubview(containerView)
        
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
            make.leading.equalToSuperview().inset(15)
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
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    override func fill(currency: Currency) {
        super.fill(currency: currency)
        
        if let icon = currency.icon {
            checkIconImageView.image = icon
            containerView.backgroundColor = .white
            containerView.roundCorners(radius: containerViewCornerRadius)
            containerView.setShadow(offsetSize: containerViewShadowOffset,
                                    opacity: containerViewShadowOpacity,
                                    radius: containerViewShadowRadius)
        } else {
            checkIconImageView.image = UIImage()
            containerView.backgroundColor = Colors.mainBackground
            containerView.roundCorners(radius: 0)
            containerView.removeShadow()
        }
        
        flagLabel.text = currency.flag
        acronymLabel.text = currency.acronym
        symbolLabel.text = currency.symbol
    }
}
