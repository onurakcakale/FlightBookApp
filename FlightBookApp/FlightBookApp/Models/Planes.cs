using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FlightBookApp.Models
{
    public class Planes
    {
        public int Id { get; set; }
        public string planeCode { get; set; }
        public string planeName { get; set; }
        public string planeCapacity { get; set; }
    }
}