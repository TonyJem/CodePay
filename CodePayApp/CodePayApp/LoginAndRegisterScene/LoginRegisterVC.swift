import UIKit
import SnapKit

class LoginRegisterVC: UIViewController {
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.mainBackground
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Colors.mainBackground
        
        tableView.dataSource = self
        tableView.delegate = self

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
        NSLog("🟢 get cell")
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = "Test line \(indexPath.row)"
        return cell
    }
}

extension LoginRegisterVC: UITableViewDelegate {
}
