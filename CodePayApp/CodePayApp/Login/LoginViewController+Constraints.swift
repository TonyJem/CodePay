import UIKit
import SnapKit

extension LoginViewController {
    
    func setupConstraints() {
        let viewWidth = view.frame.size.width
        let imageContainerViewWidth = 90
        let imageSizeMultiplier = 0.8889
        let elementWidth: CGFloat = viewWidth * 0.7143
        
        let viewHeight = view.frame.size.height
        let topInset: CGFloat = viewHeight * 0.1199
        let imageContainerViewHeight = imageContainerViewWidth
        let spaceBetweenTitleAndImageContainerView: CGFloat = 20
        let titleHeight: CGFloat = 25
        let spaceBetweenInputViewAndTitle: CGFloat = 35
        let inputViewHeight: CGFloat = 70
        let spaceBetweenInputViews: CGFloat = viewHeight * 0.0267
        let spaceBetweenSubmitButtonAndSecondary: CGFloat = spaceBetweenTitleAndImageContainerView
        let submitButtonHeight: CGFloat = 60
        let secondaryButtonHeight: CGFloat = 40
        let bottomInset: CGFloat = 90
//        let bottomInset: CGFloat = viewHeight * 0.1651
        
        imageContainerView.snp.makeConstraints { make in
            make.width.equalTo(imageContainerViewWidth)
            make.height.equalTo(imageContainerViewHeight)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(topInset)
            make.centerX.equalToSuperview()
        }
        
        personImage.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(imageSizeMultiplier)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.height.equalTo(titleHeight)
            make.top.equalTo(imageContainerView.snp.bottom).offset(spaceBetweenTitleAndImageContainerView)
            make.centerX.equalToSuperview()
        }
        
        phoneView.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.height.equalTo(inputViewHeight)
            make.top.equalTo(titleLabel.snp.bottom).offset(spaceBetweenInputViewAndTitle)
            make.centerX.equalToSuperview()
        }
        phoneView.setupConstraints()
        
        passwordView.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.height.equalTo(inputViewHeight)
            make.top.equalTo(phoneView.snp.bottom).offset(spaceBetweenInputViews)
            make.centerX.equalToSuperview()
        }
        passwordView.setupConstraints()
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(elementWidth)
            make.height.equalTo(submitButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(bottomInset)
            make.centerX.equalToSuperview()
        }
        
        secondaryButton.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(elementWidth)
            make.height.equalTo(secondaryButtonHeight)
            make.top.equalTo(submitButton.snp.bottom).offset(spaceBetweenSubmitButtonAndSecondary)
            make.centerX.equalToSuperview()
        }
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
        submitButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20 + keyboardHeight)
        }
        UIView.animate(withDuration: 1.5, animations: view.layoutIfNeeded)
    }
    
    func keyboardWillDisappear() {
        submitButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(90)
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
