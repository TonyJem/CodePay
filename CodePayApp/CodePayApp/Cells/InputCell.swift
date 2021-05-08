import UIKit

class InputCell: BaseTableViewCell {
    
    private let inputViewHeight: CGFloat = 70
    
    private let inputContainer: InputView = {
        let view = InputView()
        return view
    }()
    
    override func setupView() {
        super.setupView()
        
        inputContainer.type = .phone
        contentView.addSubview(inputContainer)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        inputContainer.snp.makeConstraints { make in
            make.width.equalTo(Core.elementWidth)
            make.height.equalTo(inputViewHeight)
            make.centerX.centerY.equalTo(contentView)
        }
        inputContainer.setupConstraints()
    }
}
