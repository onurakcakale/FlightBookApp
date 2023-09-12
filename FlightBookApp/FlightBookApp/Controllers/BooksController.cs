using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FlightBookApp.Context;
using FlightBookApp.Models;

namespace FlightBookApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly ApplicationContext appContext;

        public BooksController(ApplicationContext context)
        {
            appContext = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Books>>> Getbooks()
        {
            return await appContext.books.ToListAsync();
        }

        [HttpGet("{bookCode}")]
        public JsonResult GetBooks(string bookCode)
        {
            var query = appContext.books
                .Join(appContext.flights,
                    a => a.flightId,
                    b => b.Id, (a, b) => new { a, b })
                .Where(x => x.a.bookCode == bookCode)
                .Select(o => new BooksViewModel
                {
                    bookCode = o.a.bookCode,
                    flightId = o.b.Id,
                    flightStartDate = o.b.flightStartDate,
                    flightEndDate = o.b.flightEndDate,
                    airportNameFromWhere = appContext.airports.Where(x => x.Id == o.b.airportIdFromWhere).Select(a => a.airportName).FirstOrDefault(),
                    airportNameToWhere = appContext.airports.Where(x => x.Id == o.b.airportIdToWhere).Select(a => a.airportName).FirstOrDefault(),
                    planeCode = appContext.planes.Where(x => x.Id == o.b.planeId).Select(a => a.planeCode).FirstOrDefault(),
                    planeName = appContext.planes.Where(x => x.Id == o.b.planeId).Select(a => a.planeName).FirstOrDefault(),
                    planeCapacity = appContext.planes.Where(x => x.Id == o.b.planeId).Select(a => a.planeCapacity).FirstOrDefault(),
                    planeId = appContext.planes.Where(x => x.Id == o.b.planeId).Select(a => a.Id).FirstOrDefault(),
                    customerName = o.a.customerName,
                    customerSurname = o.a.customerSurname,
                    customerPhone = o.a.customerPhone,
                    customerMail = o.a.customerMail,
                    CreatedTime = o.a.CreatedTime
                })
                .OrderBy(c => c.CreatedTime).ToList();

            return new JsonResult(query);
        }

        [HttpPost]
        public async Task<ActionResult<Books>> PostBooks(Books books)
        {
            appContext.books.Add(books);
            await appContext.SaveChangesAsync();

            return CreatedAtAction("GetBooks", new { id = books.Id }, books);
        }
    }
}