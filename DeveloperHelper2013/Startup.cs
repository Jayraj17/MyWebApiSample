using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DeveloperHelper2013.Startup))]
namespace DeveloperHelper2013
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
