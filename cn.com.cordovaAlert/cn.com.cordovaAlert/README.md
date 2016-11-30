//alert
CordovaAlert.startAlert(function(){console.log("");},"","","");


//confirm
CordovaAlert.startConfirm(function(){console.log("");},function(){console.log("");},"","","","");


//
CordovaAlert.startAlert(function(){
     console.log("");
     CordovaAlert.startConfirm(function(){
        console.log("");
     },function(){
        console.log("");
     },"confirm","","","");
},"","","");

