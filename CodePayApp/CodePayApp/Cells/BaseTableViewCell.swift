import UIKit

class BaseTableViewCell: UITableViewCell, ReusableView {
    
    private let defaultCellHeight: CGFloat = 60
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
        
//        TODO: REmove separator or make it clear or same as background color
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        backgroundColor = Colors.mainBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {}
    func setupConstraints() {}
    
    func height() -> CGFloat {
        return defaultCellHeight
    }
}
