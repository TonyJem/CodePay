import UIKit

class CurrencyVC: UIViewController {

    private let model = CurrencyModel()
    private var currencyTable = UITableView()

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
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        currencyTable = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - 100))
        currencyTable.tableFooterView = UIView()
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
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(Core.itemWidth)
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK:  - TableViewDataSource
extension CurrencyVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.currencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.reuseID, for: indexPath) as? BaseTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension CurrencyVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }
}
