
/*
document.getElementById("btn_iniciarSesion").onclick = function () {
  alert("Hola usuario!");
};
*/





/*
function prompter() {
  var reply = prompt("Hola ¿cuál es tu nombre?", "")
  alert ( "Es un gusto tenerte aqui " + reply + "!")
  }
*/






function confirmacion() {
	var pregunta = confirm("¿Deseas ingresar a Opcoin?")
	if (pregunta){
		alert("Te envio ahi rapidamente")
		window.location = "http://127.0.0.1:5500/login.html";
	}
	else{
		alert("Quizas en otro momento...\n Gracias de todas formas")
	}
}




