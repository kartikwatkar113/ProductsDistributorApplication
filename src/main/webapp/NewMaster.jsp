<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dapp.service.*,java.util.*,dapp.model.*" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="CSS/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script type='text/javascript' src='JS/myJS.js'></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- main page content -->

	<div class="container-fluid myFlex">


		<!-- left side menu bar -->

		<div class="nav flex-column nav-pills me-3 menubar mt-3 "
			id="v-pills-tab" role="tablist" aria-orientation="vertical">
			<!-- <button class="nav-link active" id="v-pills-home-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button"
				role="tab" aria-controls="v-pills-home" aria-selected="true">Company
				Master</button> -->

			<a class="nav-link active" style='text-align: center;'
				href='SuperAdminDashBoard.jsp'>Company Master</a>


			<button class="nav-link" id="v-pills-profile-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-profile"
				type="button" role="tab" aria-controls="v-pills-profile"
				aria-selected="false">Product Master</button>

			<button class="nav-link" id="v-pills-messages-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-messages"
				type="button" role="tab" aria-controls="v-pills-messages"
				aria-selected="false">Contact</button>
			<button class="nav-link" id="v-pills-settings-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-settings"
				type="button" role="tab" aria-controls="v-pills-settings"
				aria-selected="false">Settings</button>
		</div>


		<!-- content in the left sided menu bar -->

		<div class="content">



			<!-- righ side subcontent -->
			<div class="tab-pane fade show active m-3" id="v-pills-home"
				role="tabpanel" aria-labelledby="v-pills-home-tab">

				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="pills-home-tab"
							data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
							role="tab" aria-controls="pills-home" aria-selected="true">Add
							New Product</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-profile-tab"
							data-bs-toggle="pill" data-bs-target="#pills-profile "
							type="button" role="tab" aria-controls="pills-profile "
							aria-selected="false">View Products</button>
					</li>

					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-profile-tab"
							data-bs-toggle="pill" data-bs-target="#pills-profile "
							type="button" role="tab" aria-controls="pills-profile "
							aria-selected="false">View Vender Wise Products</button>
					</li>

				</ul>
				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">

						<form name='frm' action='VenderCon' method='Post'
							onsubmit="validateForm()">
							<div class="form-group"
								style='display: flex; width: 100%; margin-bottom: 20px;'>
									
									<%
										VenderService vservice=new VenderServiceImpl();
										List<VenderModel> list=vservice.getVenderList();
									%>
								<div style='width: 50%; padding-top: 16px;'>

									<select class="form-control" name='vname'>
										<option>Select Vendor</option>
										<%
											for(VenderModel vmodel:list){
										%>
										<option value="<%=vmodel.getV_id()%>"><%=vmodel.getV_name()%></option>
										<%
											}
									%>
									</select>
									
								</div>
								<div style='margin-left: 10px;'>
									<button id="btn" type="submit" class="btn btn-primary mt-3">Add
										Vendor</button>
								</div>
							</div>

							<div class="form-group"
								style='display: flex; width: 100%; margin-bottom: 20px;'>

								<div style='width: 50%; padding-top: 16px;'>

									<select class="form-control" name='vname'>
										<option>Select Product Category</option>
									</select>
								</div>
								<div style='margin-left: 10px;'>
									<button id="btn" type="submit" class="btn btn-primary mt-3">Add
										Product Category</button>
								</div>
							</div>


							<div class="form-group"
								style='display: flex; width: 100%; margin-bottom: 20px;'>

								<div style='width: 50%; padding-top: 16px;'>

									<select class="form-control" name='vname'>
										<option>Select Product</option>
									</select>
								</div>
								<div style='margin-left: 10px;'>
									<button id="btn" type="submit" class="btn btn-primary mt-3">Add
										Product</button>
								</div>
							</div>


							<div class="form-group" style='margin-top: 35px;'>


								<input id="textvenderProdPrice" type="text" class="form-control"
									name='prodprice' value='' style="width: 50%;"
									placeholder="Enter Product Price" onkeyup="validProdPrice()">
								<div id="errmsgProdPrice" class="form-text"></div>

							</div>

							<div class="form-group" style='margin-top: 35px;'>


								<input id="ProdManDate" type="text" class="form-control"
									name='manDate' value='' style="width: 50%;"
									placeholder="Enter Product Manufacturing Date"
									onkeyup="validProdPrice()">
								<div id="errmsgProdPrice" class="form-text"></div>

							</div>

							<div class="form-group" style='margin-top: 35px;'>


								<input id="ProdExpDate" type="Date" class="form-control"
									name='expDate' value='' style="width: 50%;"
									placeholder="Enter Product Expiry Price">

							</div>
							<div class="form-group" style='margin-top: 15px;'>
								<button id="btn" type="submit" class="btn btn-primary mt-3"
									style='width: 50%;'>Add New Product</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- this is for add vender -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>
</html>