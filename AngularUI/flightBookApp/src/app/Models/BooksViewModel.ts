export class BooksViewModel {
    customerName = null;
    customerSurname = null;
    customerPhone = null;
    customerMail = null;
    CreatedTime = new Date();
    flightIdList : Array<FlightsViewModel> = [];
    bookCode : Array<FlightsViewModel> = [];
}

export class FlightsViewModel {
    flightId = null;
    bookCode = null;
}