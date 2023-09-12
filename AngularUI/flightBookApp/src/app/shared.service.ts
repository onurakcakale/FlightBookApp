import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SharedService {
  readonly APIURL = "https://localhost:44328/api"

  constructor(private http: HttpClient) { }

  getAirportsList(): Observable<any[]> {
    return this.http.get<any>(this.APIURL + '/airports');
  }

  getFlightsList(params: any): Observable<any[]> {
    return this.http.get<any>(this.APIURL + '/flights', { params });
  }

  submitBook(params: any): Observable<any[]> {
    const headers = { 'content-type': 'application/json'}  
    const body = JSON.stringify(params);
    return this.http.post<any>(this.APIURL + '/books', body, { 'headers': headers });
  }

  getBook(params: any): Observable<any[]> {
    return this.http.get<any>(this.APIURL + '/books/' +  params);
  }

  // getFlightsList(params: any): Observable<any[]> {
  //   const headers = { 'content-type': 'application/json'}  
  //   const body=JSON.stringify(params);
  //   return this.http.post<any>(this.APIURL + '/flights/' + body,{'headers':headers});
  // }
}