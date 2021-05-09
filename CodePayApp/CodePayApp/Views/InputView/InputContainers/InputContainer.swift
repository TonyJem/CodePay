import UIKit

class InputContainer: UIView {
    lazy var inputViewContainer: UIView = {
        let view = UIView()
        
        self.addSubview(view)
        return view
    }()
    
    func setupContainerConstraints() {
        inputViewContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setPlaceholder(placeholder: String) {}
}
