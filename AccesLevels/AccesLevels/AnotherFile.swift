//
//  AnotherFile.swift
//  AccesLevels
//
//  Created by ryo on 2020/04/28.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation

class AnotherClassInAnotherFile {
    
    let afile = AClass()
    
    init() {
        
        //Step 8. Try to print aFilePrivateProperty Here
        
        //Step 10. Try to print anInternalProperty Here
        print("Step 10 可能：\(afile.anInternalProperty)")

    }
    
}
