import UIKit

class PhoneViewController: UIViewController {
    
    private let buttonWidth: CGFloat = 80
    private let phoneLengthLimit = 12
    private let spacing: CGFloat = DimensionsUI.spacing
    private let validator = PhoneValidator()
    
    private var phone = "" {
        didSet {
            phoneLabel.text = phone
            buttonBack.isHidden = phone == ""
            buttonPlus.isHidden = phone != ""
            isValid = validator.isValid(number: phone)
            noteLabel.text = validator.validationNote(number: phone)
        }
    }
    
    private var isValid: Bool = false {
        didSet {
            buttonOk.isHidden = !isValid
        }
    }
    
    // MARK: - Views
    lazy var mainContainer: UIView = {
        let view = UIView()
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var phoneLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: phone, dto: CodePayLabelDTO.label)
        lbl.textAlignment = .center
        
        mainContainer.addSubview(lbl)
        return lbl
    }()
    
    lazy var noteLabel: CodePayLabel = {
        let lbl = CodePayLabel(frame: .zero)
        lbl.setup(title: "", dto: CodePayLabelDTO.note)
        lbl.textAlignment = .center
        
        mainContainer.addSubview(lbl)
        return lbl
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = spacing;
        
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
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = spacing;
        
        stack.addArrangedSubview(button1)
        stack.addArrangedSubview(button2)
        stack.addArrangedSubview(button3)
        return stack
    }()
    
    lazy var row2Stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = spacing;
        
        stack.addArrangedSubview(button4)
        stack.addArrangedSubview(button5)
        stack.addArrangedSubview(button6)
        return stack
    }()
    
    lazy var row3Stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = spacing;
        
        stack.addArrangedSubview(button7)
        stack.addArrangedSubview(button8)
        stack.addArrangedSubview(button9)
        return stack
    }()
    
    lazy var row4Stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = spacing;
        
        stack.addArrangedSubview(buttonPlusContainer)
        stack.addArrangedSubview(button0)
        stack.addArrangedSubview(buttonBackContainer)
        return stack
    }()
    
    lazy var row5Stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = spacing;
        
        stack.addArrangedSubview(buttonOk)
        return stack
    }()
    
    lazy var button1: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "1", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button2: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "2", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button3: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "3", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button4: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "4", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button5: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "5", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button6: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "6", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button7: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "7", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button8: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "8", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var button9: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "9", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var buttonPlusContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var buttonPlus: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "+", dto: CodePayButtonDTO.phone)
        
        buttonPlusContainer.addSubview(btn)
        return btn
    }()
    
    lazy var button0: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "0", dto: CodePayButtonDTO.phone)
        return btn
    }()
    
    lazy var buttonBackContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var buttonBack: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.setImage(UIImage(named: "backSpace"), for: .normal)
        btn.addTarget(self, action: #selector(buttonBackDidTap(_:)), for: .touchUpInside)
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(buttonBackDidTapLong))
        btn.addGestureRecognizer(longGesture)
        
        buttonBackContainer.addSubview(btn)
        return btn
    }()
    
    lazy var buttonOk: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.isHidden = true
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(buttonOkDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "OK", dto: CodePayButtonDTO.phoneOK)
        return btn
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        title = "Phone Number"
        
        setupConstraints()
        buttonBack.isHidden = phone == ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

// MARK:  - Actions
private extension PhoneViewController {
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        guard let number = sender.title(for: .normal),
              phone.count <= phoneLengthLimit else {
            return
        }
        phone += number == "+" ? "+3706" : number
    }
    
    @objc private func buttonBackDidTap(_ sender: UIButton) {
        guard phone != "" else { return }
        phone.removeLast()
    }
    
    @objc private func buttonBackDidTapLong(_ sender: UIButton) {
        phone = ""
    }
    
    @objc private func buttonOkDidTap(_ sender: UIButton) {
        guard let phone = phoneLabel.text else { return }
        AccountManager.addCandidatePhone(phone: phone)
        self.navigationController?.pushViewController(PasswordViewController(), animated: true)
    }
}


// MARK:  - EnterPhoneVC constraints
private extension PhoneViewController {
    private func setupConstraints() {
        mainContainer.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(DimensionsUI.topBottomInset)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        
        noteLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).inset(-1 * DimensionsUI.noteLabelInset)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(DimensionsUI.stackViewInset)
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
        
        buttonPlusContainer.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        buttonPlus.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        button0.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        buttonBackContainer.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
        
        buttonBack.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        buttonOk.snp.makeConstraints { make in
            make.height.width.equalTo(buttonWidth)
        }
    }
}
