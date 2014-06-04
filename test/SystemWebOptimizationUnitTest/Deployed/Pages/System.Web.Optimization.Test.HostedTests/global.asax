<%@ Application Language="C#" %>
<%@ Import namespace="System.Web.Optimization" %>
<%@ Import namespace="System.Web.Hosting" %>
<%@ Import namespace="System.IO" %>
<%@ Import namespace="System.Collections" %>

<script runat="server">
    public class BundleConfig {
        public static void RegisterBundles(BundleCollection bundles) {
            bundles.UseCdn = true;

            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                "~/Scripts/jquery-{version}.js",
                "~/Scripts/jquery-ui-{version}.js",
                "~/Scripts/jquery.unobtrusive*",
                "~/Scripts/jquery.validate*",
                "~/Scripts/AjaxLogin.js"));

            var cdnJsBundle = new ScriptBundle("~/bundles/cdnJs");
            cdnJsBundle.CdnPath = "http://ajaxasp.net/4.5/5/jqueryBundle.js";
            bundles.Add(cdnJsBundle);

            var cdnCssBundle = new ScriptBundle("~/Content/cdnCss");
            cdnCssBundle.CdnPath = "http://ajaxasp.net/4.5/5/jqueryBundle.css";
            bundles.Add(cdnCssBundle);

            bundles.Add(new ScriptBundle("~/bundles/knockoutJs").Include("~/Scripts/knockout-{version}.js", "~/Scripts/knockout-{version}.debug.js"));

            bundles.Add(new ScriptBundle("~/bundles/mobileJs").Include("~/Scripts/jquery.mobile-{version}.js", "~/Scripts/jquery.mobile-{version}.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include("~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/mobileCss").Include("~/Content/jquery.mobile*"));

            bundles.Add(new StyleBundle("~/Content/themes/base/css").Include(
                "~/Content/themes/base/jquery.ui.core.css",
                "~/Content/themes/base/jquery.ui.resizable.css",
                "~/Content/themes/base/jquery.ui.selectable.css",
                "~/Content/themes/base/jquery.ui.accordion.css",
                "~/Content/themes/base/jquery.ui.autocomplete.css",
                "~/Content/themes/base/jquery.ui.button.css",
                "~/Content/themes/base/jquery.ui.dialog.css",
                "~/Content/themes/base/jquery.ui.slider.css",
                "~/Content/themes/base/jquery.ui.tabs.css",
                "~/Content/themes/base/jquery.ui.datepicker.css",
                "~/Content/themes/base/jquery.ui.progressbar.css",
                "~/Content/themes/base/jquery.ui.theme.css"));
        }
    }
    
    
    public class SubJsMinify : JsMinify {
    }

    public class MyOrderer : IBundleOrderer {
        public IEnumerable<BundleFile> OrderFiles(BundleContext context, IEnumerable<BundleFile> files) {
            return files;
        }
    }

    public class DebugDynamicFolderBundle : DynamicFolderBundle {
        public DebugDynamicFolderBundle(string pathSuffix, IBundleTransform transform, string searchPattern) : base(pathSuffix, searchPattern, transform) {
        }

        public override IEnumerable<BundleFile> EnumerateFiles(BundleContext context) {
            context.EnableInstrumentation = true;
            return base.EnumerateFiles(context);
        }
    }

    public class DebugBundle : Bundle {
        public DebugBundle(string path)
            : base(path) {
        }

        public override IEnumerable<BundleFile> EnumerateFiles(BundleContext context) {
            context.EnableInstrumentation = true;
            return base.EnumerateFiles(context);
        }
    }

    void EnableDefaultBundles(BundleCollection col) {
        col.Add(new DynamicFolderBundle("js", "*.js", new JsMinify()));
        col.Add(new DynamicFolderBundle("css", "*.css", new CssMinify()));
    }
            
    void Application_Start(object sender, EventArgs e) {
        // Code that runs on application startup
        EnableDefaultBundles(BundleTable.Bundles);

        BundleTable.Bundles.IgnoreList.Ignore("*.ignored.a");

        DynamicFolderBundle bundle = new DynamicFolderBundle("txt", "*.txt", true, new JsMinify());
        BundleTable.Bundles.Add(bundle);
        bundle = new DynamicFolderBundle("hao", "*.hao", true, new JsMinify());
        BundleTable.Bundles.Add(bundle);
        bundle = new DynamicFolderBundle("jsrec", "*.js", true, new JsMinify());
        BundleTable.Bundles.Add(bundle);
        bundle = new DynamicFolderBundle("none", "*.txt");
        BundleTable.Bundles.Add(bundle);
        bundle = new DynamicFolderBundle("txt2", "*.txt", new JsMinify());
        BundleTable.Bundles.Add(bundle);
        bundle = new DynamicFolderBundle("err", "*.err", new CssMinify());
        BundleTable.Bundles.Add(bundle);
        BundleTable.Bundles.Add(new ScriptBundle("~/static1")
            .IncludeDirectory("~/Include", "*.b", true)
            .IncludeDirectory("~/Include", "*.a")
            .Include("~/Include/c.c"));
        Bundle bundle3 = new ScriptBundle("~/static2");
        bundle3.IncludeDirectory("~/Include", "*.b", true);
        bundle3.IncludeDirectory("~/Include", "*.a");
        bundle3.Orderer = new MyOrderer();
        BundleTable.Bundles.Add(bundle3);
        BundleFileSetOrdering order = new BundleFileSetOrdering("testOrder");
        order.Files.Add("b.a");
        order.Files.Add("a.a");
        BundleTable.Bundles.FileSetOrderList.Add(order);

        // NOTE: This duplicate order should have no effect, but it ensures that we eliminate duplicates across file sets
        BundleFileSetOrdering dup = new BundleFileSetOrdering("dupeOrder");
        order.Files.Add("a.a");
        order.Files.Add("a.a");
        BundleTable.Bundles.FileSetOrderList.Add(dup);

        BundleTable.Bundles.Add(new ScriptBundle("~/exists.foo"));
        Bundle dupeBundle = new ScriptBundle("~/dup");
        dupeBundle.Include("~/Include/a.a",
            "~/Include/c.c",
            "~/Include/c.c",
            "~/Include/a.a",
            "~/Include/c.c",
            "~/c.c");
        BundleTable.Bundles.Add(dupeBundle); 

        // Register a static bundle and dynamic bundle and verify that static wins
        BundleTable.Bundles.Add(new ScriptBundle("~/Include/a"));
        BundleTable.Bundles.Add(new DynamicFolderBundle("a", "*.a", true, new JsMinify())); 

        Bundle uberBundle = new ScriptBundle("~/uber");
        uberBundle.Include("~/jquery/*.js", 
            "~/dojo/*.js",
            "~/ext/*.js",
            "~/prototype/*.js",
            "~/moo/*.js",
            "~/mod/*.js");
        BundleTable.Bundles.Add(uberBundle);

        BundleTable.Bundles.Add(new ScriptBundle("~/jqueryv").Include("~/jquery/jquery-{version}.js"));
        BundleTable.Bundles.Add(new ScriptBundle("~/jqueryuiv").Include("~/jquery/jquery-ui{version}.js"));

        Bundle replacementBundle = new Bundle("~/replacementTestWithOptAndMin");
        BundleTable.Bundles.FileExtensionReplacementList.Add("opt");
        replacementBundle.Include("~/replacement/*.js", "~/replacement/*.txt");
        BundleTable.Bundles.Add(replacementBundle);

        Bundle replacementOffBundle = new Bundle("~/replacementOffTest");
        replacementOffBundle.Include("~/replacement/*.js", "~/replacement/*.txt");
        replacementOffBundle.EnableFileExtensionReplacements = false;
        BundleTable.Bundles.Add(replacementOffBundle);

        // ResetCssFirstByDefaulTest
        Bundle resetFirstBundle = new StyleBundle("~/resetTest");
        resetFirstBundle.Include("~/jquery/*.css");
        resetFirstBundle.Include("~/cssd/*.css");
        BundleTable.Bundles.Add(resetFirstBundle);

        // Mimic default Js/css debug bundles
        Bundle jsBundle = new DebugDynamicFolderBundle("jsdebug", new JsMinify(), "*.js");
        BundleTable.Bundles.Add(jsBundle);

        Bundle cssBundle = new DebugDynamicFolderBundle("cssdebug", new CssMinify(), "*.css");
        BundleTable.Bundles.Add(cssBundle);

        BundleTable.Bundles.Add(new DebugBundle("~/staticdebug").Include("~/a.txt", "~/b.txt"));

        Bundle concat1 = new Bundle("~/concatHashToken").Include("~/concat/*.test");
        concat1.ConcatenationToken = "#";
        BundleTable.Bundles.Add(concat1);

        BundleTable.Bundles.Add(new Bundle("~/concatNoToken").Include("~/concat/*.test"));

        BundleTable.Bundles.Add(new Bundle("~/concatJsMinify", new SubJsMinify()).Include("~/concat/*.js"));
        
        BundleTable.Bundles.Add(new ScriptBundle("~/concatJs").Include("~/concat/*.js"));

        Bundle concatJsNoMinify = new Bundle("~/concatJsNoMinify").Include("~/concat/*.js");
        concatJsNoMinify.ConcatenationToken = ";";
        BundleTable.Bundles.Add(concatJsNoMinify);

        BundleTable.Bundles.Add(new Bundle("~/serverCacheTest", new ServerCachingTestTransform()));

        BundleTable.Bundles.Add(new ScriptBundle("~/lastmodified").Include("~/jquery/jquery-{version}.js"));
        BundleTable.Bundles.Add(new ScriptBundle("~/bogusversion").Include("~/jquery/jquery-{version}.js"));
                
        BundleConfig.RegisterBundles(BundleTable.Bundles);
    }
    
</script>
