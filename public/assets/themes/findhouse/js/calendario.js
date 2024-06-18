$(function(){
   //console.log("leynendo calendario");
});


var calendario = (function(){
   var event  = {},
       events = [];
   
   // private method
   function addEvent(fecha , color){

      // eliminamos el espacio en blanco
      let color_tratado = color.trim();

      // gaurdamos el evento
      event = {
         "fecha":fecha,
         "color":color_tratado
      };

      // chequeamos si el evento existe y actualizamos color si exise sino guardamos el nuevo
      let check_color = look_for_date(fecha);
      if (check_color == undefined)
         events.push(event);
      else
         events[check_color].color = color_tratado;

      console.log("fecha: "+event.fecha);
      console.log("color: "+event.color);
      console.log("vector: "+events);
   }

   // buscamos si existe la fecha en el vector
   function look_for_date(fecha){
      let counter = 0;
      for (x in events) {
         if (events[x].fecha == fecha) {
            return counter;
         }
         counter++;
      }
      return undefined;
   }

   function getEvents(){
      return events;
   }

   // revelar accesos públicos
   // opcionalmente con otros nombres
   return{
      evento: addEvent,
      eventos:getEvents
   };

})();

// abrir ventas | cerrar ventas | ical
function guardarEvento(anchor, fecha){
   let color = $(anchor).attr("data-color");
   if(color == " green"){
      $(anchor).find("li").removeClass(" green").addClass(" naranja");
      $(anchor).attr("data-color"," naranja");
      calendario.evento(fecha," naranja");
   }else if (color == " naranja"){
      $(anchor).find("li").removeClass(" naranja").addClass(" green");
      $(anchor).attr("data-color"," green");
      calendario.evento(fecha," green");
   }// end if
   
   console.log(anchor);
   console.log("fecha:"+fecha);
}

// abrir disponibilidad
function guardarEventoDisponibilidad(anchor, fecha){
   console.log("apretamos botón");
   let color = $(anchor).attr("data-color");
   if(color == " white-green"){
      $(anchor).find("li").removeClass(" white-green").addClass(" white");
      $(anchor).attr("data-color"," white");
      calendario.evento(fecha," white");
   }else if (color == " white"){
      $(anchor).find("li").removeClass(" white").addClass(" white-green");
      $(anchor).attr("data-color"," white-green");
      calendario.evento(fecha," white-green");
   }// end if
}
 

// calendario avantio
function guardarEventoAvantio(anchor, fecha){
   let color = $(anchor).attr("data-color");
   if(color == " white"){
      $(anchor).find("li").removeClass(" white").addClass(" avantio-de-propietario");
      $(anchor).attr("data-color"," avantio-de-propietario");
      calendario.evento(fecha," avantio-de-propietario");
   }else if (color == " avantio-de-propietario"){
      $(anchor).find("li").removeClass(" avantio-de-propietario").addClass(" white");
      $(anchor).attr("data-color"," white");
      calendario.evento(fecha," white");
   }// end if
   //console.log(anchor);
   //console.log("fecha:"+fecha);
}


function validarCalendario(){
   let eventos    = calendario.eventos();
   let formulario = document.getElementById("formulario_ical");
   let fechas_verdes          = document.getElementById("fechas_verdes");
   let fechas_naranjas        = document.getElementById("fechas_naranjas");
   let fechas_blancas_verdes  = document.getElementById("fechas_blancas_verdes");
   let fechas_verdes_vector  = [];
   let fechas_naranjas_vector  = [];
   let fechas_blancas_verdes_vector  = [];
   for (let index = 0; index < eventos.length; index++) {
      console.log("fecha: "+eventos[index].fecha);
      console.log("color: "+eventos[index].color);
      if (eventos[index].color == "green"){
         fechas_verdes_vector.push(eventos[index].fecha);
      }else if (eventos[index].color == "naranja"){
         fechas_naranjas_vector.push(eventos[index].fecha);
      }else if(eventos[index].color == "white-green"){
         fechas_blancas_verdes_vector.push(eventos[index].fecha);   
      }
   }
   
   // add , to vector element
   fechas_verdes_vector.join(",");
   fechas_naranjas_vector.join(",");
   fechas_blancas_verdes_vector.join(",");
   
   fechas_verdes.value = fechas_verdes_vector;
   fechas_naranjas.value = fechas_naranjas_vector;
   fechas_blancas_verdes.value = fechas_blancas_verdes_vector;   

   return true;
   
}


function validarCalendarioAvantio(){
   let eventos    = calendario.eventos();
   let formulario = document.getElementById("formulario_ical");
   let fechas_verdes     = document.getElementById("fechas_white");
   let fechas_naranjas     = document.getElementById("fechas_avantio_de_propietario");
   let fechas_verdes_vector  = [];
   let fechas_naranjas_vector  = [];
   for (let index = 0; index < eventos.length; index++) {
      console.log("fecha: "+eventos[index].fecha);
      console.log("color: "+eventos[index].color);
      if (eventos[index].color == "white"){
         fechas_verdes_vector.push(eventos[index].fecha);
      }else if (eventos[index].color == "fechas_avantio_de_propietario"){
         fechas_naranjas_vector.push(eventos[index].fecha);
      }
   }
   // add , to vector element
   fechas_verdes_vector.join(",");
   fechas_naranjas_vector.join(",");
   fechas_verdes.value = fechas_verdes_vector;
   fechas_naranjas.value = fechas_naranjas_vector;
   
   return true;
}