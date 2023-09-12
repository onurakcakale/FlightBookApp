using FlightBookApp.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FlightBookApp.Context
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Airports> airports { get; set; }
        public DbSet<Books> books { get; set; }
        public DbSet<Planes> planes { get; set; }
        public DbSet<Flights> flights { get; set; }

        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options) { }

        public async Task<int> SaveChanges()
        {
            return await base.SaveChangesAsync();
        }
    }
}