import UIKit

class LoginRegisterVC: UIViewController {
    
    private let tableView = UITableView()
    private let identifieres = [PersonImageCell.cellID,
                                TitleCell.cellID,
                                PhoneInputCell.cellID,
                                PasswordInputCell.cellID,
                                ConfirmPasswordInputCell.cellID,
                                CurrencyInputCell.cellID]
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.mainBackground
        
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
        
        self.view.addSubview(tableView)
        setupTableConstraints()
    }
    
    private func setupTableConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(300)
            make.height.equalTo(500)
            make.centerX.equalToSuperview()
        }
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
