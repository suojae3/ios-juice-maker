
import Foundation

// MARK: - JuiceMaker 초기화
struct JuiceMaker {
    
    var fruitStore: FruitStore?
    
}

// MARK: - JuiceMaker 메서드
extension JuiceMaker {
    
    func makeStrawberryJuice() {
        fruitStore?.decrement(fruits: [.strawberry], by: [16])
    }
    
    func makeBananaJuice() {
        fruitStore?.decrement(fruits: [.banana], by: [2])
    }

    func makeKiwiJuice() {
        fruitStore?.decrement(fruits: [.kiwi], by: [3])
    }
    
    func makePineappleJuice() {
        fruitStore?.decrement(fruits: [.pineapple], by: [2])
    }
    
    func makeDdalbaJuice() {
        fruitStore?.decrement(fruits: [.strawberry,.banana], by: [10, 1])
    }
    
    func makeMangoJuice() {
        fruitStore?.decrement(fruits: [.mango], by: [3])
    }

    func makeMangkiJuice() {
        fruitStore?.decrement(fruits: [.mango, .kiwi], by: [2,1])
    }
    
    func updateStock() {
        fruitStore?.updateStock()
    }
}


