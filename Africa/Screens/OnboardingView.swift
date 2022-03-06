//
//  OnboardingView.swift
//  Africa
//
//  Created by Ferox on 2/6/22.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    
    @State private var isAnimating: Bool = false
    @State private var indicatorOpaccity: Double = 1.0
    @State private var imageOffset: CGSize = .zero
    @State private var title: String = "Africa"
    @State private var description: String = """
Get to know African animals and their habitats. this app contains information and content such as video & gallery.

"""
    
    //MARK: - Body
    var body: some View {
        VStack {
            //MARK: - Top: RingView
            ZStack{
                RingView(shapeColor: Color.init(UIColor(red: 1.00, green: 0.69, blue: 0.01, alpha: 1.00)), shapeOpacity: 0.2)
                    .offset(x: -(imageOffset.width * 1.2))
                    .blur(radius: abs(imageOffset.width) / 10)
                    .animation(.easeOut(duration: 1), value: imageOffset)
                
                Image("cheetah-png-modified")
                    .resizable()
                    .scaledToFit()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 0.5), value: isAnimating)
                    .offset(x: imageOffset.width * 1.2, y: 0)
                    .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                    .frame(width: 300)
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if abs(imageOffset.width) <= 150 {
                                    imageOffset = gesture.translation
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpaccity = 0
                                        title = "Cheetah"
                                        description = "The cheetah is the fastest land animal in the world, reaching speeds of up to 70 miles per hour. They can accelerate from 0 to 68 miles per hour in just three seconds."
                                    }
                                    
                                }
                            })
                            .onEnded({ _ in
                                    imageOffset = .zero
                                
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpaccity = 1
                                        title = "Africa"
                                        description = """
Get to know African animals and their habitats. this app contains information and content such as video & gallery.

"""
                                    }
                                
                            })
                    )
                    .animation(.easeOut(duration: 1), value: imageOffset)
            }//: ZStack
            .padding(.top, 40)
            .overlay(
                Image(systemName: "arrow.left.and.right.circle")
                    .font(.system(size: 44, weight: .ultraLight))
                    .offset(y: 50)
                    .foregroundColor(.white)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                    .opacity(indicatorOpaccity)
                , alignment: .bottom
            )
            Spacer()
            
            //MARK: - Center: Title
            VStack {
                Text(title)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.init(UIColor(red: 1.00, green: 0.69, blue: 0.01, alpha: 1.00)))
                    .id(title)
                .padding(.bottom, 2)
            
                Text(description)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    .id(description)
                
            }
            .offset(y: 10)
            
            Spacer()
            
            //MARK: - Bottom: Start Button
            StartButtonView(size: 25)
            
            Spacer()
            
        }//: VStack
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
