<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Checkout example for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>

  <body class="bg-light">

    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>Checkout form</h2>
        
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Order List</span>
            <span class="badge badge-secondary badge-pill">3</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Product name</h6>
                <small class="text-muted">Brief description</small>
              </div>
              <span class="text-muted">$12</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Second product</h6>
                <small class="text-muted">Brief description</small>
              </div>
              <span class="text-muted">$8</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Third item</h6>
                <small class="text-muted">Brief description</small>
              </div>
              <span class="text-muted">$5</span>
            </li>
            <li class="list-group-item d-flex justify-content-between bg-light">
              <div class="text-success">
                <h6 class="my-0">Promo code</h6>
                <small>EXAMPLECODE</small>
              </div>
              <span class="text-success">-$5</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
              <strong>$20</strong>
            </li>
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Redeem</button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">User information</h4>
          <form class="needs-validation" novalidate>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">User Name</label>
                <%
				String serverIP = "localhost";
	  			String strSID = "orcl";
	   			String portNum = "1521";
	  			String user = "hr";
	   			String pass = "hr";
	  			String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	   			Connection conn = null;
	   			PreparedStatement pstmt;
	   			ResultSet rs;
	   			Class.forName("oracle.jdbc.driver.OracleDriver");
	   			conn = DriverManager.getConnection(url,user,pass);
	   
	   			HttpSession sess = request.getSession();	 
	   			String id = (String)session.getAttribute("id");
	   
	   
	   			String sql;
	   			String name;
	   			
	   			sql="SELECT Cusname FROM CUSTOMER WHERE Customer_id = "+id;
	   			pstmt = conn.prepareStatement(sql);
	   			rs = pstmt.executeQuery();
	  
	   			while(rs.next())
	   			{
	   				name=rs.getString(1);
		      		out.println("<input type='text' class='form-control' id='name' value='"+name+"' placeholder='User name' required>");
	          
	   			}
				%>
                
                <div class="invalid-feedback">
                  Valid user name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="username">User ID</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <%
				
	   			
	   			String userid;
	   			
	   			sql="SELECT Customer_id FROM CUSTOMER WHERE Customer_id = "+id;
	   			pstmt = conn.prepareStatement(sql);
	   			rs = pstmt.executeQuery();
	  
	   			while(rs.next())
	   			{
	   				userid=rs.getString(1);
		      		out.println("<input type='text' class='form-control' id='useid' value='"+userid+"' placeholder='User ID' required>");
	          
	   			}
				%>
                
               
                <div class="invalid-feedback" style="width: 100%;">
                  Your user ID is required.
                </div>
              </div>
            </div>
            
            
          
</body>
            
            <div class="mb-3">
              <label for="username">User Password</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <%
	   			String pwd;
	   			
	   			sql="SELECT Customer_pwd FROM CUSTOMER WHERE Customer_id = "+id;
	   			pstmt = conn.prepareStatement(sql);
	   			rs = pstmt.executeQuery();
	  
	   			while(rs.next())
	   			{
	   				pwd=rs.getString(1);
		      		out.println("<input type='text' class='form-control' id='password' value='"+pwd+"' placeholder='User Password' required>");
	          
	   			}
				%>
               
                <div class="invalid-feedback" style="width: 100%;">
                  Your user password is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Address</label>
              <%
	   			String ads;
	   			
	   			sql="SELECT Address FROM CUSTOMER WHERE Customer_id = "+id;
	   			pstmt = conn.prepareStatement(sql);
	   			rs = pstmt.executeQuery();
	  
	   			while(rs.next())
	   			{
	   				ads=rs.getString(1);
		      		out.println("<input type='text' class='form-control' id='address' value='"+ads+"' placeholder='Address' required>");
	          
	   			}
				%>
             
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="mb-3">
              <label for="address2">Phone Number <span class="text-muted">(Optional)</span></label>
              <%
	   			String phone;
	   			
	   			sql="SELECT Phone FROM CUSTOMER WHERE Customer_id = "+id;
	   			pstmt = conn.prepareStatement(sql);
	   			rs = pstmt.executeQuery();
	  
	   			while(rs.next())
	   			{
	   				phone=rs.getString(1);
		      		out.println("<input type='text' class='form-control' id='phone' value='"+phone+"' placeholder='010-****-****' required>");
	          
	   			}
				%>
             
            </div>

            <div class="row">
              <div class="col-md-4 mb-3">
                <label for="country">Personal Color</label>
                <select class="custom-select d-block w-100" id="country" required>
                  <option value="">����</option>
                  <option>����</option>
                  <option>������</option>
                  <option>������</option>
                  <option>�ܿ���</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid personal color.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">Sex</label>
                <select class="custom-select d-block w-100" id="state" required>
                  <option value="">Male</option>
                  <option>Male</option>
                  <option>Female</option>
                </select>
                <div class="invalid-feedback">
                  Please provide a valid sex.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">Skin Type</label>
                <select class="custom-select d-block w-100" id="state" required>
                  <option value="">����</option>
                  <option>����</option>
                  <option>�߼�</option>
                  <option>�Ǽ�</option>
                  <option>���ռ�</option>
                </select>
                <div class="invalid-feedback">
                  Please provide a valid skin type.
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="save-info">
              <label class="custom-control-label" for="save-info">Save this information for next time</label>
            </div>
            <hr class="mb-4">

            <h4 class="mb-3">Payment</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                <label class="custom-control-label" for="credit">Credit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="debit">Debit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="paypal">Paypal</label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" required>
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
          </form>
        </div>
      </div>

      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2018 Company Name</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../../../assets/js/vendor/popper.min.js"></script>
    <script src="../../../../dist/js/bootstrap.min.js"></script>
    <script src="../../../../assets/js/vendor/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
  </body>
</html>