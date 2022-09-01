//
//  GameViewController.swift
//  Accelerometer
//
//  Created by 藤井玖光 on 2022/09/01.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {

    
    @IBOutlet var awaImageView: UIImageView!
    let motionManeger = CMMotionManager()
    var accelerationX: Double = 0.0
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if motionManeger.isAccelerometerActive {
            motionManeger.accelerometerUpdateInterval = 0.01
            motionManeger.startAccelerometerUpdates(to: OperationQueue.current!) {
                data, error in
                
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                
                if self.awaImageView.frame.origin.x < 40 {
                    self.awaImageView.frame.origin.x = 40
                }
                
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
