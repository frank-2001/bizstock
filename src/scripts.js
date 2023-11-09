
let user=JSON.parse(localStorage.getItem("sm-user"))
function dec() {
    localStorage.clear()
    window.location.reload()
}
if (user==null && location.href.split("/").slice(-1)!="index.html") {
    window.open("index.html","_self")
}
else if (user.entreprise==null && location.href.split("/").slice(-1)!="index.html") {
    window.open("index.html","_self")
}
function req(url_req,formData) {
        let dict={}
        for(var i of formData.entries()){
            dict[i[0]]=i[1];
        }
        $.ajax({
            type: "POST",
            url: url_req,
            data: dict,
            dataType: "json",
            success: function (response) {
                if (response.state==true) {
                    alert("Operation effectuée evec succes")
                }else{
                    alert("Operation non effectuée")
                }
            },
        }).fail( function (e) {
            console.log(e);
            alert("Le serveur ne repond pas")
          });
}
function dreq(url_req) {
    let dict={}
    $.ajax({
        type: "POST",
        url: url_req,
        data: dict,
        dataType: "json",
        success: function (response) {
            if (response.state==true) {
                alert("Operation effectuée evec succes")
            }else{
                alert("Echec!!")
            }
        },
    }).fail( function (e) {
        console.log(e);
        alert("erreur")
      });
}

// $.getJSON("server/?section-all",
//     function (data, textStatus, jqXHR) {
//         if (data.state) {
//             data.data.forEach(e => {
//                 $(".section-all").append(`<option>${e.nomination}</option>`);
//             });
//         } 
//     }
// );
// $.getJSON("server/?classe-all",
//     function (data, textStatus, jqXHR) {
//         if (data.state) {
//             data.data.forEach(e => {
//                 $(".classe-all").append(`<option>${e.nomination}</option>`);
//             });
//         } 
//     }
//     );
// $.getJSON("server/?cours-all",
//     function (data, textStatus, jqXHR) {
//         if (data.state) {
//             // console.log($(".cours-all"));
//             data.data.forEach(e => {
//                 $(".cours-all").append(`<option>${e.nomination}</option>`);
//             });
//         } 
//     }
// );


// Fonction de chargement des donnes et les enregistre dans localStorage pour une utilisation hors-ligne
let ese=JSON.parse(localStorage.getItem("sm-entreprise"))
function loadDataAdmin() {
    $.post("server2/?succursale-by", {"idEntreprise":ese.id},
        function (data, textStatus, jqXHR) {
            localStorage.setItem("sm-succursale",JSON.stringify(data.data))
        },
        "json"
    );
    $.post("server2/?stock_entreprise-by", {"id_entreprise":ese.id},
        function (data, textStatus, jqXHR) {
            localStorage.setItem("sm-stock",JSON.stringify(data.data))
        },
        "json"
    );
}
let userSuccursale
function loadDataUser() {
    $.post("server2/?succursale-by", {"id":user.id_succursale},
        function (data, textStatus, jqXHR) {
            localStorage.setItem("sm-succursale",JSON.stringify(data.data[0]))
            userSuccursale=data.data[0]
            $("#user").text("Succursalle - "+userSuccursale.nomSuccur);
        },
        "json"
    );
    $.post("server2/?stock_entreprise-by", {"id_entreprise":ese.id},
        function (data, textStatus, jqXHR) {
            localStorage.setItem("sm-stock",JSON.stringify(data.data))
        },
        "json"
    );
}