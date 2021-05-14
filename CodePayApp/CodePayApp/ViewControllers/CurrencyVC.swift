import UIKit

class CurrencyVC: UIViewController {
    private let submitButtonBottomInset = 120
    private let model = CurrencyModel()
    
    private var selectedCurrency = ""
    
    // MARK: - Views
    lazy var currencyTable: UITableView = {
        let table = UITableView()
        table.rowHeight = 70
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.tableFooterView = UIView()
        table.alwaysBounceVertical = false
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = Colors.mainBackground
        table.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.reuseID)
        
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
        setupConstraints()
    }
    
    // MARK:  - Actions
    @objc func submitButtonDidTap(_ sender: UIButton) {
        AccountManager.addCandidateCurrency(currency: selectedCurrency)
        
//        Jump directly to rootViewController
        Core.navController.popToRootViewController(animated: true)
        Core.navController.pushViewController(HomeVC(), animated: true)
    }
}

// MARK:  - LoginVC constraints
private extension CurrencyVC {
    func setupConstraints() {
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(DimensionsUI.itemWidth)
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(submitButtonBottomInset)
            make.centerX.equalToSuperview()
        }
        
        currencyTable.snp.makeConstraints { make in
            make.width.equalTo(DimensionsUI.itemWidth + 30)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(currencyTable.rowHeight * 7)
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
        selectedCurrency = model.currencies[indexPath.row].acronym
        tableView.reloadData()
    }
}
