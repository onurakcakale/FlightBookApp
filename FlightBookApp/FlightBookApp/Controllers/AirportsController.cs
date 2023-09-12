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
    public class AirportsController : ControllerBase
    {
        private readonly ApplicationContext _context;

        public AirportsController(ApplicationContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Airports>>> Getairports()
        {
            return await _context.airports.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Airports>> GetAirports(int id)
        {
            var airports = await _context.airports.FindAsync(id);

            if (airports == null)
            {
                return NotFound();
            }

            return airports;
        }
    }
}