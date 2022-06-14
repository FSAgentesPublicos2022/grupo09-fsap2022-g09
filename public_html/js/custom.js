
document.getElementById("btn_iniciarSesion").onclick = function () {
  alert("Hola usuario!");
};




function prompter() {
  var reply = prompt("Hola ¿cuál es tu nombre?", "")
  alert ( "Es un gusto tenerte aqui " + reply + "!")
  }






function confirmacion() {
	var pregunta = confirm("¿Deseas visitar la pagina principal?")
	if (pregunta){
		alert("Te envio ahi rapidamente")
		window.location = "https://www.google.com/";
	}
	else{
		alert("Quizas en otro momento...\n Gracias de todas formas")
	}
}




