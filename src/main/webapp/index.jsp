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
    <link rel="stylesheet" href="<%=context%>/css/all.min.css">
    <title>Customer</title>
</head>
<body>
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
                                <input type="number" id="customerNumber1" name="customerNumber" class="form-control" required>
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
                                <label>Address line 2:<i style="color: red">*</i></label>
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
                                <label>State:<i style="color: red">*</i></label>
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
                                <label>Postal code:<i style="color: red">*</i></label>
                                <input type="text" id="code1" name="code" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group text-left">
                                <label>Sales rep emp number:<i style="color: red">*</i></label>
                                <input type="number" id="salesRep1" name="salesRep" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group text-left">
                                <label>Credit limit:<i style="color: red">*</i></label>
                                <input type="text" id="credit1" name="credit" class="form-control" required>
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
                        <button type="button"class="btn btn-outline-success" onclick="updateCustomer()">Guardar cambios</button>
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
                        <th scope="col">Contact firstname<i class="fas fa-edit"></i></th>
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
                                <label>Address line 2:<i style="color: red">*</i></label>
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
                                <label>State:<i style="color: red">*</i></label>
                                <input type="text" id="state" name="state" class="form-control" required>
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
                                <label>Postal code:<i style="color: red">*</i></label>
                                <input type="text" id="code" name="code" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-6 col-sm-3">
                            <div class="form-group text-left">
                                <label>Sales rep employee number:<i style="color: red">*</i></label>
                                <input type="number" id="salesRep" name="salesRep" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-6 col-sm-3">
                            <div class="form-group text-left">
                                <label>Credit limit:<i style="color: red">*</i></label>
                                <input type="text" id="credit" name="credit" class="form-control" required>
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
                        <button type="button"class="btn btn-outline-success" onclick="insertCustomer()">Registrar</button>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
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