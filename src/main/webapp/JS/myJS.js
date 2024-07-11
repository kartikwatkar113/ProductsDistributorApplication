function validVender(){
	var vname=document.getElementById("textvender").value;
	let regExp=/^[a-zA-Z]+$/;
	let result=regExp.test(vname);
	if(result==false){
		let errmsg=document.getElementById("errmsg");
		errmsg.innerHTML="Please Enter Valid Vender name :(";
		let btn=document.getElementById("btn");
		btn.disabled=true;
		return false;
	}
	else{
		let errmsg=document.getElementById("errmsg");
		errmsg.innerHTML="";
		let btn=document.getElementById("btn");
		btn.disabled=false;
		return true;
	}

}




function searchVenderUsingAjax(str){
	
	let xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		
		if(this.readyState==4 && this.status==200){
			document.getElementById("showGrid").innerHTML=this.responseText;
		}
	
	};
	xhttp.open("Post","searchVender?vname="+str,true);
	xhttp.send();
}


function validProdPrice(){
	alert("hiiiielll");
	var vname=document.getElementById("textvenderProdPrice").value;
	let regExp=/^[0-9]+$/;
	let result=regExp.test(vname);
	if(result==false){
		let errmsg=document.getElementById("errmsgProdPrice");
		errmsg.innerHTML="Please Enter Valid Product Price :(";
		let btn=document.getElementById("btn");
		btn.disabled=true;
		return false;
	}
	else{
		let errmsg=document.getElementById("errmsgProdPrice");
		errmsg.innerHTML="";
		let btn=document.getElementById("btn");
		btn.disabled=false;
		return true;
	}

}
