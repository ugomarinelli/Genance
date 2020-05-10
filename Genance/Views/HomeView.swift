//
//  HomeView.swift
//  Genance
//
//  Created by Ugo Marinelli on 10/05/2020.
//  Copyright © 2020 Ugo Marinelli. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    private var presenter: HomePresenter?
    @State var progressValue: Float = 0.6
    @State var showChoicesView: Bool = false
    
    init(presenter: HomePresenter?) {
        self.presenter = presenter
        presenter?.prepare(self)
    }
    
    var body: some View {
        ZStack {
            Color.pastelPurple
            VStack {
                if showChoicesView {
                    ChoicesView(presenter: ChoicesPresenterImpl())
                    .animation(.spring())
                        .transition(.scale)
                } else {
                    Image(imageDribble)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    ProgressBar(value: $progressValue)
                        .frame(width: 100, height: 10)
                }
                
            }
        }.edgesIgnoringSafeArea(.all)
         .onAppear(perform: startProgressBar)
    }
    
    func update(with state: HomeState) {
        guard let stories = state.stories, state.hasLoaded else {
            //Show Error
            return
        }
       // self.navigate(to: ChoicesView(presenter: ChoicesPresenterImpl()), when: ($progressValue)
    }
    
    func startProgressBar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            for _ in 0...80 {
                self.progressValue += 0.015
            }
            self.showChoicesView = true
        }
    }
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView(presenter: HomePresenterImpl())
    }
}
#endif



