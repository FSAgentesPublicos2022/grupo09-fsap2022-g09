
/*
document.getElementById("btn_iniciarSesion").onclick = function () {
  alert("Hola usuario!");
};
*/








function confirmacion() {
  var pregunta = confirm("¿Deseas ingresar a Opcoin?");
		if (pregunta) {
			var reply = prompt("Hola ¿cuál es tu nombre?", "");
			alert("Es un gusto tenerte aqui " + reply + "!");
			window.location = "https://upload.wikimedia.org/wikipedia/en/thumb/1/1d/Page_Under_Construction.png/640px-Page_Under_Construction.png";
		} else {
			alert("Quizas en otro momento...\n Gracias de todas formas");
		}
}






$('.navbar-collapse a').click(function () {
	$(".navbar-collapse").collapse('hide');
});
