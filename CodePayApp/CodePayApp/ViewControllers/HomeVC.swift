import UIKit

class HomeVC: UIViewController {
    
    lazy var submitButton: CodePayButton = {
        let btn = CodePayButton(type: .custom)
        btn.showsTouchWhenHighlighted = true
        btn.addTarget(self, action: #selector(submitButtonDidTap(_:)), for: .touchUpInside)
        btn.setup(title: "Home Screen", dto: CodePayButtonDTO.submit)
        
        view.addSubview(btn)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackground
        setupConstraints()
    }
    
    // MARK:  - Actions
    @objc func submitButtonDidTap(_ sender: UIButton) {
        print("🟢 Current Account Data:")
        print("\(AccountManager.candidateAccount.phone)")
        print("\(AccountManager.candidateAccount.password)")
        print("\(AccountManager.candidateAccount.currency)")
    }
}
// MARK:  - LoginVC constraints
private extension HomeVC {
    private func setupConstraints() {
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(DimensionsUI.itemWidth)
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
    }
}
