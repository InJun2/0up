<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Projects</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" integrity="sha384-ejwKkLla8gPP8t2u0eQyL0Q/4ItcnyveF505U0NIobD/SMsNyXrLti6CWaD0L52l" crossorigin="anonymous">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap');
  body{font-family: 'Nanum Gothic', sans-serif;}
  </style>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
 
<!-- Site wrapper -->
<div class="wrapper">
  <%@ include file="../../common/menubar-sidebar.jsp" %>

  <!-- Main Sidebar Container -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>ํ๋งค์๋ ฅ</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card"></div>
        <div class="card-body p-0">
		<form action="" method="post"> <!-- cbj -->
          <div class="row" style="background-color: rgb(196, 194, 194); margin: 20px; padding: 6px;">
                <div class="col-sm-1 mt-3" style="padding:5px;"><b>์ผ์</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">  
                  <div class="col">
                    <input type="date" id="saleDate" name="saleDate" class="form-control mb-3 mt-3" placeholder="๊ธฐํ">
                  </div>
                </div>

                <div class="col-sm-1 mt-3" style="padding:5px;"><b>๊ฑฐ๋์ฒ</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">                  
                  <div class="input-group col mt-3">
                    <input id="cNo" type="text" name="cNo" class="form-control" placeholder="๊ฑฐ๋์ฒ">
                    <button type="button" class="input-group-text" onclick="goPopup()"><i class="bi bi-search"></i></button>
                    <input id="cName" type="text" class="form-control" readonly>
                  </div>
                </div>

                <div class="col-sm-1" style="padding:5px;"><b>๋ด๋น์</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="input-group col mb-3">
                    <input type="text" id="employeeNo" name="employeeNo" class="form-control" placeholder="๋ด๋น์">
                    <button type="button" class="input-group-text" onclick="employeePopup()"><i class="bi bi-search"></i></button>
                    <input type="text" id="employeeName" class="form-control" readonly id="id">
                    <input type="hidden" id="teamCode" class="form-control">
                  </div>
                </div>

                <div class="col-sm-1" style="padding:5px;"><b>์ถํ์ฐฝ๊ณ </b>
                </div><div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="input-group col">
                    <input type="text" name="wareHouseNo" id="warehouseNo" class="form-control" placeholder="์ถํ์ฐฝ๊ณ ">
                    <button onclick="warehousePopup()" type="button" class="input-group-text"><i class="bi bi-search"></i></button>
                    <input id="warehouseName" type="text" class="form-control" readonly>
                  </div>
                </div>

                <div class="col-sm-1" style="padding:5px;"><b>๊ฑฐ๋์ ํ</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="col">
                    <select id="bugaYN" name="vatYN" class="form-control mb-3">
                      <option value="Y">๋ถ๊ฐ์ธ์ ์ฉ</option>
                      <option value="N">๋ถ๊ฐ์ธ๋ฏธ์ ์ฉ</option>
                    </select>
                  </div>
                </div>

				<div class="col-sm-1" style="padding:5px;"><b>ํ๋ก์ ํธ</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="input-group col mb-3">
                    <input type="text" name="projectNo" id="projectNo" class="form-control" placeholder="ํ๋ก์ ํธ">
                    <button type="button" onclick="projectPopup()" class="input-group-text"><i class="bi bi-search"></i></button>
                    <input type="text" id="projectName" class="form-control" readonly>
                  </div>
                </div>
                
                <div class="col-sm-1" style="padding:5px;"><b>๋ฏธ์๊ธ์ก(์  ์์ก)</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="col">
                    <input type="text" id="aUmoney" class="form-control mb-3" placeholder="๋ฏธ์๊ธ์ก" readonly>
                  </div>
                </div>
                
                <div class="col-sm-1" style="padding:5px;"><b>๋ฏธ์๊ธ์ก(ํ์์ก)</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="col">
                    <input type="text" id="sUmoney" name="sUmoney" class="form-control mb-3" placeholder="๋ฏธ์๊ธ์ก" readonly>
                  </div>
                </div>
          </div>
		
          <div style="margin: 10px;">
            <button type="button">์ฐพ๊ธฐ</button>
            <button type="button">๊ฑฐ๋๋ด์ญ๋ณด๊ธฐ</button>
            <button type="button" onclick="productPopup()">Myํ๋ชฉ</button>
            <button type="button" onclick="orderPopup()">์ฃผ๋ฌธ</button>
            <button onclick="addProduct()" type="button">+</button>
	       </div>
			<input id="index" type="hidden" value="2">
			<input id="index2" type="hidden" value="1">
			<table class="table table-bordered projects">
				<thead>
					<tr>
						<th style="width: 10%" class="text-center">ํ๋ชฉ์ฝ๋</th>
						<th style="width: 15%" class="text-center">ํ๋ชฉ๋ช</th>
						<th style="width: 9%" class="text-center">์๋</th>
						<th style="width: 13%" class="text-center">๋จ๊ฐ</th>
						<th style="width: 14%" class="text-center">๊ณต๊ธ๊ฐ์ก</th>
						<th style="width: 13%" class="text-center">๋ถ๊ฐ์ธ</th>
						<th style="width: 20%" class="text-center">๋ฉ๊ธฐ์ผ์</th>
					</tr>
				</thead>
				<tbody id="product">
					<tr>
						<td>
							<div class="input-group" style="margin: 0px">
							<input id="productNo1" name="voList[0].pNo" type="number" class="form-control"
							placeholder="100">
							<button type="button" class="input-group-text" onclick="productPopup('1')"><i class="bi bi-search"></i></button>
							</div>
						</td>
						<td class="project_progress">
							<input id="productName1" type="text"
							class="form-control" placeholder="๋จ๋จํ๋">
						</td>
						<td>
							<input onchange="calcResult()" id="count1" name="voList[0].sQnt" type="number" class="form-control"
							placeholder="1000">
						</td>
						<td>
						<input onchange="calcResult()" id="price1" type="number" class="form-control"
							placeholder="3000์">
						</td>
						<td>
						<input id="result1" name="voList[0].sPrice" class="form-control"
							readonly="readonly" value="0">
						</td>
						<td>
						<input id="buga1" type="number" class="form-control"
							value="0">
						</td>
						<td>
						<input name="voList[0].sDeliberyDate" type="date" class="form-control"
							placeholder="2022-04-18">
						</td>
					
				</tbody>
			</table>
			<div style="margin: 10px;">
            <button type="submit" class="btn btn-secondary btn-sm">์ ์ฅ</button>
            <button type="button" class="btn btn-secondary btn-sm">์ ์ฅ/์ ํ</button>
            <button type="button" class="btn btn-secondary btn-sm">๋ค์์์ฑ</button>
            <button type="button" class="btn btn-secondary btn-sm">๋ฆฌ์คํธ</button>
          </div>
		</form> <!-- cbj -->
        </div>
        <!-- /.card-body -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <%@ include file="../../common/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
