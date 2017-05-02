using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Developer2017.Startup))]
namespace Developer2017
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
