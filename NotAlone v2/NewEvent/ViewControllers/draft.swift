//
//import UIKit
//
//class DescriptionEventViewController: UIViewController {
//
//
//    private var textView: UITextView = {
//        let textView = UITextView()
//        textView.contentInsetAdjustmentBehavior = .automatic
//        textView.textAlignment = .left
//        textView.textColor = UIColor.lightGray
//        textView.returnKeyType = .done
//        textView.backgroundColor = UIColor.white
//        textView.font = UIFont.systemFont(ofSize: 16)
//        textView.isEditable = true
//        textView.text = String.placeholders.descriptionEvent.rawValue
////        textView.addDoneButton(title: "Готово", target: self, selector: #selector(tapDone(sender:)))
//        return textView
//    }()
//
//    @objc func tapDone(sender: Any) {
//        self.view.endEditing(true)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        textView.delegate = self
////        setupTapGestures()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        setLayoutTextView()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setupNavigation()
//    }
//
//    deinit {
//        print("DEINIT DescriptionEventViewController")
//    }
//
//    //    MARK: - Navigation
//
//    fileprivate func setupNavigation() {
//        //  Set Action
//        let nextButton = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(goNext))
//
//        let actionTitleStyleDisables = [
//            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
//            NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Regular", size: 17)!]
//
//        let actionTitleStyleNormal = [
//            NSAttributedString.Key.foregroundColor: UIColor.primary,
//            NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Regular", size: 17)!]
//
//        nextButton.setTitleTextAttributes(actionTitleStyleDisables, for: .disabled)
//        nextButton.setTitleTextAttributes(actionTitleStyleNormal, for: .normal)
//        navigationItem.rightBarButtonItems = [nextButton]
//
//
//        navigationController?.setupChild()
//        navigationItem.title = "Описание события"
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(named: String.iconButtonNavBar.back.rawValue)?.withRenderingMode(.alwaysOriginal),
//            style: .plain,
//            target: self,
//            action: #selector(back)
//        )
//    }
//    //    MARK: - Func for navigationbar
//    @objc func back(){
//        print("back")
//        navigationController?.popToRootViewController(animated: true)
//    }
//
//    @objc func goNext() {
//        print("Go Next")
//    }
//
//    //    MARK: - Private func
//    //    Hide keyboard
////        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////            self.textView.resignFirstResponder()
////            self.textView.backgroundColor = .white
////        }
//
//    //  Hide Keyboard with Tap on View
////    fileprivate func setupTapGestures() {
////        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
////        view.addGestureRecognizer(gesture)
////    }
////
////    @objc fileprivate func handleTapDismiss() {
////        self.view.endEditing(true)  // dismiss keyboard
////    }
//
//    private func setLayoutTextView() {
//        view.addSubview(textView)
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
//            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 24),
//            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
//        ])
//    }
//}
//
//extension DescriptionEventViewController: UITextViewDelegate {
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == String.placeholders.descriptionEvent.rawValue {
//            textView.text = ""
//            textView.textColor = UIColor.black
//            textView.font = UIFont(name: "verdana", size: 18.0)
//        }
//    }
//
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder()
//        }
//        return true
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text == "" {
//            textView.text = String.placeholders.descriptionEvent.rawValue
//            textView.textColor = UIColor.lightGray
//            textView.font = UIFont(name: "verdana", size: 13.0)
//        }
//    }
//}
//
//
//
//extension UITextView {
//
//    func addDoneButton(title: String, target: Any, selector: Selector) {
//
//        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
//                                              y: 0.0,
//                                              width: UIScreen.main.bounds.size.width,
//                                              height: 44.0))//1
//        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
//        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
//        toolBar.setItems([flexible, barButton], animated: false)//4
//        self.inputAccessoryView = toolBar//5
//    }
//}
//
