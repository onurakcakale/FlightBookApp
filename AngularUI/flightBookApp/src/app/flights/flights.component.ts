import { Component, OnInit } from '@angular/core';
import { SharedService } from '../shared.service';
import { BooksViewModel, FlightsViewModel } from '../Models/BooksViewModel';

@Component({
  selector: 'app-flights',
  templateUrl: './flights.component.html',
  styleUrls: ['./flights.component.css']
})
export class FlightsComponent {
  public booksViewModel: BooksViewModel = new BooksViewModel();

  public airportsList: any;
  public selectedAirportFromWhere: any;
  public selectedAirportToWhere: any;

  public selectedStartDateValue: any;
  public selectedEndDateValue: any;

  public searchedFlights: any;

  public clickedItem1: any;
  public clickedItem2: any;

  public customerName: any;
  public customerSurname: any;
  public customerPhone: any;
  public customerMail: any;

  public bookDetails: any;

  public displayStyle = "none";

  constructor(private service: SharedService) { }

  onClickItem1(item: any) {
    this.clickedItem1 = item;
  }

  onClickItem2(item: any) {
    this.clickedItem2 = item;
  }

  ngOnInit(): void {
    this.service.getAirportsList().subscribe((data) => {
      this.airportsList = data;
    })
  }

  ChangeAirportFromWhere(e: any) {
    this.selectedAirportFromWhere = e.target.value;
  }

  ChangeAirportToWhere(e: any) {
    this.selectedAirportToWhere = e.target.value;
  }

  StartDateChange(startDate: Date) {
    this.selectedStartDateValue = startDate;
  }

  EndDateChange(endDate: Date) {
    this.selectedEndDateValue = endDate;
  }

  SearchFligths() {
    let params = {
      airportIdFromWhere: this.selectedAirportFromWhere,
      airportIdToWhere: this.selectedAirportToWhere,
      flightStartDate: this.selectedStartDateValue,
      flightEndDate: this.selectedEndDateValue,
    }

    this.service.getFlightsList(params).subscribe((data) => {
      this.searchedFlights = data;
    });

    this.clickedItem1 = null;
    this.clickedItem2 = null;
  }

  Submit() {
    let params = {
      bookCode: this.clickedItem1.planeCode + Math.random() * 10,
      flightId: this.clickedItem1.flightId,
      customerName: this.customerName,
      customerSurname: this.customerSurname,
      customerPhone: this.customerPhone,
      customerMail: this.customerMail,
      CreatedTime: new Date(),
    }

    this.service.submitBook(params).subscribe((resp) => {
    });

    let params2 = {
      bookCode: params.bookCode,
      flightId: this.clickedItem2.flightId,
      customerName: this.customerName,
      customerSurname: this.customerSurname,
      customerPhone: this.customerPhone,
      customerMail: this.customerMail,
      CreatedTime: new Date(),
    }

    this.service.submitBook(params2).subscribe((resp) => {
      this.service.getBook(params.bookCode).subscribe((data) => {
        this.displayStyle = "block";
        this.bookDetails = data;
      });
    });
  }

  closeModal() {
    this.displayStyle = "none";
    window.location.reload();
  }
}