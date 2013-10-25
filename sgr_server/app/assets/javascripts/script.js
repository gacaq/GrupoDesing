$(function(){
  body = $('body');
  indexGroup = $('.index-group')
  if(indexGroup.length > 0){
    indexItems = indexGroup.find('.thumbnail');
    indexItems.find('.btn').hide();
    indexItems.hover(function(){
      $(this).addClass('hover');
    },function(){
      $(this).removeClass('hover');
    });
    indexItems.click(function(){
      window.location = $(this).find('a').attr('href');
    });
  }
  $('.glyphicons.alarm').tooltip()

  function deleteFields(e){
    e.preventDefault();
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').fadeOut();
  };

  function addAlarms(e){
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    parent = $(this).parent('li');
    grandpa = $(this).closest('.tabbable');
    quantity = grandpa.data('quantity')+1;
    grandpa.data('quantity', quantity);
    parent.removeClass('active');
    parent.siblings('.active').removeClass('active');
    parent.before('<li class="active"><a href="#'+ quantity +'" data-toggle="tab"><span class="glyphicons alarm"><i></i>'+ quantity +'</span></a></li>');
    grandpa.children('.tab-content').children('.active').removeClass('active');
    grandpa.children('.tab-content').append($(this).data('fields').replace(regexp, time));
    $(this).closest('#configuration_setAlarms').children('.tab-content').children('.active').attr('id', quantity);
    console.log(quantity);
    console.log($(this).closest('#configuration_setAlarms').children('.tab-content').children('.active').attr('id'));

  };
  function addFields(e){
    e.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
  };

   $('#configuration_setAlarms .tab-content').delegate(".add_fields", "click", addFields);
   $('#configuration_setRecipe .tab-content').delegate(".add_fields", "click", addFields);
   $('#configuration_setAlarms').delegate(".remove_fields", "click", deleteFields);
   $('#configuration_setRecipe').delegate(".remove_fields", "click", deleteFields);
   $('#configuration_setAlarms .nav').delegate(".add_fields", "click", addAlarms);
})
