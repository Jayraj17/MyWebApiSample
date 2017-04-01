using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyTestMVC5.Startup))]
namespace MyTestMVC5
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
