import UIKit

class LoginRegisterVC: UIViewController {
    
    private let secondaryButtonHeight: CGFloat = 40
    private let submitButtonHeight: CGFloat = 60
    private let tableView = UITableView()
    private let identifieres = [PersonImageCell.cellID,
                                TitleCell.cellID,
                                PhoneInputCell.cellID,
                                PasswordInputCell.cellID,
                                ConfirmPasswordInputCell.cellID,
                                CurrencyInputCell.cellID]
    
    private let submitButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(submitButtonDidTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    private let secondaryButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.addTarget(self, action: #selector(secondaryButtonDidTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    private var onLogin: Bool = true {
        didSet {
            submitButtonTitle = onLogin ? __("login_submit_btn") : __("create_account_submit_btn")
            secondaryButtonTitle = onLogin ? __("create_account_secondary_btn") : __("login_secondary_btn")
        }
    }
    
    private var submitButtonTitle = "" {
        didSet {
            submitButton.setup(title: submitButtonTitle, dto: CodePayButtonDTO.submit)
        }
    }
    
    private var secondaryButtonTitle = "" {
        didSet {
            secondaryButton.setup(title: secondaryButtonTitle, dto: CodePayButtonDTO.secondary)
        }
    }
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        setupTableView()
        view.addSubview(tableView)
        view.addSubview(submitButton)
        view.addSubview(secondaryButton)
        setupConstraints()
        initializeHideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        onLogin = true
    }
    
    // MARK:  - Actions
    @objc func submitButtonDidTap(_ sender: UIButton) {
        print("🟢 'Submit' button in Login Scene did Tap")
    }

    @objc func secondaryButtonDidTap(_ sender: UIButton) {
        onLogin = !onLogin
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    private func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
}

// MARK:  - Constraints
private extension LoginRegisterVC {
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(Core.elementWidth)
            make.height.equalTo(500)
            make.centerX.equalToSuperview()
        }
        
        secondaryButton.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(Core.elementWidth)
            make.height.equalTo(secondaryButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.centerX.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(Core.elementWidth)
            make.height.equalTo(submitButtonHeight)
            make.bottom.equalTo(secondaryButton.snp.top).inset(-20)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK:  - tableView Setup
private extension LoginRegisterVC {
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Colors.mainBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PersonImageCell.self, forCellReuseIdentifier: PersonImageCell.cellID)
        tableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.cellID)
        tableView.register(PhoneInputCell.self, forCellReuseIdentifier: PhoneInputCell.cellID)
        tableView.register(PasswordInputCell.self, forCellReuseIdentifier: PasswordInputCell.cellID)
        tableView.register(ConfirmPasswordInputCell.self, forCellReuseIdentifier: ConfirmPasswordInputCell.cellID)
        tableView.register(CurrencyInputCell.self, forCellReuseIdentifier: CurrencyInputCell.cellID)
    }
}

// MARK:  - tableView DataSource
extension LoginRegisterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        identifieres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifieres[indexPath.row], for: indexPath) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK:  - tableView Delegate
extension LoginRegisterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 110
        case 1:
            return 40
        default:
            return 90
        }
    }
}
