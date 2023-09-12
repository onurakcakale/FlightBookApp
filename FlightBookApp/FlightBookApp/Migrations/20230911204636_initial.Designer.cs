﻿// <auto-generated />
using System;
using FlightBookApp.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace FlightBookApp.Migrations
{
    [DbContext(typeof(ApplicationContext))]
    [Migration("20230911204636_initial")]
    partial class initial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.17")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("FlightBookApp.Models.Airports", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("airportName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("cityName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("shortName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("airports");
                });

            modelBuilder.Entity("FlightBookApp.Models.Books", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreatedTime")
                        .HasColumnType("datetime");

                    b.Property<string>("bookCode")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("customerMail")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("customerName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("customerPhone")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("customerSurname")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("flightId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("books");
                });

            modelBuilder.Entity("FlightBookApp.Models.Flights", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("Price")
                        .HasColumnType("int");

                    b.Property<int>("airportIdFromWhere")
                        .HasColumnType("int");

                    b.Property<int>("airportIdToWhere")
                        .HasColumnType("int");

                    b.Property<DateTime>("flightEndDate")
                        .HasColumnType("datetime");

                    b.Property<DateTime>("flightStartDate")
                        .HasColumnType("datetime");

                    b.Property<int>("planeId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("flights");
                });

            modelBuilder.Entity("FlightBookApp.Models.Planes", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("planeCapacity")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("planeCode")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("planeName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("planes");
                });
#pragma warning restore 612, 618
        }
    }
}
