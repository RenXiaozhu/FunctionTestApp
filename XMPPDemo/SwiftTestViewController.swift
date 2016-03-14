//
//  SwiftTestViewController.swift
//  XMPPDemo
//
//  Created by Hexun pro on 15/7/6.
//  Copyright (c) 2015年 Hexun. All rights reserved.
//

import Foundation

struct ViewBtn {
    var testBtn = UIButton()
    
}

class SwiftTestViewController: UIViewController {
    var btn:UIButton = UIButton()
    var tbnt:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor.whiteColor()
        
        var bt = ViewBtn()
        bt.testBtn.frame = CGRectMake(0, 0, 0, 0)
        
        var btn = UIButton()
        btn.frame = CGRectMake(100, 200 , 100 , 100)
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action:Selector(doAnyThing()),forControlEvents:UIControlEvents.TouchUpInside)
        btn.layer.cornerRadius = 10
        self.view.addSubview(btn)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func doAnyThing(){
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
