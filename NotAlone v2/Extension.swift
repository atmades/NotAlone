//
//  Extension.swift
//  NotAlone v2
//
//  Created by Максим on 08.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIDatePicker

extension UIDatePicker {
    func checkVersionIOS() {
        if #available(iOS 14, *) {
            preferredDatePickerStyle = .inline
        } else {
            preferredDatePickerStyle = .compact
        }
    }
}
// MARK: - UITextView
extension UITextView {
    
//    add one button to KeyBoard
    func addDoneButton(title: String, target: Any, selector: Selector) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolBar.setItems([flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
//    Style of text for the writing
    func styleStartWriting() {
        self.textColor = .black
        self.layer.cornerRadius = 16

        
    }
    //    Style of text for empty textview and set plsh
    func styleForEmpty() {
        self.textColor = UIColor.lightGray
        self.layer.cornerRadius = 0
    }
    
    func styleForComplete(){
        self.textColor = .black
        self.backgroundColor = .white
        self.layer.cornerRadius = 0
    }
    
//     checking textView isempty for viewDidload
    func checkForViewDidload(descriptionText: String?, placeholder: String) {
        if let descriptionText = descriptionText {
            self.text = descriptionText
            self.styleForComplete()
        } else {
            self.styleForEmpty()
            self.text = placeholder
            self.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        }
    }
    
}
// MARK: - UIImageView
extension UIImageView {
    func round(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}

// MARK: - UIColor
extension UIColor {
//    Base Colors
    static let primary = UIColor(displayP3Red: 252/255, green: 73/255, blue: 47/255, alpha: 1.0)
    static let bgBlue = UIColor(displayP3Red: 247/255, green: 249/255, blue: 254/255, alpha: 1.0)
    static let divider = UIColor(displayP3Red: 230/255, green: 233/255, blue: 242/255, alpha: 1.0)
    
//    Text Colors
    static let textHeaderPuprle = UIColor(displayP3Red: 63/255, green: 33/255, blue: 125/255, alpha: 1.0)
    static let textype = UIColor(displayP3Red: 11/255, green: 11/255, blue: 11/255, alpha: 1.0)
    static let textHeaderDark = UIColor(displayP3Red: 75/255, green: 65/255, blue: 90/255, alpha: 1.0)
    static let textPlaceholder = UIColor(displayP3Red: 138/255, green: 141/255, blue: 171/255, alpha: 1.0)
    
    static let vkontakte = UIColor(displayP3Red: 75/255, green: 120/255, blue: 170/255, alpha: 1.0)
    static let facebook = UIColor(displayP3Red: 65/255, green: 100/255, blue: 180/255, alpha: 1.0)
    
//    Status Colors
    static let statusModeration = UIColor(displayP3Red: 252/255, green: 166/255, blue: 71/255, alpha: 1.0)
    static let statusRejected = UIColor(displayP3Red: 255/255, green: 110/255, blue: 110/255, alpha: 1.0)
    static let statusPublished = UIColor(displayP3Red: 81/255, green: 194/255, blue: 75/255, alpha: 1.0)
    static let statusArchived = UIColor(displayP3Red: 176/255, green: 176/255, blue: 176/255, alpha: 1.0)
}

// MARK: - UILabel

//  Change line spacing
extension UILabel {

    func setTextWithLineSpacing(
        label:UILabel,
        text:String,
        lineSpacing:CGFloat)
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing

        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))

        label.attributedText = attrString
    }
}

// MARK: - UIButton

// Change spasing betweet image and title
extension UIButton {
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
}

// Change letter spasing
extension UIButton {

    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedTitle(for: .normal) {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: self.titleLabel?.text ?? "")
                setTitle(.none, for: .normal)
            }

            attributedString.addAttribute(NSAttributedString.Key.kern,
                                           value: newValue,
                                           range: NSRange(location: 0,
                                                          length: attributedString.length))

            setAttributedTitle(attributedString, for: .normal)
        }

        get {
            if let currentLetterSpace = attributedTitle(for: .normal)?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}

// MARK: - String

extension String {
//    Check if string contains only spaces or newlinies
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    enum titleMainButton: String {
        case beginWithoutAutorization = "Начать без регистрации"
        case newEvent = "Создать событие"
        case exit = "Выйти"
        case changeName = "Изменить имя"
        case changeEmail = "Изменить почту"
        case changePhone = "Изменить телефон"
        case contactUs = "Написать нам"
        case donate = "Помочь нам"
        case tasks = "Задачи развития проекта"
        case addContact = "Добавить контакт"
    }
    
    enum titleButtonWithImage: String {
        case vkontakte = "Вконтакте"
        case facebook = "Facebook"
        
        case map = "Карта"
        case filters = "Чем я могу помочь"
        case settings = "Настройки"
        case showOnMap = "Посмотреть на карте"
    }
    
    enum iconButtonNavBar: String {
        case back = "back"
        case close = "close"
        case more = "more"
        case share = "share"
    }
    
    enum titleButtonNavBar: String {
        case next = "Далее"
    }

    enum headersUI: String {
        case chooseCategory = "Категория события"
        case myEvents = "Мои события"
        case desriptionEvent = "Описание события"
        case contacts = "Контакты"
        case dateAndTime = "Дата, время"
    }
    
    enum titleSegmentControl: String {
        case onMap = "На карте"
        case onList = "Списком"
    }
    
    enum placeholders: String {
        case descriptionEvent = "Укажите описание события"
    }
    
    enum fonts: String {
        case secondR = "RobotoSlab-Regular"
    }
    
