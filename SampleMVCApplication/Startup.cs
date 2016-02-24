using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SampleMVCApplication.Startup))]
namespace SampleMVCApplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
