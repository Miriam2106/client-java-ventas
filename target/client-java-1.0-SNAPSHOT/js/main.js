const customers = () => {
    $.ajax({
        method: "GET",
        url: 'http://localhost:8080/java_rest_crud_costumer_war_exploded/customer'
    }).done(function(res){
        let content = "";

        for(let i = 0; i < res.length; i++){
            content += `
            <tr>
                <td>
                    <button title="Modify" onclick="getCustomerById(${ res[i].customerNumber })" type="button" data-toggle="modal" data-target=".modal-customer" class="btn btn-outline-warning"><i class="far fa-edit"></i></span></i></button>
                </td>
                <td>
                    <button title="Delete" onclick="deleteCustomer(${ res[i].customerNumber })" class="btn btn-outline-danger"><i class="far fa-trash-alt"></i></button>
                </td>
                <td>${ res[i].customerNumber }</td>
                <td>${ res[i].customerName }</td>
                <td>${ res[i].contactFirstname }</td>
                <td>${ res[i].contactLastname }</td>
                <td>${ res[i].phone }</td>
                <td>${ res[i].addressLine1 }</td>
                <td>${ res[i].addressLine2 }</td>
                <td>${ res[i].city }</td>
                <td>${ res[i].state }</td>
                <td>${ res[i].postalCode }</td>
                <td>${ res[i].country }</td>
                <td>${ res[i].salesRepEmployeeNumber }</td>
                <td>${ res[i].creditLimit }</td>
            </tr>
        `;
        }
        $("#table > tbody").html(content);
    });
}

