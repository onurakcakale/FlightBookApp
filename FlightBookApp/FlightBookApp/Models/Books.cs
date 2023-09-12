using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace FlightBookApp.Models
{
    public class Books
    {
        public int Id { get; set; }
        public string bookCode { get; set; }
        public int flightId { get; set; }
        public string customerName { get; set; }
        public string customerSurname { get; set; }
        public string customerPhone { get; set; }
        public string customerMail { get; set; }
        public DateTime CreatedTime { get; set; }
    }
}