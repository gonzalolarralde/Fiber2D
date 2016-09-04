//
//  ActionInstant.swift
//  Fiber2D
//
//  Created by Andrey Volodin on 03.09.16.
//  Copyright © 2016 s1ddok. All rights reserved.
//

public struct ActionInstantContainer: ActionContainer {
    
    @inline(__always)
    mutating public func update(state: Float) {
        action.update(state: state)
    }
    
    mutating public func start(with target: AnyObject?) {
        self.target = target
        action.start(with: target)
    }
    
    mutating public func stop() {
        self.target = nil
    }
    mutating public func step(dt: Time) {
        self.update(state: 1.0)
    }
    
    public var tag: Int = 0
    weak var target: AnyObject? = nil
    public var isDone: Bool {
        return true
    }
        
    var action: ActionModel
    init(action: ActionModel) {
        self.action = action
    }
}

public extension ActionModel {
    public var instantly: ActionInstantContainer {
        return ActionInstantContainer(action: self)
    }
}

extension ActionInstantContainer: FiniteTime {
    public var duration: Time {
        return 0.0
    }
}
    
