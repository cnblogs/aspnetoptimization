<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Optimization" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Scripts Test</title>
</head>
<body>
    <div>
        MVC JS Bundle: <%: Scripts.Render("~/bundles/js") %><br />
        MVC Mobile JS Bundle: <%: Scripts.Render("~/bundles/mobileJs") %><br />
        MVC Knockout JS Bundle: <%: Scripts.Render("~/bundles/knockoutJs") %><br />
        CDN JS: <%: Scripts.Render("~/bundles/cdnJs") %><br />
        CachingTest: <%: Scripts.Render("~/serverCacheTest") %><br />
        CachingTest Again: <%: Scripts.Render("~/serverCacheTest") %><br />
        Caching Test Process Count: <%= ServerCachingTestTransform.ProcessCount %>
    </div>
</body>
</html>
