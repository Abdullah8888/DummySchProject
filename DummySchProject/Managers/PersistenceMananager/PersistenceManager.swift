//
//  PersistenceManager.swift
//  DummySchProject
//
//  Created by babatundejimoh on 13/06/2021.
//

import Foundation
import MagicalRecord

public class PersistenceManager: NSObject {
    
    public static let sharedManager = PersistenceManager()
    
    public func setupDataStack() {
        MagicalRecord.setupCoreDataStack(withStoreNamed: "DummySchProjectModel")
        
    }
    
    //MARK: OnBoarding Screen
    public func isBoardingScreenShown() -> Bool {
        guard let isShown = OnBoardingScreen.mr_findFirst()?.isShown else {
            return false
        }
        return isShown
    }
    
    public func updateBoardingScreen(isShown: Bool) {
        OnBoardingScreen.mr_createEntity()?.isShown = isShown
        self.saveContext()
    }
    
    public func saveContext() {
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    public func clearOnBoardingScreenData() {
        OnBoardingScreen.mr_truncateAll()
        self.saveContext()
    }
}
