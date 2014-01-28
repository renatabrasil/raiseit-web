// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery_nested_form
//= require_tree .

/**  
  * Função Principal 
  * @param w - O elemento que será aplicado (normalmente this).
  * @param e - O evento para capturar a tecla e cancelar o backspace.
  * @param m - A máscara a ser aplicada.
  * @param r - Se a máscara deve ser aplicada da direita para a esquerda. Veja Exemplos.
  * @param a - 
  * @returns null  
  */
function maskIt(w,e,m,r,a){
        
        // Cancela se o evento for Backspace
        if (!e) var e = window.event
        if (e.keyCode) code = e.keyCode;
        else if (e.which) code = e.which;
        
        // Variáveis da função
        var txt  = (!r) ? w.value.replace(/[^\d]+/gi,'') : w.value.replace(/[^\d]+/gi,'').reverse();
        var mask = (!r) ? m : m.reverse();
        var pre  = (a ) ? a.pre : "";
        var pos  = (a ) ? a.pos : "";
        var ret  = "";

        // Tirei porque quando passava da mascara aceitava qualquer coisa.
        //if(code == 9 || code == 8 || txt.length == mask.replace(/[^#]+/g,'').length) return false;
        
        if(code == 9 || code == 8) return false;

        // Loop na máscara para aplicar os caracteres
        for(var x=0,y=0, z=mask.length;x<z && y<txt.length;){
                if(mask.charAt(x)!='#'){
                        ret += mask.charAt(x); x++;
                } else{
                        ret += txt.charAt(y); y++; x++;
                }
        }
        
        // Retorno da função
        ret = (!r) ? ret : ret.reverse()        
        w.value = pre+ret+pos;
}

/* Função usada para so permirtir que o usuario digite numeros */
function somenteNumero(campo, event) {

    var tecla = (event!=null)? event.keyCode: 0;

	if ( ((tecla < 48) || (tecla > 57))  &&
		 ((tecla < 96) || (tecla > 105)) &&
		 (tecla != 0) )

    var rExp = /[^\0-\9]|\-|,|:|;|\./g;
    var vr = campo.value.replace(rExp, "");
    campo.value = vr;
}

/*
* Algumas máscaras e funções proprias
* Author: Renata Brasil
*/
//Fun??o que recebe um valor(float) e retornar? o valor formatado.
function formatarValor(valor) {
  var valorFormatado ="";
  vr = valor.value.toString();

  if(vr.indexOf(",") != -1){
    centavos = vr.substring(vr.indexOf(",")+1,vr.length);
    if(centavos.length == 1){
      vr = vr.concat("0");
    }
  }
  else{
    //vr = vr.concat(".0");
  }

  //vr = vr.replace( "/", "" );

  vr = vr.replace( "/", "" );
  vr = vr.replace( ",", "" );
  vr = vr.replace( ".", "" );
  vr = vr.replace( ".", "" );
  vr = vr.replace( ".", "" );
  vr = vr.replace( ".", "" );
  tam = vr.length;

  if ( tam < 2 ){
    valorFormatado = vr ; }
  if ( (tam >= 2) && (tam <= 5) ){
    valorFormatado = vr.substr( 0, tam - 2 ) + ',' + vr.substr( tam - 2, tam ) ; }
  if ( (tam >= 6) && (tam <= 8) ){
    valorFormatado = vr.substr( 0, tam - 5 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
  if ( (tam >= 9) && (tam <= 11) ){
    valorFormatado = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
  if ( (tam >= 12) && (tam <= 14) ){
    valorFormatado = vr.substr( 0, tam - 11 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
  if ( (tam >= 15) && (tam <= 17) ){
    valorFormatado = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ;}

  valor.value = valorFormatado;
}

function toUppercase(obj){
  var caretPos = doGetCaretPosition(obj);
  obj.value = obj.value.toUpperCase();
  setCaretPosition(obj, caretPos);
}

