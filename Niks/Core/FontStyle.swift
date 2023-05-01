//
//  FontStyle.swift
//  Niks
//
//  Created by Deka Primatio on 01/05/23.
//

import SwiftUI

//MARK: - TITLE & DIALOGUE STYLE MODIFIER
struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(Color("SoftBlack"))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}

//MARK: - DESCRIPTION, TUTORIAL, & LIST OF SOUND STYLE MODIFIER
struct DescriptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .medium))
            .foregroundColor(Color("SoftBlack"))
    }
}

extension View {
    func descriptionStyle() -> some View {
        modifier(DescriptionModifier())
    }
}

//MARK: - YOGA TUTORIAL NUMBER
struct TutorialNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .regular))
            .foregroundColor(Color("SoftBlack"))
    }
}

extension View {
    func tutorialNumberStyle() -> some View {
        modifier(TutorialNumberModifier())
    }
}

//MARK: - POPUP STYLE MODIFIER
struct PopupTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .regular))
            .foregroundColor(Color("SoftBlack"))
    }
}

extension View {
    func popupTextStyle() -> some View {
        modifier(PopupTextModifier())
    }
}

struct FontStyle: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("TITLE & DIALOGUE STYLE MODIFIER")
                .titleStyle()
            
            Text("DESCRIPTION, TUTORIAL, & LIST OF SOUND STYLE MODIFIER")
                .descriptionStyle()
            
            Text("YOGA TUTORIAL NUMBER")
                .tutorialNumberStyle()
            
            Text("POPUP STYLE MODIFIER")
                .popupTextStyle()
            
        }
    }
}

struct FontStyle_Previews: PreviewProvider {
    static var previews: some View {
        FontStyle()
    }
}

