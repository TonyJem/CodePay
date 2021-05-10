import UIKit

class EnterPhoneVC: UIViewController {
    
    private let buttonWidth: CGFloat = 80
    
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
        lbl.backgroundColor = .orange
        
        mainContainer.addSubview(lbl)
        return lbl
    }()
    
    lazy var noteLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: "notes label", dto: CodePayLabelDTO.title)
        lbl.textAlignment = .left
        lbl.backgroundColor = .systemPink
        
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
        stack.addArrangedSubview(row5Stack)
        
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
    
    lazy var row5Stack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .purple
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 20;
        
        stack.addArrangedSubview(buttonOk)
        return stack
    }()
    
    lazy var button1: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "1", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .red
        return btn
    }()
    
    lazy var button2: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "2", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .purple
        return btn
    }()
    
    lazy var button3: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "3", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button4: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "4", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button5: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "5", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button6: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "6", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button7: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "7", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button8: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "8", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button9: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "9", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var buttonPlus: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "+", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var button0: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "0", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var buttonBack: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "B", dto: CodePayButtonDTO.phone)
        
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var buttonOk: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "Ok", dto: CodePayButtonDTO.phone)
        
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
            make.height.equalTo(30)
        }
        
        noteLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(noteLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview()
        }
        
        button1.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button2.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button3.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button4.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button5.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button6.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button7.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button8.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button9.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        buttonPlus.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        button0.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        buttonBack.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        buttonOk.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
    }
}
