//
//  AFile.swift
//  AccesLevels
//
//  Created by ryo on 2020/04/28.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation

class AClass {
    
    //Global variables, also called class properties.
    private var aPrivateProperty = "private property"
    
    fileprivate var aFilePrivateProperty = "fileprivate property"
    
    var anInternalProperty = "internal property"
    
    func methodA () {
        
        var aLocalVariable = "local variable"
        
        //Step 1. Try to print aLocalVariable Here - Possible
        //print("\(aLocalVariable) printed from methodA in AClass")
        
        //Step 3. Try to print aPrivateProperty Here
        print("Step 3 可能：\(aPrivateProperty)")
        
        //Step 6. Try to print aFilePrivateProperty Here
        print("Step 6 可能：\(aFilePrivateProperty)")
        
        
        //Step 9. Try to print anInternalProperty Here
        print("Step 9 可能：\(anInternalProperty)")

    }
    
    func methodB () {
        
        //Step 2. Try to print aLocalVariable Here
        // 不可能
        
        //Step 4. Try to print aPrivateProperty Here
        print("Step 4 可能：\(aPrivateProperty)")
    }
    
}

class AnotherClassInTheSameFile {
    let aclass = AClass()
    init() {
        
        //Step 5. Try to print aPrivateProperty Here
        // 不可能
        
        //Step 7. Try to print aFilePrivateProperty Here
        print("Step 7 可能：\(aClass.aFilePrivateProperty)")
    }
}

