using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(newBabyQuick.Startup))]
namespace newBabyQuick
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
