//
//  ViewController.swift
//  MetalDetector
//
//  Created by Byungwook Jeong on 2021/06/02.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let magnetometerManager = MagnetometerManager()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        magnetometerManager.totalValue
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)
        
        magnetometerManager.startMagnetometer()
    }
}

