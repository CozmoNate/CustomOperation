//
//  OperationQueue+AsyncOperation.swift
//  AsyncOperation
//
//  Created by Natan Zalkin on 01/08/2019.
//  Copyright © 2019 Natan Zalkin. All rights reserved.
//

/*
* Copyright (c) 2019 Natan Zalkin
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
*/

import Foundation

extension OperationQueue {

    /// Add opertaion to queue that reports finished when called provided completion block
    /// - Parameter action: An action with completion
    @discardableResult
    public func addOperation(action: @escaping AsyncOperation.Action) -> Operation {

        let operation = AsyncOperation(execute: action)
        
        addOperation(operation)

        return operation
    }

    /// Add opertaion to queue and run action asynchronousely on provided DispatchQueue
    /// - Parameter action: An action to execute
    @discardableResult
    public func addOperation(asyncOn queue: DispatchQueue, action: @escaping () -> Void) -> Operation {

        let operation = AsyncOperation { completion in
            queue.async {
                action()
                completion()
            }
        }
        
        addOperation(operation)

        return operation
    }
    
    /// Add opertaion to queue and run action asynchronousely on provided DispatchQueue.
    /// Report operationfinished by calling provided completion block
    /// - Parameter action: An action to execute
    @discardableResult
    public func addOperation(asyncOn queue: DispatchQueue, action: @escaping AsyncOperation.Action) -> Operation {

        let operation = AsyncOperation { completion in
            queue.async { action(completion) }
        }
        addOperation(operation)

        return operation
    }
    
    /// Add opertaion to queue and run action synchronousely on provided DispatchQueue
    /// - Parameter action: An action to execute
    @discardableResult
    public func addOperation(syncOn queue: DispatchQueue, action: @escaping () -> Void) -> Operation {

        let operation = AsyncOperation { completion in
            queue.sync {
                action()
                completion()
            }
        }
        
        addOperation(operation)

        return operation
    }
    
    /// Add opertaion to queue and run action synchronousely on provided DispatchQueue.
    /// Report operationfinished by calling provided completion block
    /// - Parameter action: An action to execute
    @discardableResult
    public func addOperation(syncOn queue: DispatchQueue, action: @escaping AsyncOperation.Action) -> Operation {

        let operation = AsyncOperation { completion in
            queue.sync { action(completion) }
        }
        addOperation(operation)

        return operation
    }

}
