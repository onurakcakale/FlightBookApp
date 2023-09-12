using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace FlightBookApp.Models
{
    public class Flights
    {
        public int Id { get; set; }
        public int planeId { get; set; }
        public int airportIdFromWhere { get; set; }
        public int airportIdToWhere { get; set; }
        public DateTime flightStartDate { get; set; }
        public DateTime flightEndDate { get; set; }
        public int Price { get; set; }
    }
}