//
//  WalletView.swift
//  SwiftUIWallet
//
//  Created by Maxim Brishten on 29.05.23.
//

import SwiftUI

struct WalletView: View {
    
    @GestureState private var dragState = DragState.inactive
    @State private var isCardPresented = false
    @State private var isCardPressed = false
    @State private var selectedCard: Card?
    
    private static var cardOffset: CGFloat = 50
    @State var cards: [Card] = testCards
    
    var body: some View {
        VStack {
            
            TopNavBar()
                .padding(.bottom)
            
            Spacer()
            
            ZStack {
                ForEach(cards) { card in
                    CardView(card: card)
                        .padding(.horizontal, 35)
                        .offset(self.offset(for: card))
                        .zIndex(self.zIndex(for: card))
                        .id(isCardPresented)
                        .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                        .gesture(
                            TapGesture()
                                    .onEnded({ _ in
                                        withAnimation(.easeOut(duration: 0.15).delay(0.1)) {
                                            self.isCardPressed.toggle()
                                            self.selectedCard = self.isCardPressed ? card : nil
                                        }
                                    })
                                    .exclusively(before: LongPressGesture(minimumDuration: 0.05)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { (value, state, transaction) in
                                        switch value {
                                        case .first(true):
                                            state = .pressing(index: self.index(for: card))
                                        case .second(true, let drag):
                                            state = .dragging(index: self.index(for: card), translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }

                                    })
                                    .onEnded({ (value) in

                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }

                                        
                                        withAnimation(.spring()) {
                                            self.rearrangeCards(with: card, dragOffset: drag.translation)
                                        }
                                    })

                                )
                        )
                        .animation(self.transitionAnimation(for: card), value: isCardPresented)
                }
            }
            .onAppear {
                isCardPresented.toggle()
            }
            
            if isCardPressed {
                TransactionHistoryView(transactions: testTransactions)
                    .padding(.top, 10)
                    .transition(.move(edge: .bottom))
            }
            
            Spacer()
        }
    }
    
    private func rearrangeCards(with card: Card, dragOffset: CGSize) {
        guard let draggingCardIndex = index(for: card) else {
            return
        }

        var newIndex = draggingCardIndex + Int(-dragOffset.height / Self.cardOffset)
        newIndex = newIndex >= cards.count ? cards.count - 1 : newIndex
        newIndex = newIndex < 0 ? 0 : newIndex

        let removedCard = cards.remove(at: draggingCardIndex)
        cards.insert(removedCard, at: newIndex)

    }
    
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else {
            return 0.0
        }
        
        // The default z-index of a card is set to a negative value of the card's index,
        // so that the first card will have the largest z-index.
        let defaultZIndex = -Double(cardIndex)
        
        // If it's the dragging card
        if let draggingIndex = dragState.index,
           cardIndex == draggingIndex {
            // we compute the new z-index based on the translation's height
            return defaultZIndex + Double(dragState.translation.height/Self.cardOffset)
        }
        
        // Otherwise, we return the default z-index
        return defaultZIndex
    }

    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            return nil
        }

        return index
    }
    
    private func offset(for card: Card) -> CGSize {

        guard let cardIndex = index(for: card) else {
                return CGSize()
            }

            if isCardPressed {
                guard let selectedCard = self.selectedCard,
                    let selectedCardIndex = index(for: selectedCard) else {
                        return .zero
                }

                if cardIndex >= selectedCardIndex {
                    return .zero
                }

                let offset = CGSize(width: 0, height: 1400)

                return offset
            }

            // Handle dragging
            var pressedOffset = CGSize.zero
            var dragOffsetY: CGFloat = 0.0

            if let draggingIndex = dragState.index,
                cardIndex == draggingIndex {
                pressedOffset.height = dragState.isPressing ? -20 : 0

                switch dragState.translation.width {
                case let width where width < -10: pressedOffset.width = -20
                case let width where width > 10: pressedOffset.width = 20
                default: break
                }

                dragOffsetY = dragState.translation.height
            }

            return CGSize(width: 0 + pressedOffset.width, height: -50 * CGFloat(cardIndex) + pressedOffset.height + dragOffsetY)
    }
    
    private func transitionAnimation(for card: Card) -> Animation {
        var delay = 0.0

        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }

        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
