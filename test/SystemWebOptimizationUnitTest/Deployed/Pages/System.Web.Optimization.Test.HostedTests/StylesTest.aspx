<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Optimization" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Styles Test</title>
</head>
<body>
    <div>
        MVC Template CSS: <%: Styles.Render("~/Content/themes/base/css", "~/Content/css") %><br />
        MVC Mobile CSS: <%: Styles.Render("~/Content/mobileCss") %><br />
        CDN CSS: <%: Styles.Render("~/Content/cdnCss") %><br />
        CachingTest: <%: Styles.Render("~/serverCacheTest") %><br />
        CachingTest Again: <%: Styles.Render("~/serverCacheTest") %><br />
        Caching Test Process Count: <%= ServerCachingTestTransform.ProcessCount %>
        IncludeDirectoryTest: <%: Styles.Render("~/static2") %><br />
    </div>
</body>
</html>
