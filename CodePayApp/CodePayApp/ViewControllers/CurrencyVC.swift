import UIKit

class CurrencyVC: UIViewController {
    private let submitButtonBottomInset = 120
    private let model = CurrencyModel()
    
    lazy var currencyTable: UITableView = {
        let table = UITableView()
        
        view.addSubview(table)
        return table
    }()
    
    lazy var submitButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(submitButtonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "Confirm Registration", dto: CodePayButtonDTO.submit)
        
        view.addSubview(btn)
        return btn
    }()
    
    // MARK:  - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        
        currencyTable.tableFooterView = UIView()
        currencyTable.rowHeight = 70
        currencyTable.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.reuseID)
        currencyTable.dataSource = self
        currencyTable.delegate = self
        self.view.addSubview(currencyTable)
        
        setupConstraints()
    }
    
    // MARK:  - Actions
    @objc func submitButtonDidTap(_ sender: UIButton) {
        Core.navController.pushViewController(HomeVC(), animated: true)
    }
}

// MARK:  - LoginVC constraints
private extension CurrencyVC {
    func setupConstraints() {
        
        currencyTable.snp.makeConstraints { make in
            make.width.equalTo(Core.itemWidth)
            make.height.equalTo(500)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.centerX.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(Core.itemWidth)
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(submitButtonBottomInset)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK:  - CurrencyTable ViewDataSource
extension CurrencyVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.reuseID, for: indexPath) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        cell.fill(currency: model.currencies[indexPath.row])
        return cell
    }
}

// MARK:  - CurrencyTable ViewDelegate
extension CurrencyVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.markCurrency(at: indexPath.row)
        tableView.reloadData()
    }
}
