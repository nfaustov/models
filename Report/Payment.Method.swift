extension Payment {
    struct Method: Codable, Hashable {
        public var type: PaymentType
        public var value: Double

        public init(_ type: PaymentType, value: Double) {
            self.type = type
            self.value = value
        }
    }
}

enum PaymentType: String, Codable, Hashable, CaseIterable {
    case cash = "Наличные"
    case bank = "Терминал"
    case card = "Карта"
}
