import UIKit

class EnterPhoneVC: UIViewController {
    
    lazy var mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var phoneLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: "+370 601 90090", dto: CodePayLabelDTO.heading)
        lbl.textAlignment = .center
        
        view.addSubview(lbl)
        return lbl
    }()
    
    lazy var noteLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: "notes label", dto: CodePayLabelDTO.title)
        lbl.textAlignment = .left
        
        view.addSubview(lbl)
        return lbl
    }()
    
    lazy var buttonContainer: UIStackView = {
        let stack = UIStackView()
        
        view.addSubview(stack)
        return stack
    }()
    
    lazy var row1Container: UIStackView = {
        let stack = UIStackView()
        
        view.addSubview(stack)
        return stack
    }()
    
    lazy var row2Container: UIStackView = {
        let stack = UIStackView()
        
        view.addSubview(stack)
        return stack
    }()
    
    lazy var row3Container: UIStackView = {
        let stack = UIStackView()
        
        view.addSubview(stack)
        return stack
    }()
    
    lazy var row4Container: UIStackView = {
        let stack = UIStackView()
        
        view.addSubview(stack)
        return stack
    }()
    
    lazy var okButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(okButtonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: __("login_submit_btn"), dto: CodePayButtonDTO.submit)
        
        view.addSubview(btn)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        setupConstraints()
    }
    
    @objc func okButtonDidTap(_ sender: UIButton) {
        print("🟢 'Ok' button")
    }
}

// MARK:  - EnterPhoneVC constraints
private extension EnterPhoneVC {
    private func setupConstraints() {
        mainContainer.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
}