const insertCustomer = () => {
    let customer = new Object();
    customer.customerNumber = document.getElementById("customerNumber").value;
    customer.customerName = document.getElementById("customerName").value;
    customer.contactLastname = document.getElementById("contactLastname").value;
    customer.contactFirstname = document.getElementById("contactFirstname").value;
    customer.phone = document.getElementById("phone").value;
    customer.addressLine1 = document.getElementById("address1").value;
    customer.addressLine2 = document.getElementById("address2").value;
    customer.city = document.getElementById("city").value;
    customer.state = document.getElementById("state").value;
    customer.postalCode = document.getElementById("code").value;
    customer.country = document.getElementById("country").value;
    customer.salesRepEmployeeNumber = document.getElementById("salesRep").value;
    customer.creditLimit = document.getElementById("credit").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: "http://localhost:8080/java_rest_crud_costumer_war_exploded/customer/save",
        data: customer,
    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Customer could not be registered',
                text: 'There may be an error in the data entered. Check it'
            })
        }else{
            Swal.fire({
                icon: 'success',
                title: 'The customer has been registered',
                confirmButtonText: 'Ok'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const updateCustomer = ()=>{
    let customer = new Object();
    customer.customerNumber = document.getElementById("customerNumber1").value;
    customer.customerName = document.getElementById("customerName1").value;
    customer.contactLastname = document.getElementById("contactLastname1").value;
    customer.contactFirstname = document.getElementById("contactFirstname1").value;
    customer.phone = document.getElementById("phone1").value;
    customer.addressLine1 = document.getElementById("addressL1").value;
    customer.addressLine2 = document.getElementById("addressL2").value;
    customer.city = document.getElementById("city1").value;
    customer.state = document.getElementById("state1").value;
    customer.postalCode = document.getElementById("code1").value;
    customer.country = document.getElementById("country1").value;
    customer.salesRepEmployeeNumber = document.getElementById("salesRep1").value;
    customer.creditLimit = document.getElementById("credit1").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/customer/save/${customer.customerNumber}`,
        data: customer,

    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Customer could not be modified',
                text: 'The customer was not modified'
            })
        }else{
            Swal.fire({
                title: 'The customer has been modified',
                confirmButtonText: 'Ok',
                icon: 'success',
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const getCustomerById=(customerNumber)=>{
    $.ajax({
        method: "GET",
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/customer/${customerNumber}`
    }).done(function(res){
        document.getElementById("customerNumber1").value = res.customerNumber
        document.getElementById("customerName1").value = res.customerName
        document.getElementById("contactFirstname1").value=res.contactFirstname
        document.getElementById("contactLastname1").value=res.contactLastname
        document.getElementById("phone1").value=res.phone
        document.getElementById("addressL1").value=res.addressLine1
        document.getElementById("addressL2").value=res.addressLine2
        document.getElementById("city1").value=res.city
        document.getElementById("state1").value=res.state
        document.getElementById("code1").value=res.postalCode
        document.getElementById("country1").value=res.country
        document.getElementById("salesRep1").value=res.salesRepEmployeeNumber
        document.getElementById("credit1").value=res.creditLimit
    });
}

const deleteCustomer=(customerNumber)=>{
    $.ajax({
        method: "POST",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/customer/delete/${customerNumber}`
    }).done(function(res){
        if(res==false){
            Swal.fire({
                icon: 'error',
                title: 'The customer could not be removed',
                text: 'Check the data'
            })
        }else{
            Swal.fire({
                title: 'The customer has been removed!',
                confirmButtonText: 'Ok',
                icon: 'success',
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

//Products
const products = () => {
    $.ajax({
        method: "GET",
        url: 'http://localhost:8080/java_rest_crud_costumer_war_exploded/products'
    }).done(function(res){
        let content = "";

        for(let i = 0; i < res.length; i++){
            content += `
            <tr>
                <td>
                    <button title="Modify" onclick="getProductById('${ res[i].productCode }')" type="button" data-toggle="modal" data-target=".modal-product" class="btn btn-outline-warning"><i class="far fa-edit"></i></span></i></button>
                </td>
                <td>
                    <button title="Delete" onclick="deleteProduct('${ res[i].productCode }')" class="btn btn-outline-danger"><i class="far fa-trash-alt"></i></button>
                </td>
                <td>${ res[i].productCode }</td>
                <td>${ res[i].productName }</td>
                <td>${ res[i].productLine }</td>
                <td>${ res[i].productScale }</td>
                <td>${ res[i].productVendor }</td>
                <td>${ res[i].productDescription }</td>
            </tr>
        `;
        }
        $("#table2 > tbody").html(content);
    });
}

const insertProduct = () => {
    let p = new Object();
    p.productCode = document.getElementById("productCode").value;
    p.productName = document.getElementById("productName").value;
    p.productLine = document.getElementById("productLine").value;
    p.productScale = document.getElementById("productScale").value;
    p.productVendor = document.getElementById("productVendor").value;
    p.productDescription = document.getElementById("productDescription").value;
    p.quantityInStock = document.getElementById("quantity").value;
    p.buyPrice = document.getElementById("buyPrice").value;
    p.MSRP = document.getElementById("msrp").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: "http://localhost:8080/java_rest_crud_costumer_war_exploded/products/save",
        data: p,
    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Product could not be registered',
                text: 'There may be an error in the data entered. Check it'
            })
        }else{
            Swal.fire({
                icon: 'success',
                title: 'The product has been registered',
                confirmButtonText: 'Ok'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const updateProduct = ()=>{
    let p = new Object();
    p.productCode = document.getElementById("productCode1").value;
    p.productName = document.getElementById("productName1").value;
    p.productLine = document.getElementById("productLine1").value;
    p.productScale = document.getElementById("productScale1").value;
    p.productVendor = document.getElementById("productVendor1").value;
    p.productDescription = document.getElementById("productDescription1").value;
    p.quantityInStock = document.getElementById("quantity1").value;
    p.buyPrice = document.getElementById("buyPrice1").value;
    p.MSRP = document.getElementById("msrp1").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/products/save/${p.productCode}`,
        data: p,

    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Product could not be modified',
                text: 'The product was not modified'
            })
        }else{
            Swal.fire({
                title: 'The product has been modified',
                confirmButtonText: 'Ok',
                icon: 'success',
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const getProductById=(productCode)=>{
    $.ajax({
        method: "GET",
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/products/${productCode}`
    }).done(function(res){
        document.getElementById("productCode1").value = res.productCode;
        document.getElementById("productName1").value = res.productName;
        document.getElementById("productLine1").value = res.productLine;
        document.getElementById("productScale1").value = res.productScale;
        document.getElementById("productVendor1").value = res.productVendor;
        document.getElementById("productDescription1").value = res.productDescription;
        document.getElementById("quantity1").value = res.quantityInStock;
        document.getElementById("buyPrice1").value = res.buyPrice;
        document.getElementById("msrp1").value = res.MSRP;
    });
}

const deleteProduct=(productCode)=>{
    $.ajax({
        method: "POST",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/products/delete/${productCode}`
    }).done(function(res){
        if(res==false){
            Swal.fire({
                icon: 'error',
                title: 'The product could not be removed',
                text: 'Check the data'
            })
        }else{
            Swal.fire({
                title: 'The product has been removed!',
                confirmButtonText: 'Ok',
                icon: 'success',
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

//Offices
const office = () => {
    $.ajax({
        method: "GET",
        url: 'http://localhost:8080/java_rest_crud_costumer_war_exploded/offices'
    }).done(function(res){
        let content = "";

        for(let i = 0; i < res.length; i++){
            content += `
            <tr>
                <td>
                    <button title="Modify" onclick="getOfficeById('${ res[i].officeCode }')" type="button" data-toggle="modal" data-target=".modal-office" class="btn btn-outline-warning"><i class="far fa-edit"></i></span></i></button>
                </td>
                <td>
                    <button title="Delete" onclick="deleteOffice('${ res[i].officeCode }')" class="btn btn-outline-danger"><i class="far fa-trash-alt"></i></button>
                </td>
                <td>${ res[i].officeCode }</td>
                <td>${ res[i].city }</td>
                <td>${ res[i].phone }</td>
                <td>${ res[i].addressLine1 }</td>
                <td>${ res[i].addressLine2 }</td>
                <td>${ res[i].state }</td>
                <td>${ res[i].country }</td>
                <td>${ res[i].postalCode }</td>
                <td>${ res[i].territory }</td>
            </tr>
        `;
        }
        $("#table4 > tbody").html(content);
    });
}

const insertOffice = () => {
    let o = new Object();
    o.officeCode = document.getElementById("officeCode").value;
    o.city = document.getElementById("cityOf").value;
    o.phone = document.getElementById("phoneOf").value;
    o.addressLine1 = document.getElementById("address1Of").value;
    o.addressLine2 = document.getElementById("address2Of").value;
    o.state = document.getElementById("stateOf").value;
    o.country = document.getElementById("countryOf").value;
    o.postalCode = document.getElementById("postalCodeOf").value;
    o.territory = document.getElementById("territory").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: "http://localhost:8080/java_rest_crud_costumer_war_exploded/offices/save",
        data: o,
    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Office could not be registered',
                text: 'There may be an error in the data entered. Check it'
            })
        }else{
            Swal.fire({
                icon: 'success',
                title: 'The office has been registered',
                confirmButtonText: 'Ok'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const updateOffice = ()=>{
    let o = new Object();
    o.officeCode = document.getElementById("officeCode1").value;
    o.city = document.getElementById("cityOf1").value;
    o.phone = document.getElementById("phoneOf1").value;
    o.addressLine1 = document.getElementById("addressOf1").value;
    o.addressLine2 = document.getElementById("addressOf2").value;
    o.state = document.getElementById("stateOf1").value;
    o.country = document.getElementById("countryOf1").value;
    o.postalCode = document.getElementById("postalCodeOf1").value;
    o.territory = document.getElementById("territory1").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/offices/save/${o.officeCode}`,
        data: o,
    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Office could not be modified',
                text: 'The office was not modified'
            })
        }else{
            Swal.fire({
                title: 'The office has been modified',
                confirmButtonText: 'Ok',
                icon: 'success',
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const getOfficeById=(officeCode)=>{
    $.ajax({
        method: "GET",
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/offices/${officeCode}`
    }).done(function(res){
        document.getElementById("officeCode1").value = res.officeCode;
        document.getElementById("cityOf1").value = res.city;
        document.getElementById("phoneOf1").value = res.phone;
        document.getElementById("addressOf1").value = res.addressLine1;
        document.getElementById("addressOf2").value = res.addressLine2;
        document.getElementById("stateOf1").value = res.state;
        document.getElementById("countryOf1").value = res.country;
        document.getElementById("postalCodeOf1").value = res.postalCode;
        document.getElementById("territory1").value = res.territory;
    });
}

const deleteOffice=(officeCode)=>{
    $.ajax({
        method: "POST",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/offices/delete/${officeCode}`
    }).done(function(res){
        if(res==false){
            Swal.fire({
                icon: 'error',
                title: 'The office could not be removed',
                text: 'Check the data'
            })
        }else{
            Swal.fire({
                title: 'The office has been removed!',
                confirmButtonText: 'Ok',
                icon: 'success',
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

//PRODUCT LINES

const productLines = () => {
    $.ajax({
        method: "GET",
        url: 'http://localhost:8080/java_rest_crud_costumer_war_exploded/productLines'
    }).done(function(res){
        let content = "";

        for(let i = 0; i < res.length; i++){
            content += `
            <tr>
                <td>
                    <button title="Modify" onclick="getProductLineById('${ res[i].productLine }')" type="button" data-toggle="modal" data-target=".modal-productline" class="btn btn-outline-warning"><i class="far fa-edit"></i></span></i></button>
                </td>
                <td>
                    <button title="Delete" onclick="deleteProductLine('${ res[i].productLine }')" class="btn btn-outline-danger"><i class="far fa-trash-alt"></i></button>
                </td>
                <td>${ res[i].productLine }</td>
                <td>${ res[i].textDescription }</td>
                <td>${ res[i].htmlDescription }</td>
                <td>${ res[i].image }</td>
            </tr>
        `;
        }
        $("#table3 > tbody").html(content);
    });
}

const insertProductLine = () => {
    let pl = new Object();
    pl.productLine = document.getElementById("productL").value;
    pl.textDescription = document.getElementById("txtDesc").value;
    pl.htmlDescription = document.getElementById("htmlDesc").value;
    pl.image = document.getElementById("image").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: "http://localhost:8080/java_rest_crud_costumer_war_exploded/productLines/save",
        data: pl,
    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Product line could not be registered',
                text: 'There may be an error in the data entered. Check it'
            })
        }else{
            Swal.fire({
                icon: 'success',
                title: 'The product line has been registered',
                confirmButtonText: 'Ok'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const updateProductLine = () => {
    let pl = new Object();
    pl.productLine = document.getElementById("productL1").value;
    pl.textDescription = document.getElementById("txtDesc1").value;
    pl.htmlDescription = document.getElementById("htmlDesc1").value;
    pl.image = document.getElementById("image1").value;
    $.ajax({
        type: 'POST',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/productLines/save/${pl.productLine}`,
        data: pl,
    }).done(function(res) {
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'Product line could not be modified',
                text: 'There may be an error in the data entered. Check it'
            })
        }else{
            Swal.fire({
                icon: 'success',
                title: 'The product line has been modified',
                confirmButtonText: 'Ok'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}

const getProductLineById=(productLine)=>{
    $.ajax({
        method: "GET",
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/productLines/${productLine}`
    }).done(function(res){
        document.getElementById("productL1").value = res.productLine;
        document.getElementById("txtDesc1").value = res.textDescription;
        document.getElementById("htmlDesc1").value = res.htmlDescription;
        document.getElementById("image1").value = res.image;
    });
}

const deleteProductLine=(productLine)=>{
    $.ajax({
        method: "POST",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
        },
        url: `http://localhost:8080/java_rest_crud_costumer_war_exploded/productLines/delete/${productLine}`
    }).done(function(res){
        if(res==false){
            Swal.fire({
                icon: 'error',
                title: 'The product line could not be removed',
                text: 'Check the data'
            })
        }else{
            Swal.fire({
                title: 'The product line has been removed!',
                confirmButtonText: 'Ok',
                icon: 'success',
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://localhost:8084/client_java_war_exploded/index.jsp"
                }
            })
        }
    });
}
