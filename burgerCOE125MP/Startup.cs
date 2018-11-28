using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(burgerCOE125MP.Startup))]
namespace burgerCOE125MP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
