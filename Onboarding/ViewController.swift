//
//  ViewController.swift
//  Onboarding
//
//  Created by Training on 20/11/2016.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
        
    }
    
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThree = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descirptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [("rocket", "A Great Rocket Start", "Caramels cheesecake bonbon bonbon topping. Candy halvah cotton candy chocolate bar cake. Fruitcake liquorice candy canes marshmallow topping powder.", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descirptionFont),
                
                ("brush", "Design your Experience", "Caramels cheesecake bonbon bonbon topping. Candy halvah cotton candy chocolate bar cake. Fruitcake liquorice candy canes marshmallow topping powder.", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descirptionFont),
                
                ("notification", "Stay Up To Date", "Get notified of important updates.", "", backgroundColorThree, UIColor.white, UIColor.white, titleFont, descirptionFont)][index]
        
    
        
    }
    
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
      
    }
    
    
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
            }

        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: { 
                self.getStartedButton.alpha = 1
            })
        }
    }
    
    
    
    @IBAction func gotStarted(_ sender: Any) {
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(true, forKey: "onboardingComplete")
        
        userDefaults.synchronize()
        
    }
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

