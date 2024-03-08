<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Account</title>
    <link rel="stylesheet" href="./CSS/addProduct.css"/>
</head>
<body>
    <div class="header">
        <!-- Header content here -->
    </div>
    <div class="content">
        <div class="content-item">
            <div class="form-update">
                <h5>Update Account</h5>
                <form action="updateAccount" method="post">
                    <input type="hidden" name="accountId" value="<%= request.getAttribute("account_id") %>" />
                    <input type="text" name="fullName" placeholder="Update Name" /> <br />
                    <input type="text" name="email" placeholder="Update Email" /> <br />
                    <input type="text" name="password" placeholder="Update Password" /> <br />
                    <input type="text" name="phone" placeholder="Update Phone" /> <br />
                    <input type="text" name="address" placeholder="Update Address" /> <br />   
                    <div class="button-container">
                        <button type="submit">UPDATE ACCOUNT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
        <!-- Footer content here -->
    </div>
</body>
</html>
