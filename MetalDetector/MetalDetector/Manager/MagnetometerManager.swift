//
//  MagnetometerManager.swift
//  MetalDetector
//
//  Created by Byungwook Jeong on 2021/06/02.
//

import Foundation
import CoreMotion
import RxSwift
import RxCocoa

class MagnetometerManager {
    private let manager = CMMotionManager()
    var totalValue = BehaviorRelay<Double>(value: 0)
    
    init() {
        manager.deviceMotionUpdateInterval = 0.1
    }
    
    func startMagnetometer() {
        if manager.isMagnetometerAvailable {
            let operationQueue = OperationQueue()
            
            manager.startDeviceMotionUpdates(using: CMAttitudeReferenceFrame.xArbitraryCorrectedZVertical, to: operationQueue) { data, error in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                    self.manager.stopDeviceMotionUpdates()
                    return
                }
                
                guard let data = data else {
                    print("자력계 정보를 업데이트 할 수 없습니다.")
                    self.manager.stopDeviceMotionUpdates()
                    return
                }
                
                let magneticField = data.magneticField.field
                
                self.totalValue.accept(self.calcTotalValue(xValue: magneticField.x, yValue: magneticField.y, zValue: magneticField.z))
            }
        }
    }
    
    func stopMagnetometer() {
        manager.stopMagnetometerUpdates()
    }
    
    private func calcTotalValue(xValue: Double, yValue: Double, zValue: Double) -> Double {
        return sqrt(pow(xValue, 2.0) + pow(yValue, 2.0) + pow(zValue, 2.0))
    }
}

