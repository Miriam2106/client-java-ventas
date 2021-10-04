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
                title: 'The customer has been registered'
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
                title: 'The client has been modified',
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
        if(res==null){
            Swal.fire({
                icon: 'error',
                title: 'The client could not be removed',
                text: 'Check the data'
            })
        }else{
            Swal.fire({
                title: 'The client has been removed!',
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
