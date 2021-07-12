//
//  DescriptionEventViewController.swift
//  NotAlone v2
//
//  Created by Максим on 06.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class DescriptionEventViewController: UIViewController {
    
    var viewModel: DescriptionEventViewModel = DescriptionEventViewModelImpl()
    
    //    MARK: - Elements
    private var textView: UITextView = {
        let textView = UITextView()
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = .left
        textView.textColor = UIColor.lightGray
        textView.returnKeyType = .done
        textView.backgroundColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = true
        textView.addDoneButton(title: "Готово", target: self, selector: #selector(tapDone(sender:)))
        return textView
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textView.delegate = self
        textView.checkForViewDidload(descriptionText: viewModel.descriptionText,
                                     placeholder: viewModel.placeholderText)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayoutTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT DescriptionEventViewController")
    }
    
    //    MARK: - Navigation
    
    fileprivate func setupNavigation() {
        //  Set Action
        let nextButton = UIBarButtonItem(title: String.titleButtonNavBar.next.rawValue, style: .plain, target: self, action: #selector(goNext))
        let styleForDesible = navigationController?.setStyleActionTitleDesible()
        let styleForNormal = navigationController?.setStyleActionTitleNormal()
        nextButton.setTitleTextAttributes(styleForDesible, for: .disabled)
        nextButton.setTitleTextAttributes(styleForNormal,for: .normal)
        navigationItem.rightBarButtonItems = [nextButton]
        
        navigationController?.setupChild()
        navigationItem.title = String.headersUI.desriptionEvent.rawValue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: String.iconButtonNavBar.back.rawValue)?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(back)
        )
    }
    //    MARK: - Func objc
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func back(){
        print("back")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goNext() {
        print("Go Next")
        let contactsVC = ContactsEventViewController()
        navigationController?.pushViewController(contactsVC, animated: true)
    }
//    TextView Scroll
    @objc  func updateTextView(param: Notification) {
      let userInfo = param.userInfo
      
      guard let getKeyboard = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
      let getKeyboardRect = getKeyboard.cgRectValue
      let keyboardFrame = self.view.convert(getKeyboardRect, to: view.window)
      let heighShow = keyboardFrame.height - view.safeAreaInsets.bottom + 32
      
      if param.name == UIResponder.keyboardWillHideNotification {
//        textView.contentInset = UIEdgeInsets.zero
        textView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: heighShow, right: 16)
        textView.backgroundColor = .white
      } else {
        textView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: heighShow, right: 16)
        textView.backgroundColor = .bgBlue
        textView.scrollIndicatorInsets = textView.contentInset
      }
      let selectRange = textView.selectedRange
      textView.scrollRangeToVisible(selectRange)
    }
    
    //    MARK: - Private func
    //    Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.resignFirstResponder()
        self.textView.backgroundColor = .white
    }
    
    private func setLayoutTextView() {
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 24),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

extension DescriptionEventViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == viewModel.placeholderText {
            textView.text = nil
        }
        textView.styleStartWriting()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isReallyEmpty {
            textView.styleForEmpty()
            viewModel.didChengeDescription(text: nil)
        } else {
            viewModel.didChengeDescription(text: textView.text)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.didChengeDescription(text: textView.text)
    }
}


