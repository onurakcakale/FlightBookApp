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
    public class FlightsController : ControllerBase
    {
        private readonly ApplicationContext appContext;

        public FlightsController(ApplicationContext appContext)
        {
            this.appContext = appContext;
        }

        [HttpGet]
        public JsonResult Get(int airportIdFromWhere, int airportIdToWhere, DateTime flightStartDate, DateTime flightEndDate)
        {
            var query = appContext.flights
                .Join(appContext.planes,
                    a => a.planeId,
                    b => b.Id, (a, b) => new { a, b })
                .Where(x => (x.a.airportIdFromWhere == airportIdFromWhere && x.a.airportIdToWhere == airportIdToWhere && x.a.flightStartDate.Date == flightStartDate.Date) ||
                            (x.a.airportIdFromWhere == airportIdToWhere && x.a.airportIdToWhere == airportIdFromWhere && x.a.flightStartDate.Date == flightEndDate.Date))
                .Select(o => new
                {
                    flightId = o.a.Id,
                    planeCode = o.b.planeCode,
                    planeName = o.b.planeName,
                    planeCapacity = o.b.planeCapacity,
                    planeId = o.b.Id,
                    airportIdFromWhere = o.a.airportIdFromWhere,
                    airportIdToWhere = o.a.airportIdToWhere,
                    flightStartDate = o.a.flightStartDate,
                    flightEndDate = o.a.flightEndDate,
                    price = o.a.Price,
                }).ToList();

            return new JsonResult(query);
        }

        [HttpGet("{id}")]
        public JsonResult Get(int id)
        {
            var query = appContext.flights.Where(x => x.Id == id).ToList();

            return new JsonResult(query);
        }
    }
}