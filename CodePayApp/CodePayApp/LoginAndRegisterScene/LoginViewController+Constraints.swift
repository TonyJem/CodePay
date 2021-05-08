import UIKit
import SnapKit

extension LoginViewController {
    
    func setupConstraints() {
        let imageContainerViewWidth = 90
        let imageSizeMultiplier = 0.8889
        
        let viewHeight = view.frame.size.height
        let imageContainerViewHeight = imageContainerViewWidth
        let spaceBetweenTitleAndImageContainerView: CGFloat = 20
        let spaceBetweenStackViewAndTitle: CGFloat = 35
        let inputViewHeight: CGFloat = 70
        let spaceBetweenInputViews: CGFloat = viewHeight * 0.0267
        let spaceBetweenSubmitButtonAndSecondary: CGFloat = spaceBetweenTitleAndImageContainerView
        let submitButtonHeight: CGFloat = 60
        let secondaryButtonHeight: CGFloat = 40
        let bottomInset: CGFloat = 90
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(contentWidth)
            make.height.equalTo(submitButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(bottomInset)
            make.centerX.equalToSuperview()
        }
        
        secondaryButton.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(contentWidth)
            make.height.equalTo(secondaryButtonHeight)
            make.top.equalTo(submitButton.snp.bottom).offset(spaceBetweenSubmitButtonAndSecondary)
            make.centerX.equalToSuperview()
        }
        
        mainScrollView.snp.makeConstraints { make in
            make.width.equalTo(contentWidth)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(submitButton.snp.top).offset(-5)
        }
    
        imageContainerView.snp.makeConstraints { make in
            make.width.equalTo(imageContainerViewWidth)
            make.height.equalTo(imageContainerViewHeight)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageSizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.width.equalTo(contentWidth)
            make.top.equalTo(imageContainerView.snp.bottom).offset(spaceBetweenStackViewAndTitle)
            make.centerX.equalToSuperview()
        }
        stackView.spacing = spaceBetweenInputViews
        
        phoneView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        phoneView.setupConstraints()
        
        passwordView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        passwordView.setupConstraints()
        
        confirmPasswordView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        confirmPasswordView.setupConstraints()
        
        currencyView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(inputViewHeight)
        }
        currencyView.setupConstraints()
    }
}

extension LoginViewController {
    func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    func keyboardWillAppear(_ keyboardHeight: CGFloat) {
        mainScrollView.snp.updateConstraints { make in
            make.bottom.equalTo(submitButton.snp.top).offset(-100)
        }
        
//        mainScrollView.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20 + keyboardHeight)
//        }
        
        UIView.animate(withDuration: 1.5, animations: view.layoutIfNeeded)
    }
    
    func keyboardWillDisappear() {
//        submitButton.snp.updateConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(90)
//        }
        
        mainScrollView.snp.updateConstraints { make in
            make.bottom.equalTo(submitButton.snp.top).offset(-5)
        }
        
        UIView.animate(withDuration: 1.5, animations: view.layoutIfNeeded)
    }
    
    @objc private func keyboardWillShow(notifaction: NSNotification) {
        guard let keyboardFrame = (notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        self.keyboardWillAppear(keyboardFrame.height)
    }
    
    @objc private func keyboardWillHide() {
        keyboardWillDisappear()
    }
}
