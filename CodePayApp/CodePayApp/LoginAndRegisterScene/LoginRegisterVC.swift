import UIKit

class LoginRegisterVC: UIViewController {
    
    let identifieres = [PersonImageCell.reuseID,
                        TitleCell.reuseID,
                        PhoneInputCell.reuseID,
                        PasswordInputCell.reuseID,
                        ConfirmPasswordInputCell.reuseID,
                        CurrencyInputCell.reuseID]
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.mainBackground
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Colors.mainBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PersonImageCell.self, forCellReuseIdentifier: PersonImageCell.reuseID)
        tableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.reuseID)
        tableView.register(PhoneInputCell.self, forCellReuseIdentifier: PhoneInputCell.reuseID)
        tableView.register(PasswordInputCell.self, forCellReuseIdentifier: PasswordInputCell.reuseID)
        tableView.register(ConfirmPasswordInputCell.self, forCellReuseIdentifier: ConfirmPasswordInputCell.reuseID)
        tableView.register(CurrencyInputCell.self, forCellReuseIdentifier: CurrencyInputCell.reuseID)
        
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
