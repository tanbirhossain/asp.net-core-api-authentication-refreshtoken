using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;

namespace CrudAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>();
    }
}


#region Command
//#1.  Install-Package Microsoft.EntityFrameworkCore.SqlServer
//#2.  Install-Package Microsoft.EntityFrameworkCore.Tools
//#    Install-Package Microsoft.EntityFrameworkCore.Design 
//#3.  Scaffold-DbContext "Server= YourSqlServerName;Database=StudentsDB;user id= YourSqlUID;password= YourSqlPassword;Trusted_Connection=True;MultipleActiveResultSets=true" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -Tables StudentMasters
//#4.  Scaffold-DbContext "Server= DESKTOP-1TP3BJN;Database=AngularCrudDB;user id= sa;password= pasic;Trusted_Connection=True;MultipleActiveResultSets=true" Microsoft.EntityFrameworkCore.SqlServer -OutputDir DB 
#endregion