import Combine
import Service

final class ArchiveViewModel: BaseViewModel {
    @Published var yearSelect: String = "2022년"
    @Published var monthSelect: String = "11월"

    @Published var list: [ArchiveHabitEntity] = [
        .init(
            id: 1,
            startAt: "2022-01-01",
            endAt: "2022-01-06",
            level: 0
        ),
        .init(
            id: 1,
            startAt: "2022-01-01",
            endAt: "2022-01-06",
            level: 1
        ),
        .init(
            id: 1,
            startAt: "2022-01-01",
            endAt: "2022-01-06",
            level: 2
        ),
        .init(
            id: 1,
            startAt: "2022-01-01",
            endAt: "2022-01-06",
            level: 3
        ),
        .init(
            id: 1,
            startAt: "2022-01-01",
            endAt: "2022-01-06",
            level: 4
        )
    ]

    @Published var yearOptions = [
        DropdownOption(
            key: "2022년",
            val: "2022년"),
        DropdownOption(
            key: "2021년",
            val: "2021년"
        ),
        DropdownOption(
            key: "2020년",
            val: "2020년"
        )
    ]
    @Published var monthOptions = [
        DropdownOption(
            key: "12월",
            val: "12월"
        ),
        DropdownOption(
            key: "11월",
            val: "11월"
        ),
        DropdownOption(
            key: "10월",
            val: "10월"
        ),
        DropdownOption(
            key: "9월",
            val: "9월"
        ),
        DropdownOption(
            key: "8월",
            val: "8월"
        ),
        DropdownOption(
            key: "7월",
            val: "7월"
        ),
        DropdownOption(
            key: "6월",
            val: "6월"
        ),
        DropdownOption(
            key: "5월",
            val: "5월"
        ),
        DropdownOption(
            key: "4월",
            val: "4월"
        ),
        DropdownOption(
            key: "3월",
            val: "3월"
        ),
        DropdownOption(
            key: "2월",
            val: "2월"
        ),
        DropdownOption(
            key: "1월",
            val: "1월"
        )
    ]
}
