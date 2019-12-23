//
//  CustomOperation.swift
//  AsyncOperation
//
//  Created by Natan Zalkin on 31/07/2019.
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

open class CustomOperation: Operation {

    public enum State {
        case initial
        case ready
        case executing
        case finished
    }

    override open var isReady: Bool {
        return isReadyValue
    }

    override open var isExecuting: Bool {
        return isExecutingValue
    }

    override open var isFinished: Bool {
        return isFinishedValue
    }

    open var state: State = .initial {
        didSet {
            switch state {

            case .initial:
                isReadyValue = false
                isExecutingValue = false
                isFinishedValue = false

            case .ready:
                isReadyValue = true
                isExecutingValue = false
                isFinishedValue = false

            case .executing:
                isExecutingValue = true
                isFinishedValue = false

            case .finished:
                isExecutingValue = false
                isFinishedValue = true
            }
        }
    }

    private var isExecutingValue: Bool = false {
        willSet { if isExecuting != newValue { willChangeValue(forKey: "isExecuting") } }
        didSet { if isExecuting != oldValue { didChangeValue(forKey: "isExecuting") } }
    }
    private var isFinishedValue: Bool = false {
        willSet { if isFinished != newValue { willChangeValue(forKey: "isFinished") } }
        didSet { if isFinished != oldValue { didChangeValue(forKey: "isFinished") } }
    }
    private var isReadyValue: Bool = false {
        willSet { if isReady != newValue { willChangeValue(forKey: "isReady") } }
        didSet { if isReady != oldValue { didChangeValue(forKey: "isReady") } }
    }
    
    public init(isReady: Bool = true) {
        super.init()

        if isReady { state = .ready }
    }

    override open func main() {
        guard !isCancelled else {
            state = .finished
            return
        }
        
        state = .executing
        
        main()
    }

    open func finish() {
        state = .finished
    }
}
