
// // Fecha Límite

$('.ofert_date').each(function() {
    const expiry_date_string = $(this).data('date');
    if(expiry_date_string != undefined) {
      const expiry_date = new Date(expiry_date_string);
      const today = new Date();
      expiry_date.setHours(0,0,0,0);
      today.setHours(0,0,0,0);
      const days_diff = (expiry_date - today) / (1000 * 60 * 60 * 24) + 1;
  
      if(days_diff < 7) {
        $(this).append("<span class=\"badge bg-danger\">Acaba pronto</span>");
      } else {
        $(this).append("<p>Te quedan sólo " + days_diff + " días para aprovechar esta oferta</p>");
      }
    }
  });


// VALORACION CON ESTRELLAS

// $(function () {
//     $(".rateyo").rateYo().on("rateyo.change", function (e, data) {
//       var rating = data.rating;
//       $(this).parent().find('.score').text('score :'+ $(this).attr('data-rateyo-score'));
//       $(this).parent().find('.result').text('rating :'+ rating);
//      });
//   });

$(
  function () {
      $(".v1").rateYo({
          rating: 3,
          readOnly: true
      });

      $(".v2").rateYo({
          rating: 4,
          readOnly: true
      });

      $(".v3").rateYo({
          rating: 5,
          readOnly: true,
      });

      $(".v4").rateYo({
          rating: 4.5,
          readOnly: true,
      });
  }
);





// TEXTO DE NEON

$('#header').neonText({
      textColor:'#FFFFFF',
      textSize:'40pt',
      neonHighlight:'#FFFFFF',
      neonHighlightColor:'#FF00DE',
      neonHighlightHover:'#00FFFF',
      neonFontHover:'#FFFFFF'
    
    });
