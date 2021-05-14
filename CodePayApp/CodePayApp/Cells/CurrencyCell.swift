import UIKit

class CurrencyCell: BaseTableViewCell {
    
    private let containerView = UIView()
    private let checkIconImageView = UIImageView()
    private let flagLabel = CodePayLabel()
    private let acronymLabel = CodePayLabel()
    private let symbolLabel = CodePayLabel()
    private let spacing: CGFloat = 15
    
    lazy var rowStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = spacing
        
        stack.addArrangedSubview(checkIconImageView)
        stack.addArrangedSubview(flagLabel)
        stack.addArrangedSubview(acronymLabel)
        return stack
    }()
    
    private let cornerRadius: CGFloat = 15
    
    override func setupView() {
        super.setupView()
        
        contentView.backgroundColor = Colors.mainBackground
        contentView.addSubview(containerView)
        
        flagLabel.setDTO(dto: .currencyFlag)
        acronymLabel.setDTO(dto: .currencyAcronym)
        containerView.addSubview(rowStack)
        
        containerView.addSubview(symbolLabel)
        symbolLabel.setDTO(dto: .currencySymbol)
        symbolLabel.textAlignment = .right
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(5)
            make.width.equalTo(DimensionsUI.itemWidth)
            make.centerX.equalToSuperview()
        }
        
        rowStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(5)
        }
        
        checkIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        flagLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(40)
        }
        
        acronymLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
        symbolLabel.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    override func fill(currency: Currency) {
        super.fill(currency: currency)
        
        if let icon = currency.icon {
            checkIconImageView.isHidden = false
            checkIconImageView.image = icon
            containerView.backgroundColor = .white
            containerView.roundCorners(radius: cornerRadius)
            containerView.setShadow()
        } else {
            checkIconImageView.isHidden = true
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
