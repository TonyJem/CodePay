import UIKit

class BaseTableViewCell: UITableViewCell, ReusableView {

    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "TestLabel"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        contentView.addSubview(testLabel)
    }
    
    func setupConstraints() {
        testLabel.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(5)
        }
    }
}
