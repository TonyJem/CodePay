import UIKit

class EnterPhoneVC: UIViewController {
    
    lazy var mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var phoneLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: "+370 601 90090", dto: CodePayLabelDTO.heading)
        lbl.textAlignment = .center
        
        mainContainer.addSubview(lbl)
        return lbl
    }()
    
    lazy var noteLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: "notes label", dto: CodePayLabelDTO.title)
        lbl.textAlignment = .left
        
        mainContainer.addSubview(lbl)
        return lbl
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemGray4
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 20;
        
        stack.addArrangedSubview(row1Stack)
        stack.addArrangedSubview(row2Stack)
        stack.addArrangedSubview(row3Stack)
        stack.addArrangedSubview(row4Stack)
        
        mainContainer.addSubview(stack)
        return stack
    }()
    
    lazy var row1Stack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .green
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 20;
        
        stack.addArrangedSubview(button1)
        stack.addArrangedSubview(button2)
        stack.addArrangedSubview(button3)
        return stack
    }()
    
    lazy var row2Stack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .yellow
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 20;
        
        stack.addArrangedSubview(button4)
        stack.addArrangedSubview(button5)
        stack.addArrangedSubview(button6)
        return stack
    }()
    
    lazy var row3Stack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemPink
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 20;
        
        stack.addArrangedSubview(button7)
        stack.addArrangedSubview(button8)
        stack.addArrangedSubview(button9)
        return stack
    }()
    
    lazy var row4Stack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .purple
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 20;
        
        stack.addArrangedSubview(buttonPlus)
        stack.addArrangedSubview(button0)
        stack.addArrangedSubview(buttonBack)
        return stack
    }()
    
    lazy var button1: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "1", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .red
        return btn
    }()
    
    lazy var button2: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "2", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .purple
        return btn
    }()
    
    lazy var button3: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "3", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button4: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "4", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button5: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "5", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button6: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "6", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button7: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "7", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button8: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "8", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button9: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "9", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var buttonPlus: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "+", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button0: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "0", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var buttonBack: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "B", dto: CodePayButtonDTO.submit)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var okButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "Ok", dto: CodePayButtonDTO.submit)
        
        view.addSubview(btn)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        title = "Enter Phone Number"
        setupConstraints()
    }
    
    @objc func buttonDidTap(_ sender: UIButton) {
        print("🟢 button did Tap!")
    }
}

// MARK:  - EnterPhoneVC constraints
private extension EnterPhoneVC {
    private func setupConstraints() {
        mainContainer.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        noteLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).inset(-30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(noteLabel.snp.bottom).inset(-30)
            make.leading.trailing.equalToSuperview()
        }
        
        row1Stack.snp.makeConstraints { make in
            make.height.equalTo(90)
        }
        
        row2Stack.snp.makeConstraints { make in
            make.height.equalTo(90)
        }
        
        row3Stack.snp.makeConstraints { make in
            make.height.equalTo(90)
        }
        
        row4Stack.snp.makeConstraints { make in
            make.height.equalTo(90)
        }
        
        button1.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button2.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button3.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button4.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button5.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button6.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button7.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button8.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button9.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        buttonPlus.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        button0.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        buttonBack.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
    }
}
