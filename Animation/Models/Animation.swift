//
//  Animation.swift
//  Animation
//
//  Created by Матвей Авдеев on 13.06.2023.
//

struct Animation {
    let percents: [String]
    let curves: [String]
    
    static func setAnimation() -> Animation {
        Animation(
            percents: DataStore.shared.percents.shuffled(),
            curves: DataStore.shared.curves.shuffled()
        )
    }
}
