import UIKit

class InputContainer: UIView {
    lazy var textFieldContainerView: UIView = {
        let view = UIView()
        
        self.addSubview(view)
        return view
    }()
    
    func setupContainerConstraints() {
        textFieldContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setPlaceHolder(placeholder: String) {}
}
