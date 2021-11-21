﻿using Microsoft.EntityFrameworkCore.Migrations;

namespace Day12_13.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Customer",
                columns: table => new
                {
                    CustomerId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CustomerName = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customer", x => x.CustomerId);
                });

            migrationBuilder.CreateTable(
                name: "Plant",
                columns: table => new
                {
                    PlantId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PlantPlace = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Plant", x => x.PlantId);
                });

            migrationBuilder.CreateTable(
                name: "Addresse",
                columns: table => new
                {
                    AddressId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Address = table.Column<string>(nullable: true),
                    State = table.Column<string>(nullable: true),
                    City = table.Column<string>(nullable: true),
                    CustomerId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Addresse", x => x.AddressId);
                    table.ForeignKey(
                        name: "FK_Addresse_Customer_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customer",
                        principalColumn: "CustomerId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ToysType",
                columns: table => new
                {
                    ToyTypeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TypeName = table.Column<string>(nullable: true),
                    PlantId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ToysType", x => x.ToyTypeId);
                    table.ForeignKey(
                        name: "FK_ToysType_Plant_PlantId",
                        column: x => x.PlantId,
                        principalTable: "Plant",
                        principalColumn: "PlantId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Order",
                columns: table => new
                {
                    OrderId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TotalAmount = table.Column<decimal>(nullable: false),
                    TotalDiscount = table.Column<decimal>(nullable: false),
                    NetAmount = table.Column<decimal>(nullable: false),
                    AddressId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Order", x => x.OrderId);
                    table.ForeignKey(
                        name: "FK_Order_Addresse_AddressId",
                        column: x => x.AddressId,
                        principalTable: "Addresse",
                        principalColumn: "AddressId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Toy",
                columns: table => new
                {
                    ToyId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ToyName = table.Column<string>(nullable: true),
                    ToyTypeId = table.Column<int>(nullable: false),
                    Price = table.Column<decimal>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Toy", x => x.ToyId);
                    table.ForeignKey(
                        name: "FK_Toy_ToysType_ToyTypeId",
                        column: x => x.ToyTypeId,
                        principalTable: "ToysType",
                        principalColumn: "ToyTypeId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PurchaseDetail",
                columns: table => new
                {
                    PurchaseId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ToyId = table.Column<int>(nullable: false),
                    OrderId = table.Column<int>(nullable: false),
                    Quantity = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PurchaseDetail", x => x.PurchaseId);
                    table.ForeignKey(
                        name: "FK_PurchaseDetail_Order_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Order",
                        principalColumn: "OrderId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseDetail_Toy_ToyId",
                        column: x => x.ToyId,
                        principalTable: "Toy",
                        principalColumn: "ToyId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Addresse_CustomerId",
                table: "Addresse",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_Order_AddressId",
                table: "Order",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseDetail_OrderId",
                table: "PurchaseDetail",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseDetail_ToyId",
                table: "PurchaseDetail",
                column: "ToyId");

            migrationBuilder.CreateIndex(
                name: "IX_Toy_ToyTypeId",
                table: "Toy",
                column: "ToyTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_ToysType_PlantId",
                table: "ToysType",
                column: "PlantId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PurchaseDetail");

            migrationBuilder.DropTable(
                name: "Order");

            migrationBuilder.DropTable(
                name: "Toy");

            migrationBuilder.DropTable(
                name: "Addresse");

            migrationBuilder.DropTable(
                name: "ToysType");

            migrationBuilder.DropTable(
                name: "Customer");

            migrationBuilder.DropTable(
                name: "Plant");
        }
    }
}
