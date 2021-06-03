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
    @IBOutlet weak var totalValueLabel: UILabel!
    
    let magnetometerManager = MagnetometerManager()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        magnetometerManager.totalValue
            .observe(on: MainScheduler.instance)
            .bind { [weak self] totalValue in
                self?.view.backgroundColor = UIColor(
                    red: totalValue > 500 ? 1.0 : CGFloat(totalValue / 500),
                    green: totalValue > 500 ? 0 : CGFloat(1 - totalValue / 500),
                    blue: 0,
                    alpha: 1
                )
                self?.totalValueLabel.text = String(format: "%.1f", totalValue)
            }
            .disposed(by: disposeBag)

        magnetometerManager.startMagnetometer()
    }
}

