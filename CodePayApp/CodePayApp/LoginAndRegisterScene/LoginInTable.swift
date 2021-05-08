import UIKit
import SnapKit

class LoginInTableVC: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = CGRect(x: 10, y: 10, width: 100, height: 500)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}

extension LoginInTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("get cell")
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel!.text = "Test line \(indexPath.row)"
        return cell
    }
}

extension LoginInTableVC: UITableViewDelegate {
}
