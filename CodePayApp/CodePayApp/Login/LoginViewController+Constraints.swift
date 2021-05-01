import UIKit
import SnapKit

extension LoginViewController {
    
    func setupConstraints() {
        imageContainerView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(150)
            make.centerX.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
            
        loginLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(300)
            make.top.equalTo(imageContainerView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(300)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK:  - SnapKit Constraints Examples
/*
 make.width.equalToSuperview().multipliedBy(0.45)
 
 make.width.equalTo(90)
 
 make.height.equalTo(45)
 
 make.top.equalTo(viewProgress.snp.bottom).offset(32)
 
 make.centerX.equalToSuperview()
 
 make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
 
 make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
 
 make.edges.equalToSuperview().inset(16)
 
 make.edges.equalTo(imageContainerView).inset(16)
 */
