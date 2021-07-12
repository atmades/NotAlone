//
//  TextFieldInfoView.swift
//  NotAlone v2
//
//  Created by Максим on 17.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol TextFieldDatePickerViewDelegate: AnyObject {
    func setDatePiker(_ textFieldView: TextFieldView)
}

protocol TextFieldViewDelegate: AnyObject {
    func textChanged(_ textFieldView: TextFieldView, text: String)
}

class TextFieldView: UIView {
    
    let pagging: CGFloat = 16
    weak var delegate: TextFieldViewDelegate?
    weak var delegateDatePicker: TextFieldDatePickerViewDelegate?
    
    //    MARK: - UI Elements
    private lazy var textField: UITextField = {
        let textField = TextFieldCustom()
        textField.placeholder = "Placeholder"
        textField.delegate = self
        return textField
    }()
    
    private lazy var header: UILabel = {
        let label = UILabel()
        label.textColor = .textype
        label.alpha = 0.7
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = "Header"
        return label
    }()
    
    
    //    MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
 
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Public Func
    public func setupView(header: String, placeholder: String ) {
        self.header.text = header
        self.textField.placeholder = placeholder
    }
    
    public func setupViewDatePicker(header: String, placeholder: String,
                                    datePicker: UIDatePicker, toolBar: UIToolbar? ) {
        self.header.text = header
        self.textField.placeholder = placeholder
        self.textField.inputView = datePicker
        self.textField.inputAccessoryView = toolBar
    }
    
    public func setupContent(content: String?) {
        self.textField.text = content
    }
    public func clearContent() {
        self.textField.text = nil
    }
    
    //    Add  line
    public func addshape(heightOfView: CGFloat) {
        let y = heightOfView - 1
        let fromX = pagging
        let toX: CGFloat = UIScreen.main.bounds.width - pagging
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: fromX, y: y))
        path.addLine(to: CGPoint(x: toX, y: y))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.divider.cgColor
        shapeLayer.lineWidth = 1
        self.layer.addSublayer(shapeLayer)
    }
    
    //    MARK: - Private Func
    
    private func setupLayout() {
        [textField, header].forEach { (v) in
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)
        }
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            header.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            textField.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: header.trailingAnchor),
//            textField.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

extension TextFieldView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let newString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return false }
        delegate?.textChanged(self, text: newString)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != nil || !textField.text!.isEmpty {
            delegateDatePicker?.setDatePiker(self)
        }
    }
        
//        if textField.text == nil || textField.text!.isEmpty {
//          let formatter = DateFormatter()
//          formatter.dateStyle = .medium
//          formatter.timeStyle = .medium
//          textField.text = formatter.string(from: Date())
//        }
}
