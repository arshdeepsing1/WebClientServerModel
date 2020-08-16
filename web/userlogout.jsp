<%
    session.removeAttribute("userEmail");
    response.sendRedirect("start.jsp");
%>
