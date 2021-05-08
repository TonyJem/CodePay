import UIKit

class LoginRegisterVC: UIViewController {
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.mainBackground
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Colors.mainBackground
        
        tableView.rowHeight = 50
        tableView.dataSource = self
        
        tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.reuseID)

        self.view.addSubview(tableView)
        setupTableConstraints()
    }
    
    private func setupTableConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
    }
}

extension LoginRegisterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newReminderCell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.reuseID, for: indexPath) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        return newReminderCell
    }
}
