using System;
using System.Collections.Generic;

namespace CrudAPI.DB
{
    public partial class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }
        public bool? IsActiveAccessToken { get; set; }
        public bool? IsActiveRefreshToken { get; set; }
        public string Name { get; set; }
    }
}
