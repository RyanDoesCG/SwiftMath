/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *  Vec3.swift
 *
 *  Created by Ryan Needham on 14/02/2017.
 *  Copyright © 2017 Baked Goods Studios. All rights reserved.
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
import Foundation
import GLKit

public final class Vec3 : Vector {
    public var x: Float = 0;
    public var y: Float = 0;
    public var z: Float = 0;
    public var r: Float { return x }
    public var g: Float { return y }
    public var b: Float { return z }
    
    public init (x: Float, y: Float, z: Float) { self.x = x; self.y = y; self.z = z }
    public init (r: Float, g: Float, b: Float) { self.x = r; self.y = g; self.z = b }
    public init (v: Float)                     { self.x = v; self.y = v; self.z = v }
    public init (v: Vec3)                      { self.x = v.x; self.y = v.y; self.z = v.z }
    public init ()                             { self.x = 0; self.y = 0; self.z = 0 }
    
    /* * * * * * * * * * * * * * * * * * * * *
     *  ARITHMETIC
     * * * * * * * * * * * * * * * * * * * * */
    public static  func +=  (left: inout Vec3, right: Vec3)    { return left = left + right }
    public static  func +   (left: Vec3, right: Vec3) -> Vec3  { return Vec3 (x: left.x + right.x, y: left.y + right.y, z: left.z + right.z) }

    public static  func -=  (left: inout Vec3, right: Vec3)    { return left = left - right }
    public static  func -   (left: Vec3, right: Vec3) -> Vec3  { return Vec3 (x: left.x - right.x, y: left.y - right.y, z: left.z - right.z) }
    
    public static  func *=  (left: inout Vec3, right: Vec3)     { return left = left * right }
    public static  func *   (left: Vec3,  right: Vec3)  -> Vec3 { return Vec3 (x: left.x * right.x, y: left.y * right.y, z: left.z * right.z) }
    public static  func *   (left: Vec3,  right: Float) -> Vec3 { return Vec3 (x: left.x * right, y: left.y * right, z: left.z * right) }
    public static  func *   (left: Float, right: Vec3 ) -> Vec3 { return Vec3 (x: right.x * left, y: right.y * left, z: right.z * left) }

    private        func div (factor: Float) { if (factor != 0) { self.x = self.x / factor; self.y = self.y / factor; self.z = self.z / factor } }
    
    /* * * * * * * * * * * * * * * * * * * * *
     *  COMPARATORS
     * * * * * * * * * * * * * * * * * * * * */
    public static  func == (left: Vec3, right: Vec3) -> Bool { return ((left.x == right.x) && (left.y == right.y) && (left.z == right.z)) }
    public static  func != (left: Vec3, right: Vec3) -> Bool { return ((left.x != right.x) || (left.y != right.y) || (left.z != right.z)) }
    
    /* * * * * * * * * * * * * * * * * * * * *
     *  VECTOR OPERATIONS
     * * * * * * * * * * * * * * * * * * * * */
    public var normalised: Vec3 {
        let mag = magnitude
        let new = Vec3(v: 0)
        if (mag != 0) {
            new.x = self.x.divided(by: mag)
            new.y = self.y.divided(by: mag)
            new.z = self.z.divided(by: mag)
        }
        return new
    }
    
    public var magnitude: Float {
        return sqrt((self.x * self.x) + (self.y * self.y) + (self.z * self.z))
    }
    
    public var length: Float {
        return magnitude
    }

    
    public func cross (other: Vec3) -> Vec3 {
        return Vec3 (
            x: (self.y * other.z) - (other.y * self.z),
            y: (self.z * other.x) - (other.z * self.x),
            z: (self.x * other.y) - (other.x * self.y)
        )
    }
    
    // TO-DO
    public func dot (other: Vec3) -> Float {
        return 0.0
    }
    
    /* * * * * * * * * * * * * * * * * * * * *
     *  DEBUG / UTILITY
     * * * * * * * * * * * * * * * * * * * * */
    public var asGLKVector: GLKVector3 { return GLKVector3Make (x, y, z) }
    public var string: (Float, Float, Float) { return (x, y, z) }
    
}
