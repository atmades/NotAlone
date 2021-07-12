//
//  EventContactsCell.swift
//  NotAlone v2
//
//  Created by Максим on 18.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

enum EventContactsCellType {
    case main
    case contact
}

protocol EventContactsCellDelegate: AnyObject {
    func didDeleteTap(index: Int)
    func didUseMyContactsTap()
    func didNameChanged(name: String, index: Int)
    func didPhoneChanged(phone: String, index: Int)
    func didEmailChanged(email: String, index: Int)
}

class EventContactsCell: UITableViewCell {
    
    // MARK: - Proiperties
    private var cellType: EventContactsCellType = .contact
    private var index = 0
    
    private let titleMainCell = String.newEventContact.titleMainCell.rawValue.uppercased()
    private let titleAdditionalCell = String.newEventContact.titleAdditionalCell.rawValue.uppercased()
    private let nameHeader = String.newEventContact.nameHeader.rawValue
    private let namePlaceholder = String.newEventContact.namePlaceholder.rawValue
    private let phoneHeader = String.newEventContact.phoneHeader.rawValue
    private let phonePlaceholder = String.newEventContact.phonePlaceholder.rawValue
    private let emailHeader = String.newEventContact.emailHeader.rawValue
    private let emailPlaceholder = String.newEventContact.emailPlaceholder.rawValue
    private let titleUseMyContact = String.newEventContact.useMyContact.rawValue
    private let titleDelete = String.newEventContact.deleteContact.rawValue
    
    // MARK: - Appearance
    private let heightOfTextView: CGFloat = 60
    weak var delegate: EventContactsCellDelegate?
    
//    MARK: - Outlets
    @IBOutlet weak var widthButton: NSLayoutConstraint!
    
    @IBOutlet weak var headerStackView: UIStackView! {
        didSet {
            headerStackView.backgroundColor = .bgBlue
            headerStackView.isLayoutMarginsRelativeArrangement = true
            headerStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 4)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
            didSet {
                titleLabel.font = UIFont.boldSystemFont(ofSize: 11.0)
                titleLabel.textColor = .textHeaderPuprle
            }
        }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.tintColor = .red
            button.titleLabel?.textAlignment = .right
        }
    }
    
    @IBOutlet weak var textFieldsStackView: UIStackView! {
        didSet {
            textFieldsStackView.addArrangedSubview(nameView)
            textFieldsStackView.addArrangedSubview(phoneView)
            textFieldsStackView.addArrangedSubview(emailView)
            textFieldsStackView.isLayoutMarginsRelativeArrangement = true
            textFieldsStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0)
        }
    }
    
    @IBOutlet weak var botomView: UIView! {
        didSet {
            botomView.backgroundColor = .bgBlue
        }
    }
    
    //    MARK: - Elements
    
    private lazy var nameView: TextFieldView = {
        let view = TextFieldView()
        view.setupView(header: nameHeader, placeholder: namePlaceholder)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: heightOfTextView).isActive = true
        view.addshape(heightOfView: heightOfTextView)
        view.delegate = self
        return view
    }()
    
    private lazy var phoneView: TextFieldView = {
        let view = TextFieldView()
        view.setupView(header: phoneHeader,placeholder: phonePlaceholder)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: heightOfTextView).isActive = true
        view.addshape(heightOfView: heightOfTextView)
        view.delegate = self
        return view
    }()
    
    private lazy var emailView: TextFieldView = {
        let view = TextFieldView()
        view.setupView(header: emailHeader, placeholder: emailPlaceholder)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: heightOfTextView).isActive = true
        view.addshape(heightOfView: heightOfTextView)
        view.delegate = self
        return view
    }()
    
    //    MARK: - Static
    static let identifier = "EventContactsCell"
    static func nib() -> UINib {
        return UINib(nibName: "EventContactsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = UITableViewCell.SelectionStyle.none
    }
    //    MARK: - Public Func
    public func setup(contact: Contact, index: Int, type: EventContactsCellType) {
        self.index = index
        self.cellType = type
        
        switch type {
        case .main:
            titleLabel.text = titleMainCell
            button.setTitle(titleUseMyContact, for: .normal)
            button.setImage(nil, for: .normal)
            button.semanticContentAttribute = .forceLeftToRight
            button.setInsets(forContentPadding: .init(top: 0, left: 0, bottom: 0, right: 0), imageTitlePadding: 0)
            widthButton.constant = 136
        case .contact:
            titleLabel.text = titleAdditionalCell
            button.setTitle(titleDelete, for: .normal)
            let image = UIImage(named: String.newEventContact.deleteContactImageName.rawValue)
            button.setImage(image, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
            button.setInsets(forContentPadding: .init(top: 0, left: 0, bottom: 10, right: 0), imageTitlePadding: -8)
            widthButton.constant = 96
        }
        
        nameView.setupContent(content: contact.name)
        phoneView.setupContent(content: contact.phone)
        emailView.setupContent(content: contact.email)
    }

    //    MARK: - Action
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch cellType {
        case .main:
            delegate?.didUseMyContactsTap()
        case .contact:
            delegate?.didDeleteTap(index: index)
        }
    }
}

extension EventContactsCell: TextFieldViewDelegate {
    func textChanged(_ textFieldView: TextFieldView, text: String) {
        switch textFieldView {
        case nameView:
            delegate?.didNameChanged(name: text, index: index)
        case phoneView:
            delegate?.didPhoneChanged(phone: text, index: index)
        case emailView:
            delegate?.didEmailChanged(email: text, index: index)
        default:
            break
        }
    }
}
