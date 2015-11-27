//
//  MenuViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 25/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {
    
    private weak var delegate: MenuViewControllerDelegate?
    
    init(delegate: MenuViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = MenuView(delegate: self)
    }
    
    // MARK: MenuViewDelegate
    
    func menuViewDidTapResume(menuView: MenuView) {
        self.dismissViewControllerAnimated(true) {
            self.delegate?.menuViewControllerDidResumeGame(self)
        }
    }
    
    func menuViewDidTapNewGame(menuView: MenuView) {
        self.dismissViewControllerAnimated(true) {
            self.delegate?.menuViewControllerDidTapNewGame(self)
        }
    }
    
    func menuViewDidTapQuit(menuView: MenuView) {
        self.dismissViewControllerAnimated(true) {
            self.delegate?.menuViewControllerDidTapQuit(self)
        }
    }
    
}

// MARK: - Delegate

protocol MenuViewControllerDelegate: class {
    
    func menuViewControllerDidResumeGame(menuViewController: MenuViewController)
    func menuViewControllerDidTapNewGame(menuViewController: MenuViewController)
    func menuViewControllerDidTapQuit(menuViewController: MenuViewController)
    
}
