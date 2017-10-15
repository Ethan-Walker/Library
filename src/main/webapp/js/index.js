$(function() {
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.index-link');

		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)

        links.on("click",{el: this.el, multiple: this.multiple},function(e){
            var $this = $(this);
            var $el = e.data.el;
            var $next = $this.next();
            $next.slideToggle();
            $this.parent().addClass('open');
            $this.parent().siblings().removeClass("open");
            if (!e.data.multiple) {
            	$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
            };
        })
	}

	Accordion.prototype.dropdown = function(e) {
		// var $el = e.data.el;
		// 	$this = $(this),
		// 	$next = $this.next();
        //
		// $next.slideToggle();
		// $this.parent().toggleClass('open');
        //
		// if (!e.data.multiple) {
		// 	$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		// };
	}	

	var accordion = new Accordion($('#accordion'), false);
});