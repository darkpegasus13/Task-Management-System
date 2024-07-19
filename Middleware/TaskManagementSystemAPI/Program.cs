using Microsoft.EntityFrameworkCore;
using TaskManagementSystemAPI.Model;
using TaskManagementSystemAPI.Repository;
using TaskManagementSystemAPI.Helpers;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);
var settings = builder.Configuration.GetSection("ConnectionStrings").Get<ConnectionStrings>();

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<PractiseDbContext>(options => options.UseSqlServer(settings.Database));
builder.Services.AddScoped<ITMSRepository, TMSRepository>();

var app = builder.Build();
app.UseRouting();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
