import UIKit

class TestCell: BaseTableViewCell {

    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "TestLabel"
        return label
    }()
    
    override func setupView() {
        super.setupView()
        
        contentView.addSubview(testLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        testLabel.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(5)
        }
    }
    

}