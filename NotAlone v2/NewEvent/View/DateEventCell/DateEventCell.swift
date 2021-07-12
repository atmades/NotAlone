//
//  DateEventCell.swift
//  NotAlone v2
//
//  Created by Максим on 05.06.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol DateEventCellDelegate: AnyObject {
    func didDateChanged(date: String)
    func didStartTimeChanged(time: String)
    func didEndTimeChanged(time: String)
}


class DateEventCell: UITableViewCell {
    
    // MARK: - Proiperties
    
    private let dateHeader = String.newEventContact.nameHeader.rawValue
    private let datePlaceholder = String.newEventContact.namePlaceholder.rawValue
    private let startTimeHeader = String.newEventContact.nameHeader.rawValue
    private let startTimePlaceholder = String.newEventContact.namePlaceholder.rawValue
    private let endTimeHeader = String.newEventContact.nameHeader.rawValue
    private let endTimePlaceholder = String.newEventContact.namePlaceholder.rawValue
    
    // MARK: - Appearance
    private let heightOfTextView: CGFloat = 60
    weak var delegate: DateEventCellDelegate?
    
    //    MARK: - Outlets
    @IBOutlet weak var textFieldsStackView: UIStackView! {
        didSet {
            textFieldsStackView.addArrangedSubview(dateView)
            textFieldsStackView.addArrangedSubview(timeStackView)
            textFieldsStackView.isLayoutMarginsRelativeArrangement = true
            textFieldsStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0)
        }
    }
    
    //    MARK: - Elements
    
    private lazy var dateView: TextFieldView = {
        let view = TextFieldView()
        view.setupViewDatePicker(header: dateHeader, placeholder: datePlaceholder,
                                 datePicker: datePicker, toolBar: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: heightOfTextView).isActive = true
        view.addshape(heightOfView: heightOfTextView)
        view.delegate = self
        view.delegateDatePicker = self
        return view
    }()
    
    private lazy var startTimeView: TextFieldView = {
        let view = TextFieldView()
        view.setupView(header: startTimeHeader, placeholder: startTimePlaceholder)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: heightOfTextView).isActive = true
        view.addshape(heightOfView: heightOfTextView)
        view.delegate = self
        return view
    }()
    
    private lazy var endTimeView: TextFieldView = {
        let view = TextFieldView()
        view.setupView(header: endTimeHeader, placeholder: endTimePlaceholder)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: heightOfTextView).isActive = true
        view.addshape(heightOfView: heightOfTextView)
        view.delegate = self
        return view
    }()
    
    private lazy var timeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.addArrangedSubview(startTimeView)
        stackView.addArrangedSubview(endTimeView)
        return stackView
    }()

    //    MARK: - Static
    static let identifier = "DateEventCell"
    static func nib() -> UINib {
        return UINib(nibName: "DateEventCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = UITableViewCell.SelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //    MARK: -  Func
    
    private lazy var toolBarDate: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .red
        toolBar.tintColor = .yellow
        let doneButton = UIBarButtonItem(title: "Закрыть", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tapDone))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton,doneButton], animated: true)
        return toolBar
    }()
    
    
    
    @objc func tapDone() {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        let text = formatter.string(from: datePicker.date)
//
//        brdDateTextfield.text = "\(text)"
//        self.view.endEditing(true)
    }
    
//    MARK: - DATE PICKERS
    
//    For Date
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
//        datePicker.backgroundColor = .yellow
//        datePicker.tintColor = .brown
//        datePicker.tintColorDidChange()
        
        let currentDate = Date()
        let calendar = Calendar.current
        var minDateComponent = calendar.dateComponents([.day], from: Date())
        minDateComponent.day = calendar.component(.day, from: currentDate) + 1
        
        var maxDateComponent = calendar.dateComponents([.year], from: Date())
        maxDateComponent.year = calendar.component(.year, from: currentDate) + 2
        
        let maxDate = calendar.date(from: maxDateComponent)
        let minDate = calendar.date(from: minDateComponent)
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        datePicker.checkVersionIOS()
        return datePicker
    }()
    
    private func formatterDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let text = formatter.string(from: date)
        return text
    }

}

extension DateEventCell: TextFieldViewDelegate {
    func textChanged(_ textFieldView: TextFieldView, text: String) {
        switch textFieldView {
        case dateView:
            delegate?.didDateChanged(date: text)
        case startTimeView:
            delegate?.didStartTimeChanged(time: text)
        case endTimeView:
            delegate?.didEndTimeChanged(time: text)
        default:
            break
        }
    }
}

extension DateEventCell: TextFieldDatePickerViewDelegate {
    func setDatePiker(_ textFieldView: TextFieldView) {
        
        switch textFieldView {
        case dateView:
            let text = formatterDate(date: datePicker.date)
            print(text)
        default:
            break
        }
    }
    
    
}
















