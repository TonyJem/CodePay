import UIKit

class TitleCell: BaseTableViewCell {
    
    private let titleLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func setupView() {
        super.setupView()
        titleLabel.setup(title: "LoginString", dto: CodePayLabelDTO.heading)
        contentView.addSubview(titleLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()

        titleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(Core.elementWidth)
            make.height.equalTo(contentView)
            make.centerX.centerY.equalTo(contentView)
        }
    }
}