    enum newEventContact: String {
        case nameHeader = "Имя"
        case namePlaceholder = "Укажите имя"
        case phoneHeader = "Телефон"
        case phonePlaceholder = "Укажите телефон"
        case emailHeader = "Email"
        case emailPlaceholder = "Укажите email"
        
        case useMyContact = "Использовать мои"
        case deleteContact = "Удалить"
        case deleteContactImageName = "deleteContact"
        
        case titleMainCell = "Основной"
        case titleAdditionalCell = "Дополнительный"
    }
    
    enum colors: String {
        //    Base Colors
        case primary = "primary"
        case bgBlue = "bgBlue"
        case divider = "divider"
        
        //    Text Colors
        case textHeaderPuprle = "textHeaderPuprle"
        case textHeaderDark = "textHeaderDark"
        case textPlaceholder = "textPlaceholder"
        case textype = "textype"
        case vkontakte = "vkontakte"
        case facebook = "facebook"
        
        //    Status Colors
        case statusModeration = "statusModeration"
        case statusRejected = "statusRejected"
        case statusPublished = "statusPublished"
        case statusArchived = "statusArchived"
    }
    
    enum images: String {
        case menuButton = "menu"
        
        case vkontacte = "iconVK"
        case facebook = "iconFb"
        
        case checkBoxOff = "Checkmarkempty"
        case checkBoxOn = "Checkmark"
    }
}

// MARK: - UIView

extension UIView {

    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func makeShadowed(view: UIView) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: view.bounds,
                                        cornerRadius: view.layer.cornerRadius).cgPath
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.fillColor = view.backgroundColor?.cgColor
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.1
        shadowLayer.shadowRadius = 8.0
        view.layer.insertSublayer(shadowLayer, at: 0)
    }
}

// MARK: - UINavigationController

extension UINavigationController {
    
    func setStyleActionTitleDesible()  -> [NSAttributedString.Key : NSObject] {
        let style = [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: UIFont(name: String.fonts.secondR.rawValue, size: 17)!]
        return style
    }
    
    func setStyleActionTitleNormal()  -> [NSAttributedString.Key : NSObject] {
        let style = [
            NSAttributedString.Key.foregroundColor: UIColor.primary,
            NSAttributedString.Key.font: UIFont(name: String.fonts.secondR.rawValue, size: 17)!]
        return style
    }
    
    func setStyleForLargeTitle() -> [NSAttributedString.Key : NSObject] {
        let style = [
            NSAttributedString.Key.foregroundColor: UIColor.textHeaderDark,
            NSAttributedString.Key.font: UIFont(name: String.fonts.secondR.rawValue, size: 24)!]
        return style
    }
    
    func setStyleForTitle() -> [NSAttributedString.Key : NSObject] {
        let style = [
            NSAttributedString.Key.foregroundColor: UIColor.textHeaderDark,
            NSAttributedString.Key.font: UIFont(name: String.fonts.secondR.rawValue, size: 17)!]
        return style
    }
    
    
    func setupIconBack(viewController: UIViewController, icon: String){
        let button = UIBarButtonItem()
//        backItem.title = "Lolo"
        let image = UIImage(named: icon)
        self.navigationBar.backIndicatorImage = image
        self.navigationBar.backIndicatorTransitionMaskImage = image
        self.navigationBar.tintColor = UIColor.textHeaderPuprle
        viewController.navigationItem.backBarButtonItem = button
        self.navigationBar.shadowImage = UIImage()

    }
    
    func setupBackground(){
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.barTintColor = UIColor.bgBlue
    }
    
//    Норм
    func setupTitles(text: String) {
        navigationBar.prefersLargeTitles = true
        navigationBar.topItem?.title = text
        let largeTittleStyle = [
            NSAttributedString.Key.foregroundColor: UIColor.textHeaderDark,
            NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Regular", size: 24)!
        ]
       navigationBar.largeTitleTextAttributes = largeTittleStyle
        
        let tittleStyle = [
            NSAttributedString.Key.foregroundColor: UIColor.textHeaderDark,
            NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Regular", size: 17)!
        ]
        navigationBar.titleTextAttributes = tittleStyle
        
    }
    
//    ?? не срабатывает прозрачный фон 
    func setupNavbarForChildVC() {
//        let icon = String.iconButtonNavBar.back.rawValue
//        navigationController?.setupIconBack(viewController: self, icon: icon)
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    
    func setupChild(){
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension UIViewController {
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, title: String, preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.backgroundColor = backgoundColor
            navBarAppearance.shadowColor = .clear // border
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
       
        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.barTintColor = backgoundColor
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.isTranslucent = false
            navigationItem.title = title
            
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
            navigationController?.navigationBar.shadowImage = UIImage()
        }
    }
}


// MARK: - Enums
enum ButtonsWithIconEnum {
    case vkontakte
    case facebook
}

enum SlideMenu {
    case map(name:String, icon: String)
    case filters(name:String, icon: String)
    case settings(name:String, icon: String)
    case showOnMap(name: String, icon: String)
}

enum StatusOfEvent {
    case statusModeration(name: String, color: UIColor)
    case statusRejected(name: String, color: UIColor)
    case statusPublished(name: String, color: UIColor)
    case statusArchived(name: String, color: UIColor)
}

enum ButtonImage {
    case showOnMap(name: String, icon: String)
}

enum Settings {
    case pushes(name: String, icon: String)
    case donate(name: String, icon: String)
    case about(name: String, icon: String)
    case legal(name: String, icon: String)
}
