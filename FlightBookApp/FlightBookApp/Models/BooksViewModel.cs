using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FlightBookApp.Models
{
    public class BooksViewModel
    {
        public int Id { get; set; }
        public string bookCode { get; set; }
        public int flightId { get; set; }
        public int planeId { get; set; }
        public DateTime flightStartDate { get; set; }
        public DateTime flightEndDate { get; set; }
        public string planeCode { get; set; }
        public string planeName { get; set; }
        public string planeCapacity { get; set; }
        public string airportNameFromWhere { get; set; }
        public string airportNameToWhere { get; set; }
        public string cityName { get; set; }
        public string shortName { get; set; }
        public string customerName { get; set; }
        public string customerSurname { get; set; }
        public string customerPhone { get; set; }
        public string customerMail { get; set; }
        public DateTime CreatedTime { get; set; }
    }
}