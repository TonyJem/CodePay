import UIKit

class InputCell: BaseTableViewCell {
    
    private let inputCellHeight: CGFloat = 70
    
    private let inputContainer: InputView = {
        let view = InputView()
        return view
    }()
    
    override func setupView() {
        super.setupView()
        
        inputContainer.type = inputType()
        contentView.addSubview(inputContainer)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        inputContainer.snp.makeConstraints { make in
            make.width.equalTo(Core.elementWidth)
            make.height.equalTo(inputCellHeight)
            make.centerX.centerY.equalTo(contentView)
        }
        inputContainer.setupConstraints()
    }
    
    func inputType() -> InputViewType {
        return .phone
    }
}
