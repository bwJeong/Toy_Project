//
//  ViewController.swift
//  RandomImage
//
//  Created by Byungwook Jeong on 2021/05/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.kf.indicatorType = .activity
        
        fetchPhoto()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.photoTapped))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGesture)
    }
    
    func fetchPhoto() {
        imgView.kf.setImage(
            with: URL(string: "http://picsum.photos/1024/1980"),
            options: [
                .forceRefresh,
                .transition(.fade(0.25)),
            ]
        )
    }

    @objc func photoTapped() {
        fetchPhoto()
    }
}

