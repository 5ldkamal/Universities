
//
//  LoaderView.swift
//
//
//  Created by Khaled Kamal on 20/05/2024.
//

import UIKit

public final class LoaderView: UIViewController {
    public static var shared = LoaderView()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .black
        view.alpha = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackContainer: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loadingLabel: UILabel = {
        var view = UILabel()
        view.text = NSLocalizedString("Loading...", comment: "")
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 18)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let activityIndicator = {
        var view: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            view = UIActivityIndicatorView(style: .large)
        } else {
            view = UIActivityIndicatorView()
        }
        view.color = .white
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private weak var viewController: UIViewController?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        configureContainerView()
        
        configureStackContainer()
        
        configureLoadingLabel()
        
        configureActivityIndicator()
    }
}

// MARK: - Container View

extension LoaderView {
    private func configureContainerView() {
        view.addSubview(containerView)
        
        let width = containerView.widthAnchor.constraint(equalToConstant: 2 * view.frame.width / 3)
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: width.constant / 2),
            width
            
        ])
    }
}

// MARK: - StackContainer

extension LoaderView {
    private func configureStackContainer() {
        containerView.addSubview(stackContainer)
        
        NSLayoutConstraint.activate([
            stackContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            stackContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
            
        ])
    }
}

// MARK: - StackContainer

extension LoaderView {
    private func configureLoadingLabel() {
        NSLayoutConstraint.activate([
            loadingLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        stackContainer.addArrangedSubview(loadingLabel)
    }
}

// MARK: - ActivityIndicator

extension LoaderView {
    private func configureActivityIndicator() {
        stackContainer.addArrangedSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
}

// MARK: - Showing and dismiss

public extension LoaderView {
    func showLoader(on viewController: UIViewController?) {
        self.viewController = viewController
        viewController?.view.isUserInteractionEnabled = false
        
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        
        DispatchQueue.main.async {
            self.viewController?.present(self, animated: true, completion: nil)
        }
 
    }
    
    func dismissLoader(completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.viewController?.view.isUserInteractionEnabled = true
            self.viewController?.dismiss(animated: true, completion: completion)
        }

    }
}
