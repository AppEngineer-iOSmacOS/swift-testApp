//
//  ViewController.swift
//  TestfulApp
//
//  Created by Nikolay Sozinov on 04.02.16.
//  Copyright © 2016 Nikolay Sozinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    
    
     @IBOutlet weak var test: TestView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        test.addUntitledAnimation()
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.8, target:self, selector: "myMetod1:", userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func myMetod1(timer: NSTimer){
        timer.invalidate()
    isSomeCustomThing()
    }

 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func isSomeCustomThing (){
        
        let toShow = self.storyboard?.instantiateViewControllerWithIdentifier("next2") as! ViewControllerNext2
        self.navigationController?.pushViewController(toShow, animated: false)
        print("test")
    }
}

