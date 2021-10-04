$.ajax({
    method: "GET",
    url: 'http://localhost:8080/java_rest_crud_costumer_war_exploded/customer'
}).done(function(res){
    let content = "";
    let table = document.getElementById("table")
    let tbody = document.getElementById("tbody")

    for(let i = 0; i < res.length; i++){
        content += `
            <tr>
                <td>
                    <button title="Modify" onclick="getCustomerById(${ res[i].customerNumber })" type="button" data-toggle="modal" data-target=".modal-customer" class="btn btn-outline-warning"><i class="fas fa-edit"></i></button>
                </td>
                <td>
                    <button title="Delete" onclick="deleteCustomer(${ res[i].customerNumber })" class="btn btn-outline-danger"><i class="fas fa-trash"></i></button>
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