<!-- ./wrapper -->
</div>
<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
	var employeePopup = function() { 
		var url = "${path}/popup";
		var windowTargetName = "employee";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	} 
	var goPopup = function() {
        var search = window.open("${path}/popup/searchClient?search=","search","width=800,height=420, scrollbars=yes, resizable=no"); 
    }
	var warehousePopup = function() {
		var url = "${path}/popup/warehouseList";
		var windowTargetName = "warehouse";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	var projectPopup = function() {
		var url = "${path}/popup/projectList";
		var windowTargetName = "project";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	/* product */
	var addProduct = function() {
		var indexdoc = document.getElementById('index')
		var index =  parseInt(indexdoc.value);
		var indexdoc2 = document.getElementById('index2')
		var index2 = parseInt(indexdoc2.value);
		var tag = "<tr><td><div class='input-group' style='margin: 0px'><input id='productNo" + index + "' name='voList[" + index2 + "].pNo' type='number' class='form-control'placeholder='100'><button type='button' class='input-group-text' onclick=\"productPopup('" + index + "')\"><i class='bi bi-search'></i></button></div></td><td class='project_progress'><input id='productName" + index + "' type='text'class='form-control' placeholder='๋จ๋จํ๋'></td><td><input onchange='calcResult()' id='count" + index + "' name='voList[" + index2 + "].sQnt' type='number' class='form-control'placeholder='1000'></td><td><input onchange='calcResult()' id='price" + index + "' type='number' class='form-control'placeholder='3000'></td><td><input id='result" + index + "' name='voList[" + index2 + "].sPrice' class='form-control'readonly='readonly' value='0'></td><td><input id='buga" + index + "' type='number' class='form-control' value='0'></td><td><input name='voList[" + index2 + "].sDeliberyDate' type='date' class='form-control'placeholder='2022-04-18'></td></tr>";
		indexdoc.value = index + 1;
		indexdoc2.value = index2 + 1;
		$('#product').append(tag);
	}
	
	var productPopup = function(index) {
		var url = "${path}/popup/productList/" + index;
		var windowTargetName = "product";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	var orderPopup = function() {
		var url = "${path}/popup/orderList/";
		var windowTargetName = "order";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	var calcResult = function() {
		var indexdoc = document.getElementById('index')
		var index =  parseInt(indexdoc.value);
		var bugaYN = document.getElementById('bugaYN');
		var bugaValue = bugaYN.options[bugaYN.selectedIndex].text;
		var sUmoney = document.getElementById('sUmoney');
		var aUmoney = document.getElementById('aUmoney');
		var sumPrice = parseInt(aUmoney.value);
		
		for(let i = 1; i < index; i++) {
			var count = document.getElementById('count' + i).value;
			var price = document.getElementById('price' + i).value;
			var result = document.getElementById('result' + i);
			var buga = document.getElementById('buga' + i);
			
			var result1 = count * price;
			result.value = result1;
			
			if(bugaValue == '๋ถ๊ฐ์ธ์ ์ฉ'){
				var result2 = result1 * 0.1;
				buga.value = result2;
			}else {
				buga.value = 0;
			}
			
			if(i == index) {
				break;
			}
			sumPrice += result1;
					
		}
		
		sUmoney.value = sumPrice;
	}
</script>
</body>
</html>
