//
//  StrechPreview.swift
//  Niks
//
//  Created by Adriel Bernard Rusli on 02/05/23.
//

import SwiftUI

struct StrechPreview: View {
    @EnvironmentObject var viewModel: AnimationViewModel
    @State private var nextpage = false
    @State var currentindex: Int = 0
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                ZStack{
                    HStack{
                        Image(systemName: "xmark.circle")
                            .iconStyle()
                    }.position(x: geometry.size.width * 0.05, y: geometry.size.height * 0.08)
                    HStack{
                        Image(systemName: "questionmark.circle")
                            .iconStyle()
                    }.position(x: geometry.size.width * 0.95, y: geometry.size.height * 0.08)
                    
                    VStack{
                        Text(Dialogue.strech.Titles[currentindex]).titleStyle()
                        Text(Dialogue.strech.SubTitles[currentindex]).titleStyle()
                            .padding(.top, -40)
                    } .position(x: geometry.size.width/2 , y: geometry.size.height * 0.1)
                    
                    HStack{
                        ProgressBarComponent()
                    } .position(x : geometry.size.width/2 , y: geometry.size.height * 0.97)
                    HStack{
                        
                        
                        TimelineView(.periodic(from: .now, by: 0.1)){
                            timeline in
                            
                            animationView(date: timeline.date)
                                .environmentObject(viewModel)
                                .frame(width: geometry.size.width * 0.35, height: geometry.size.width * 0.35)
                        }
                        //
                    }.position(x: geometry.size.width * 0.5 , y: geometry.size.height * 0.35)
                    
                    HStack(alignment: .center){
                        Text(Dialogue.strech.Prompts[currentindex])
                            .descriptionStyle()
                            .multilineTextAlignment(.center)
                        
                        
                    }.frame(width: geometry.size.width * 0.7)
                        .position(x: geometry.size.width/2 , y: geometry.size.height * 0.65)
                    
                    
                    HStack{
                        Button{
                            nextpage = true
                            print("Test1")
                        }label: {
                            Text("Start")
                                .buttonStyle()
                        }
                        
                        
                        NavigationLink(destination: DetailView() , isActive: $nextpage){
                            EmptyView()
                        }.hidden()
                        
                    }.position(x: geometry.size.width/2 , y: geometry.size.height * 0.88)
                    
                    
                    
                    
                    
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(Color("LightBlue"))
                    .ignoresSafeArea()
            }
        }.navigationViewStyle(.stack)
    }
}

struct StrechPreview_Previews: PreviewProvider {
    static var previews: some View {
        StrechPreview(currentindex: 1)
            .environmentObject(AnimationViewModel())
        //        StrechPreview(currentindex: .constant(0))
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.sizeThatFits)
    }
}


