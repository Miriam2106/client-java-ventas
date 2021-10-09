<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String context = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=context%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/css/style.css">
    <title>Ventas</title>
</head>
<body onload="customers(), products(), office(), productLines()">
<div class="container-fluid">
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-link active" id="nav-customer-tab" data-toggle="tab" href="#nav-customer" role="tab" aria-controls="nav-home" aria-selected="true">Customer</a>
            <a class="nav-link" id="nav-products-tab" data-toggle="tab" href="#nav-products" role="tab" aria-controls="nav-profile" aria-selected="false">Products</a>
            <a class="nav-link" id="nav-productLine-tab" data-toggle="tab" href="#nav-productLine" role="tab" aria-controls="nav-profile" aria-selected="false">Product lines</a>
            <a class="nav-link" id="nav-offices-tab" data-toggle="tab" href="#nav-offices" role="tab" aria-controls="nav-contact" aria-selected="false">Offices</a>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <!--CUSTOMER -->
        <div class="tab-pane fade show active" id="nav-customer" role="tabpanel" aria-labelledby="nav-customer-tab">
            <div class="modal fade modal-customer"  style="color: white;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                MODIFY
                            </div>
                            <div class="card-body text-dark">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Customer number:<i style="color: red">*</i></label>
                                            <input type="number" id="customerNumber1" name="customerNumber" class="form-control" required readonly>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Customer name:<i style="color: red">*</i></label>
                                            <input type="text" id="customerName1" name="customerName" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Contact firstname:<i style="color: red">*</i></label>
                                            <input type="text" id="contactFirstname1" name="contactFirstname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Contact lastname:<i style="color: red">*</i></label>
                                            <input type="text" id="contactLastname1" name="contactLastname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 1:<i style="color: red">*</i></label>
                                            <input type="text" id="addressL1" name="address1"class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 2:</label>
                                            <input type="text" id="addressL2" name="address2" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>City:<i style="color: red">*</i></label>
                                            <input type="text" id="city1" name="city" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>State:</label>
                                            <input type="text" id="state1" name="state" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Country:<i style="color: red">*</i></label>
                                            <input type="text" id="country1" name="country" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Postal code:</label>
                                            <input type="text" id="code1" name="code" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Sales rep emp number:</label>
                                            <input type="number" id="salesRep1" name="salesRep" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Credit limit:</label>
                                            <input type="text" id="credit1" name="credit" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Phone:<i style="color: red">*</i></label>
                                            <input type="text" id="phone1" name="phone"class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="updateCustomer()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div>
                    <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                        <div class="card-header text-white" style="background-color: #8E1451;">
                            CUSTOMERS
                        </div>
                        <div class="card-body table-wrapper-scroll-y my-custom-scrollbar">
                            <table id="table" class="table table-responsive table-hover table-light">
                                <thead>
                                <tr>
                                    <th scope="col" class="text-center">Modify</th>
                                    <th scope="col" class="text-center">Delete</th>
                                    <th scope="col">Customer number</th>
                                    <th scope="col">Customer name</th>
                                    <th scope="col">Contact firstname</th>
                                    <th scope="col">Contact lastname</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address line 1</th>
                                    <th scope="col">Address line 2</th>
                                    <th scope="col">City</th>
                                    <th scope="col">State</th>
                                    <th scope="col">Postal code</th>
                                    <th scope="col">Country</th>
                                    <th scope="col">Sales rep employee number</th>
                                    <th scope="col">Credit limit</th>
                                </tr>
                                </thead>
                                <tbody id="tbody"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="m-0 vh-100 justify-content-center row align-items-center">
                    <section id="createPerson">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                REGISTRATION
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Customer number:<i style="color: red">*</i></label>
                                            <input type="number" id="customerNumber" name="customerNumber" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Customer name:<i style="color: red">*</i></label>
                                            <input type="text" id="customerName" name="customerName" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Contact firstname:<i style="color: red">*</i></label>
                                            <input type="text" id="contactFirstname" name="contactFirstname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Contact lastname:<i style="color: red">*</i></label>
                                            <input type="text" id="contactLastname" name="contactLastname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 1:<i style="color: red">*</i></label>
                                            <input type="text" id="address1" name="address1"class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 2:</label>
                                            <input type="text" id="address2" name="address2" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>City:<i style="color: red">*</i></label>
                                            <input type="text" id="city" name="city" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>State:</label>
                                            <input type="text" id="state" name="state" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Country:<i style="color: red">*</i></label>
                                            <input type="text" id="country" name="country" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6 col-sm-3">
                                        <div class="form-group text-left">
                                            <label>Postal code:</label>
                                            <input type="text" id="code" name="code" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6 col-sm-3">
                                        <div class="form-group text-left">
                                            <label>Sales rep employee number:</label>
                                            <input type="number" id="salesRep" name="salesRep" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6 col-sm-3">
                                        <div class="form-group text-left">
                                            <label>Credit limit:</label>
                                            <input type="text" id="credit" name="credit" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6 col-sm-3">
                                        <div class="form-group text-left">
                                            <label>Phone:<i style="color: red">*</i></label>
                                            <input type="text" id="phone" name="phone"class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="insertCustomer()">Register</button>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- PRODUCTS -->
        <div class="tab-pane fade" id="nav-products" role="tabpanel" aria-labelledby="nav-products-tab">
            <div class="modal fade modal-product"  style="color: white;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                MODIFY
                            </div>
                            <div class="card-body text-dark">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product code:<i style="color: red">*</i></label>
                                            <input type="text" id="productCode1"class="form-control" required readonly>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product name:<i style="color: red">*</i></label>
                                            <input type="text" id="productName1" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product line:<i style="color: red">*</i></label>
                                            <input type="text" id="productLine1" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product scale:<i style="color: red">*</i></label>
                                            <input type="text" id="productScale1" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product vendor:<i style="color: red">*</i></label>
                                            <input type="text" id="productVendor1" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product description:<i style="color: red">*</i></label>
                                            <input type="text" id="productDescription1" name="address2" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Quantity:<i style="color: red">*</i></label>
                                            <input type="number" id="quantity1" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Buy price:<i style="color: red">*</i></label>
                                            <input type="number" id="buyPrice1" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>MSRP:<i style="color: red">*</i></label>
                                            <input type="number" id="msrp1" class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="updateProduct()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div>
                    <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                        <div class="card-header text-white" style="background-color: #8E1451;">
                            PRODUCTS
                        </div>
                        <div class="card-body table-wrapper-scroll-y my-custom-scrollbar">
                            <table id="table2" class="table table-responsive table-hover table-light">
                                <thead>
                                <tr>
                                    <th scope="col" class="text-center">Modify</th>
                                    <th scope="col" class="text-center">Delete</th>
                                    <th scope="col">Product code</th>
                                    <th scope="col">Product name</th>
                                    <th scope="col">Product line</th>
                                    <th scope="col">Product scale</th>
                                    <th scope="col">Product vendor</th>
                                    <th scope="col">Product description</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="m-0 vh-100 justify-content-center row align-items-center">
                    <section id="createProduct">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                REGISTRATION
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product code:<i style="color: red">*</i></label>
                                            <input type="text" id="productCode" name="customerNumber" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product name:<i style="color: red">*</i></label>
                                            <input type="text" id="productName" name="customerName" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product line:<i style="color: red">*</i></label>
                                            <input type="text" id="productLine" name="contactFirstname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product scale:<i style="color: red">*</i></label>
                                            <input type="text" id="productScale" name="contactLastname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product vendor:<i style="color: red">*</i></label>
                                            <input type="text" id="productVendor" name="address1"class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product description:<i style="color: red">*</i></label>
                                            <input type="text" id="productDescription" name="address2" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Quantity:<i style="color: red">*</i></label>
                                            <input type="text" id="quantity" name="city" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Buy price:<i style="color: red">*</i></label>
                                            <input type="text" id="buyPrice" name="state" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>MSRP:<i style="color: red">*</i></label>
                                            <input type="text" id="msrp" name="country" class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="insertProduct()">Register</button>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- PRODUCT LINES -->
        <div class="tab-pane fade" id="nav-productLine" role="tabpanel" aria-labelledby="nav-productLine-tab">
            <div class="modal fade modal-productline"  style="color: white;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                MODIFY
                            </div>
                            <div class="card-body text-dark">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product line:<i style="color: red">*</i></label>
                                            <input type="text" id="productL1" name="customerNumber" class="form-control" required readonly>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Text description:<i style="color: red">*</i></label>
                                            <input type="text" id="txtDesc1" name="contactFirstname" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Html description:<i style="color: red">*</i></label>
                                            <input type="text" id="htmlDesc1" name="contactLastname" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Image:</label>
                                            <input type="text" id="image1" name="address1"class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="updateProductLine()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div>
                    <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                        <div class="card-header text-white" style="background-color: #8E1451;">
                            PRODUCTS
                        </div>
                        <div class="card-body table-wrapper-scroll-y my-custom-scrollbar">
                            <table id="table3" class="table table-responsive table-hover table-light">
                                <thead>
                                <tr>
                                    <th scope="col" class="text-center">Modify</th>
                                    <th scope="col" class="text-center">Delete</th>
                                    <th scope="col">Product line</th>
                                    <th scope="col">Text description</th>
                                    <th scope="col">HTML description</th>
                                    <th scope="col">Image</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="m-0 vh-100 justify-content-center row align-items-center">
                    <section id="createProductLine">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                REGISTRATION
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Product line:<i style="color: red">*</i></label>
                                            <input type="text" id="productL" name="customerNumber" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Text description:<i style="color: red">*</i></label>
                                            <input type="text" id="txtDesc" name="contactFirstname" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Html description:<i style="color: red">*</i></label>
                                            <input type="text" id="htmlDesc" name="contactLastname" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Image:</label>
                                            <input type="number" id="image" name="address1"class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="insertProductLine()">Register</button>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- OFFICES -->
        <div class="tab-pane fade" id="nav-offices" role="tabpanel" aria-labelledby="nav-offices-tab">
            <div class="modal fade modal-office"  style="color: white;" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                MODIFY
                            </div>
                            <div class="card-body text-dark">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Office code:<i style="color: red">*</i></label>
                                            <input type="text" id="officeCode1" name="customerNumber" class="form-control" required readonly>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Phone:<i style="color: red">*</i></label>
                                            <input type="text" id="phoneOf1" name="contactFirstname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 1:<i style="color: red">*</i></label>
                                            <input type="text" id="addressOf1" name="contactLastname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 2:</label>
                                            <input type="text" id="addressOf2" name="address1"class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>City:<i style="color: red">*</i></label>
                                            <input type="text" id="cityOf1" name="customerName" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>State:</label>
                                            <input type="text" id="stateOf1" name="address2" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Country:<i style="color: red">*</i></label>
                                            <input type="text" id="countryOf1" name="city" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Postal code:<i style="color: red">*</i></label>
                                            <input type="text" id="postalCodeOf1" name="state" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Territory:<i style="color: red">*</i></label>
                                            <input type="text" id="territory1" name="country" class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="updateOffice()">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div>
                    <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                        <div class="card-header text-white" style="background-color: #8E1451;">
                            OFFICES
                        </div>
                        <div class="card-body table-wrapper-scroll-y my-custom-scrollbar">
                            <table id="table4" class="table table-responsive table-hover table-light">
                                <thead>
                                <tr>
                                    <th scope="col" class="text-center">Modify</th>
                                    <th scope="col" class="text-center">Delete</th>
                                    <th scope="col">Office code</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address line 1</th>
                                    <th scope="col">Address line 2</th>
                                    <th scope="col">State</th>
                                    <th scope="col">Country</th>
                                    <th scope="col">Postal code</th>
                                    <th scope="col">Territory</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="m-0 vh-100 justify-content-center row align-items-center">
                    <section id="createOffice">
                        <div class="card text-center shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header text-white" style="background-color: #8E1451;">
                                REGISTRATION
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Office code:<i style="color: red">*</i></label>
                                            <input type="text" id="officeCode" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Phone:<i style="color: red">*</i></label>
                                            <input type="text" id="phoneOf" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 1:<i style="color: red">*</i></label>
                                            <input type="text" id="address1Of" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Address line 2:</label>
                                            <input type="text" id="address2Of" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>City:<i style="color: red">*</i></label>
                                            <input type="text" id="cityOf" name="customerName" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>State:</label>
                                            <input type="text" id="stateOf" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group text-left">
                                            <label>Country:<i style="color: red">*</i></label>
                                            <input type="text" id="countryOf" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Postal code:<i style="color: red">*</i></label>
                                            <input type="text" id="postalCodeOf" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group text-left">
                                            <label>Territory:<i style="color: red">*</i></label>
                                            <input type="text" id="territory" class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="button"class="btn btn-outline-success" onclick="insertOffice()">Register</button>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://unpkg.com/feather-icons"></script>
<script>
    feather.replace()
</script>
<script src="https://kit.fontawesome.com/afd8979cda.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="<%=context%>/js/main.js"></script>
<script src="<%=context%>/js/customers.js"></script>
<script src="<%=context%>/css/style.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous">
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>