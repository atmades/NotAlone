//
//  MainViewController.swift
//  NotAlone v2
//
//  Created by Максим on 29.12.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //    MARK: - Outlets
    @IBOutlet weak var segmentControl: HBSegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewForSegmentController: UIView! {
        didSet { viewForSegmentController.backgroundColor = .clear }
    }
    
    @IBOutlet weak var menuView: UIView! {
        didSet { menuView.backgroundColor = .green }
    }
    
    func shadowMenuOn() {
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowRadius = 20
        menuView.layer.shadowOpacity = 0.3
    }
    func shadowMenuOf() {
        menuView.layer.shadowColor = UIColor.clear.cgColor
        menuView.layer.shadowRadius = 0
        menuView.layer.shadowOpacity = 0
    }
    
    @IBOutlet weak var shadowOfMenuView: UIView!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftContstraintShadowView: NSLayoutConstraint!
    
    //    MARK: - Property
    
    private var mapVC = MapViewController()
    private lazy var listVC = ListViewController()
    private lazy var menuVC = MenuViewController()
    
    //    Configurations
    private lazy var widthOfMenu: CGFloat = menuView.frame.size.width
    private lazy var limitOfMenuPosition: CGFloat = self.view.frame.size.width / 4
    private lazy var widthOfShadowMenu: CGFloat = -shadowOfMenuView.frame.size.width
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVC.delegate = self
        listVC.delegateToDetail = self
        setupSegmentControl()
        addGestures()
        
        trailingConstraint.constant = widthOfMenu
        leftContstraintShadowView.constant = widthOfShadowMenu
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.frame = view.bounds
        checkSegmentControlPosition()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addChildVC()
    }
    
    deinit {
        print("DEINIT MainController")
    }
    
    //    MARK: - FilePrivate
    fileprivate func addChildVC() {
        
        addChild(mapVC)
        addChild(listVC)
        addChild(menuVC)
        scrollView.addSubview(mapVC.view)
        scrollView.addSubview(listVC.view)
        menuView.addSubview(menuVC.view)
        
        mapVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        listVC.view.frame = CGRect(x: scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        menuVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        mapVC.didMove(toParent: self)
        listVC.didMove(toParent: self)
        menuVC.didMove(toParent: self)
    }
    
    //    MARK: - Actions
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        if trailingConstraint.constant == 0 {
            closeViewAnimation()
        } else {
            showViewAnimation()
        }
    }
}

// MARK: - Extension for SegmentControl

extension MainViewController {
    
    fileprivate func setupSegmentControl() {
        let firstTitle = String.titleSegmentControl.onMap.rawValue
        let secondTitle = String.titleSegmentControl.onList.rawValue
        
        segmentControl.items = [firstTitle, secondTitle]
        //        segmentControl.font = UIFont(name: "RobotoSlab-Light", size: 15)
        segmentControl.font = .systemFont(ofSize: 14)
        segmentControl.borderColor = UIColor(white: 1.0, alpha: 0.3)
        segmentControl.selectedIndex = 0
        segmentControl.padding = 0
        segmentControl.addTarget(self, action: #selector(MainViewController.segmentValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func segmentValueChanged(_ sender: AnyObject?){
        if segmentControl.selectedIndex == 0 {
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            scrollView.setContentOffset(CGPoint(x: view.frame.size.width,y: 0), animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkSegmentControlPosition() {
        if segmentControl.selectedIndex == 0 {
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            scrollView.setContentOffset(CGPoint(x: view.frame.size.width,y: 0),
                                        animated: true)
        }
    }
}

//    MARK: - EXTENSION for VC Gestures Actions Func

extension MainViewController {
    
    fileprivate func addGestures() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(sender:)))
        menuView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        shadowOfMenuView.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func panGestureAction(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            handleChanged(sender: sender)
        case .ended:
            handleEnded()
        default:
            ()
        }
    }
    
    @objc fileprivate func tapGestureAction(){
        closeViewAnimation()
    }
    
    //    MARK: - EXTENSION FilePrivate Func For Gestures
    
    fileprivate func showViewAnimation() {
        trailingConstraint.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            self.shadowMenuOn()
            self.leftContstraintShadowView.constant = 0
        }
    }
    
    fileprivate func closeViewAnimation() {
        trailingConstraint.constant = widthOfMenu
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.shadowMenuOf()
        }
        DispatchQueue.main.async {
            self.leftContstraintShadowView.constant = self.widthOfShadowMenu
        }
    }
    
    fileprivate func handleEnded() {
        trailingConstraint.constant = trailingConstraint.constant < limitOfMenuPosition ? widthOfMenu : 0
        if trailingConstraint.constant < limitOfMenuPosition {
            closeViewAnimation()
        } else {
            showViewAnimation()
        }
    }
    
    fileprivate func handleChanged(sender:UIPanGestureRecognizer ) {
        if trailingConstraint.constant == widthOfMenu {
            if sender.location(in: menuView).x < 30 {
                return
            }
        }
        if sender.location(in: self.view).x <= widthOfMenu {
            trailingConstraint.constant = widthOfMenu - widthOfMenu / 0.8 + sender.location(in: self.view).x
            if trailingConstraint.constant > 5 {
                self.leftContstraintShadowView.constant = self.widthOfShadowMenu
            } else {
                self.leftContstraintShadowView.constant = 0
            }
        }
    }
}
//    MARK: - EXTENSION Delegate from Menu
extension MainViewController: MenuViewControllerDelegate {
    func toMapPressed() {
        print("to Map pressed")
    }
    
    func toFiltersPressed() {
        let filterslVC = FiltersViewController()
        let navVC = UINavigationController(rootViewController: filterslVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    func toSettingsPressed() {
        let settingslVC = SettingsViewController()
        let navVC = UINavigationController(rootViewController: settingslVC)
        
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    func avatarPressed() {
        print("avatar pressed from vc")
    }
    
    func createNewEvent() {
        print("new event pressed from vc")
        let newEventVC = ChooseCategoryEventViewController()
        let navVC = UINavigationController(rootViewController: newEventVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    func toProfilePressed() {
        let profileVC = ProfileViewController()
        let navVC = UINavigationController(rootViewController: profileVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}

//    MARK: - EXTENSION Delegate from List
extension MainViewController: ListToDetail {
    
    func cellPressed(with model: Event) {
        let detailVC = DetailViewController()
        detailVC.event = model
        
        let navVC = UINavigationController(rootViewController: detailVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
