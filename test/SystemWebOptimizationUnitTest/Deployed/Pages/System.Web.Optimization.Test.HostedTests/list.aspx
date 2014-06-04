<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Optimization" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Registered Bundle List</title>
</head>
<body>
    <div>
        <% Response.Write(BundleTable.Bundles.ResolveBundleUrl("~/js", false)); %><br />
        <% Response.Write(BundleTable.Bundles.ResolveBundleUrl("~/css", false)); %><br />
        <% Response.Write(BundleTable.Bundles.ResolveBundleUrl("~/nested/js", false)); %><br />
        <% Response.Write(BundleTable.Bundles.ResolveBundleUrl("~/static1", false)); %><br />
    </div>
</body>
</html>
