//
//  Animation.swift
//  LessonNineHomework
//
//  Created by Philip Noskov on 27.04.2021.
//

struct Animation {
    
    var preset: String
    var curve: String
    var force: Float
    var duration: Float
    var delay: Float
    
    static func getAnimation() -> Animation {
        
        let randomPreset = AnimationData.animationData.presets.randomElement()
        let randomCurve = AnimationData.animationData.curve.randomElement()
        let randomForce = Float.random(in: 1..<2)
        let randomDuration = Float.random(in: 1..<3)
        let randomDelay = Float.random(in: 0...3)
        
        return Animation(
            preset: randomPreset ?? "easyIn",
            curve: randomCurve ?? "slideLeft",
            force: randomForce,
            duration: randomDuration,
            delay: randomDelay
        )
    }
}
