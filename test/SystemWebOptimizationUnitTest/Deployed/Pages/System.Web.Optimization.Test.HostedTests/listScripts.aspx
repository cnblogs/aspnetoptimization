<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Optimization" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Registered Bundle List</title>
</head>
<body>
    <div>
        <% Response.Write(Scripts.Url("~/js")); %><br />
        <% Response.Write(Scripts.Url("~/css")); %><br />
        <% Response.Write(Scripts.Url("~/nested/js")); %><br />
        <% Response.Write(Scripts.Url("~/static1")); %><br />
    </div>
</body>
</html>
