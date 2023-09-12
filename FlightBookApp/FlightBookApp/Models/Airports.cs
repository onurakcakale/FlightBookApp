using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FlightBookApp.Models
{
    public class Airports
    {
        public int Id { get; set; }
        public string airportName { get; set; }
        public string cityName { get; set; }
        public string shortName { get; set; }
    }
}