//
//  Task1ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit
import SwiftUI

/// UILabel is not visible even though constraints are set. Fix the issue.
final class Task1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "Label here"
        label.backgroundColor = .white

        label.translatesAutoresizingMaskIntoConstraints = false // Without this line UIKit uses the default autoresizing mask which conflicts with manual constraints
        view.addSubview(label)
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
    }
}

struct Task1ViewController_Previews: PreviewProvider {
    static var previews: some View {
        Task1ViewController().asSwiftUIView()
    }
}
//#Preview {
//    Task1ViewController()
//}
