<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.IO" %>
<%@ OutputCache VaryByParam="*" Duration="120" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        BundleTable.Bundles.Add(new ScriptBundle("~/Scripts2/js"));
        BundleTable.Bundles.ResolveBundleUrl("~/Scripts2/js", true);
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
</body>
</html>
