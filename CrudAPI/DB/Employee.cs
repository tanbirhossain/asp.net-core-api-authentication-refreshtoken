using System;
using System.Collections.Generic;

namespace CrudAPI.DB
{
    public partial class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public DateTime? Dob { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Image { get; set; }
        public bool? IsActive { get; set; }
    }
}
