import UIKit

class LoginRegisterVC: UIViewController {
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.mainBackground
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Colors.mainBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.reuseID)
        tableView.register(LogoImageCell.self, forCellReuseIdentifier: LogoImageCell.reuseID)

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
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LogoImageCell.reuseID, for: indexPath) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension LoginRegisterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: LogoImageCell.reuseID, for: indexPath) as? BaseTableViewCell else {
//            print("🔴 RowHeght will be set to 50")
//            return 50
//        }
//        print("🟡 RowHeght will be set to height")
//        return cell.height()
        
        return 100
    }
}
