enum PaymentPurpose: String, Codable, Hashable {
    case collection = "Инкассация"
    case doctorPayout = "Выплата"
    case medicalServices = "Оплата услуг"
    case refund = "Возврат"
    case toBalance = "Пополнение баланса"
    case fromBalance = "Списание с баланса"
    case equipment = "Оборудование"
    case consumables = "Расходники"
    case building = "Помещение"

    static var userSelectableCases: [PaymentPurpose] {
        [.collection, .equipment, .consumables, .building]
    }
}
