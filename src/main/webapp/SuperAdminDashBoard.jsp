<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<button class="nav-link active" id="v-pills-home-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button"
				role="tab" aria-controls="v-pills-home" aria-selected="true">Company
				Master</button>
			<!-- 	<a class="nav-link active"  style='text-align: center;' href='SuperAdminDashBoard.jsp'>Company
				Master</a> -->
				
			<!-- <button class="nav-link" id="v-pills-profile-tab"
				data-bs-toggle="pill" data-bs-target="#v-pills-profile"
				type="button" role="tab" aria-controls="v-pills-profile"
				aria-selected="false" >Product Master</button> -->

			<a class="nav-link" 
				style='text-align: center;' href='NewMaster.jsp'>Product Master</a>
				
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

			<!-- right side content -->
			<div class="tab-content" id="v-pills-tabContent">

				<!-- righ side subcontent -->
				<div class="tab-pane fade show active m-3" id="v-pills-home"
					role="tabpanel" aria-labelledby="v-pills-home-tab">

					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="pills-home-tab"
								data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
								role="tab" aria-controls="pills-home" aria-selected="true">Add
								vendor</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-profile-tab"
								data-bs-toggle="pill" data-bs-target="#pills-profile "
								type="button" role="tab" aria-controls="pills-profile "
								aria-selected="false">View Vendor</button>
						</li>


					</ul>


					<!-- this is for add vender -->
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">

							<form name='frm' action='VenderCon' method='Post'
								onsubmit="validateForm()">
								<div class="form-group">

									<label for="exampleInputEmail1" class="form-label">Enter
										Vender Name</label> <input id="textvender" type="text"
										class="form-control" name='vname' value='' style="width: 50%;"
										onkeyup="validVender()">
									<div id="errmsg" class="form-text"></div>

									<button id="btn" type="submit" class="btn btn-primary mt-3">Submit</button>

								</div>
							</form>


						</div>

						<!-- this is for view vender -->

						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">

							<!-- this is for search vender and this is in View Vender-->

							<div class="VendSearch">
								<form name='frm' action='VenderCon' method='Post'
									onsubmit="validateForm()">
									<div class="form-group">

										<label for="exampleInputEmail1" class="form-label">Enter
											Vender Name for Search</label> <input id="textvender" type="text"
											class="form-control" name='vname' value=''
											style="width: 50%;"
											onkeyup="searchVenderUsingAjax(this.value)">
										<div id="errmsg" class="form-text"></div>
									</div>
								</form>

							</div>

							<div id="showGrid">
								<table class="table table-striped table-hover mt-3"
									style="border: 1px solid black; width: 70%;">
									<thead>
										<tr>
											<th scope="col">Sr. No</th>
											<th scope="col">Vendor ID</th>
											<th scope="col">Vendor Name</th>
											<th scope="col">Delete</th>
											<th scope="col">Update</th>
										</tr>
									</thead>
									<tbody>
										<%@page import="dapp.service.*, dapp.model.*, java.util.*"%>

										<%!VenderService vservice = new VenderServiceImpl();%>
										<%
										try {
											List<VenderModel> vlist = vservice.getVenderList();
											int count = 0;
										%>
										<%
										for (VenderModel vmodel : vlist) {
										%>
										<tr>
											<th scope="row"><%=++count%></th>
											<td><%=vmodel.getV_id()%></td>
											<td><%=vmodel.getV_name()%></td>
											<td style="color: blue;"><a
												href='delete?vid=<%=vmodel.getV_id()%>'
												style="text-decoration: none">DELETE</a></td>
											<td style="color: blue;"><a href=''
												style="text-decoration: none">UPDATE</a></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
							<%
							} catch (Exception ex) {
							%>
							<!-- <div id="showGrid">
								<table class="table table-striped table-hover mt-3"
									style="border: 1px solid black; width: 70%;">
									<thead>
										<tr>
											<th scope="col">Sr. No</th>
											<th scope="col">Vendor ID</th>
											<th scope="col">Vendor Name</th>
											<th scope="col">Delete</th>
											<th scope="col">Update</th>
										</tr>
									</thead>

									</table>
								</div>  -->
							<%
							}
							%>
							</thead>

							</table>
						</div>


					</div>

				</div>



				<!-- this is upto company -->

				<!-- <div class="tab-pane fade show active" id="v-pills-home"
					role="tabpanel" aria-labelledby="v-pills-home-tab">This is
					some placeholder content the Home tab's associated content.
					Clicking another tab will toggle the visibility of this one for the
					next. The tab JavaScript swaps classes to control the content
					visibility and styling. You can use it with tabs, pills, and any
					other .nav-powered navigation.</div> -->


				<!-- this is for product master -->

				<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
					aria-labelledby="v-pills-profile-tab">

					<div class="tab-content" id="v-pills-tabContent">

						<!-- righ side subcontent -->
						<div class="tab-pane fade show active m-3" id="v-pills-home"
							role="tabpanel" aria-labelledby="v-pills-home-tab">

							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="pills-home-tab"
										data-bs-toggle="pill" data-bs-target="#pills-home"
										type="button" role="tab" aria-controls="pills-home"
										aria-selected="true">Add New Product</button>
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


							<!-- this is for add vender -->
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="pills-home"
									role="tabpanel" aria-labelledby="pills-home-tab">

									<form name='frm' action='VenderCon' method='Post'
										onsubmit="validateForm()">
										<div class="form-group">

											<label for="exampleInputEmail1" class="form-label">Enter
												Product Name</label> <input id="textvender" type="text"
												class="form-control" name='vname' value=''
												style="width: 50%;" onkeyup="validVender()">
											<div id="errmsg" class="form-text"></div>

											<button id="btn" type="submit" class="btn btn-primary mt-3">Submit</button>

										</div>
									</form>


								</div>

								<!-- this is for view vender -->

								<div class="tab-pane fade" id="pills-profile" role="tabpanel"
									aria-labelledby="pills-profile-tab">

									<%-- <%@page import="dapp.service.*, dapp.model.*, java.util.*"%>

							<%!VenderService vservice = new VenderServiceImpl();%>
							<%
							
							
							List<VenderModel> vlist = vservice.getVenderList();
							int count = 0;
							%> --%>

									<!-- this is for search vender and this is in View Vender-->
									<!-- <div class="tab-pane fade"  id="pills-contact"  role="tabpanel" 
							
								aria-labelledby="pills-contact-tab">-->
									<div class="VendSearch">
										<form name='frm' action='VenderCon' method='Post'
											onsubmit="validateForm()">
											<div class="form-group">

												<label for="exampleInputEmail1" class="form-label">Enter
													Vender Name for Search</label> <input id="textvender" type="text"
													class="form-control" name='vname' value=''
													style="width: 50%;"
													onkeyup="searchVenderUsingAjax(this.value)">
												<div id="errmsg" class="form-text"></div>
											</div>
										</form>

									</div>

									<div id="showGrid"></div>


								</div>

							</div>





						</div>


						<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
							aria-labelledby="v-pills-messages-tab">This is some
							placeholder content the Profile tab's associated content.
							Clicking another tab will toggle the visibility of this one for
							the next. The tab JavaScript swaps classes to control the content
							visibility and styling. You can use it with tabs, pills, and any
							other .nav-powered navigation.</div>


						<!-- <div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
					aria-labelledby="v-pills-settings-tab">This is some
					placeholder content the Profile tab's associated content. Clicking
					another tab will toggle the visibility of this one for the next.
					The tab JavaScript swaps classes to control the content visibility
					and styling. You can use it with tabs, pills, and any other
					.nav-powered navigation.</div> -->
					</div>

				</div>

			</div>

		</div>

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